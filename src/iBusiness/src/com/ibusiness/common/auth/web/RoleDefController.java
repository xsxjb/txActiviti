package com.ibusiness.common.auth.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ibusiness.bridge.scope.ScopeConnector;
import com.ibusiness.common.auth.component.CheckRoleException;
import com.ibusiness.common.auth.component.RoleDefChecker;
import com.ibusiness.common.auth.dao.RoleDao;
import com.ibusiness.common.auth.dao.RoleDefDao;
import com.ibusiness.common.auth.entity.Role;
import com.ibusiness.common.auth.entity.RoleDef;
import com.ibusiness.common.auth.suppor.RoleDTO;
import com.ibusiness.common.page.Page;
import com.ibusiness.common.page.PropertyFilter;
import com.ibusiness.core.mapper.BeanMapper;
import com.ibusiness.core.spring.MessageHelper;
import com.ibusiness.security.api.scope.ScopeDTO;
import com.ibusiness.security.api.scope.ScopeHolder;

@Controller
@RequestMapping("auth")
public class RoleDefController {
    private static Logger logger = LoggerFactory.getLogger(RoleDefController.class);
    private RoleDefDao roleDefDao;
    private RoleDao roleDao;
    private MessageHelper messageHelper;
    private RoleDefChecker roleDefChecker;
    private BeanMapper beanMapper = new BeanMapper();
    private ScopeConnector scopeConnector;

    @RequestMapping("role-def-list")
    public String list(@ModelAttribute
    Page page, @RequestParam
    Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        propertyFilters.add(new PropertyFilter("EQS_scopeId", ScopeHolder.getScopeId()));
        page = roleDefDao.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);

        return "common/auth/role-def-list.jsp";
    }

    @RequestMapping("role-def-input")
    public String input(@RequestParam(value = "id", required = false)
    Long id, Model model) {
        if (id != null) {
            RoleDef roleDef = roleDefDao.get(id);
            model.addAttribute("model", roleDef);
        }

        return "common/auth/role-def-input.jsp";
    }

    @RequestMapping("role-def-save")
    public String save(@ModelAttribute
    RoleDef roleDef, RedirectAttributes redirectAttributes) {
        try {
            // before check
            roleDefChecker.check(roleDef);

            // after invoke
            RoleDef dest = null;
            Long id = roleDef.getId();

            if (id != null) {
                dest = roleDefDao.get(id);
                beanMapper.copy(roleDef, dest);
            } else {
                dest = roleDef;
            }

            if (id == null) {
                dest.setScopeId(ScopeHolder.getScopeId());
            }

            roleDefDao.save(dest);

            messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        } catch (CheckRoleException ex) {
            logger.warn(ex.getMessage(), ex);
            redirectAttributes.addFlashAttribute("message", ex.getMessage());

            return "common/auth/role-def-input.jsp";
        }

        return "redirect:/auth/role-def-list.do";
    }

    @RequestMapping("role-def-remove")
    public String remove(@RequestParam("selectedItem")
    List<Long> selectedItem, RedirectAttributes redirectAttributes) {
        try {
            List<RoleDef> roleDefs = roleDefDao.findByIds(selectedItem);

            for (RoleDef roleDef : roleDefs) {
                roleDefChecker.check(roleDef);
            }

            roleDefDao.removeAll(roleDefs);
            messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");
        } catch (CheckRoleException ex) {
            logger.warn(ex.getMessage(), ex);

            messageHelper.addFlashMessage(redirectAttributes, ex.getMessage());
        }

        return "redirect:/auth/role-def-list.do";
    }

    @RequestMapping("role-def-checkName")
    @ResponseBody
    public boolean checkName(@RequestParam("name")
    String name, @RequestParam(value = "id", required = false)
    Long id) throws Exception {
        String hql = "from RoleDef where scopeId=" + ScopeHolder.getScopeId() + " and name=?";
        Object[] params = {
            name };

        if (id != null) {
            hql = "from RoleDef where scopeId=" + ScopeHolder.getScopeId() + " and name=? and id<>?";
            params = new Object[] {
                    name, id };
        }

        boolean result = roleDefDao.findUnique(hql, params) == null;

        return result;
    }

    @RequestMapping("role-def-manage")
    public String manage(@RequestParam("id") Long id, Model model) throws Exception {
        RoleDef roleDef = roleDefDao.get(id);
        List<Role> roles = roleDao.findBy("roleDef.id", id);

        ScopeDTO currentScope = ScopeHolder.getScopeDto();
        List<ScopeDTO> scopeDtos;

        if (currentScope.isShared()) {
            scopeDtos = scopeConnector.findAll();
        } else {
            scopeDtos = new ArrayList<ScopeDTO>();
            scopeDtos.add(currentScope);
        }

        List<RoleDTO> roleDtos = new ArrayList<RoleDTO>();

        for (ScopeDTO scopeDto : scopeDtos) {
            Role existedRole = null;

            for (Role role : roles) {
                if (role.getScopeId().equals(scopeDto.getId())) {
                    existedRole = role;

                    break;
                }
            }

            if (existedRole == null) {
                RoleDTO roleDto = new RoleDTO();
                roleDto.setName(roleDef.getName());
                roleDto.setScopeId(scopeDto.getId());
                roleDto.setStatus("added");
                roleDtos.add(roleDto);
            } else {
                RoleDTO roleDto = new RoleDTO();
                roleDto.setName(roleDef.getName());
                roleDto.setId(existedRole.getId());
                roleDto.setScopeId(scopeDto.getId());
                roleDto.setStatus("existed");
                roleDtos.add(roleDto);
            }
        }

        for (Role role : roles) {
            boolean existed = false;

            for (ScopeDTO scopeDto : scopeDtos) {
                if (role.getScopeId().equals(scopeDto.getId())) {
                    existed = true;

                    break;
                }
            }

            if (!existed) {
                RoleDTO roleDto = new RoleDTO();
                roleDto.setName(roleDef.getName());
                roleDto.setId(role.getId());
                roleDto.setScopeId(role.getScopeId());
                roleDto.setStatus("removed");
                roleDtos.add(roleDto);
            }
        }

        model.addAttribute("roleDts", roleDtos);

        return "common/auth/role-def-manage.jsp";
    }

    @RequestMapping("role-def-sync")
    public String sync(@RequestParam("id")
    Long id) throws Exception {
        RoleDef roleDef = roleDefDao.get(id);
        List<Role> roles = roleDao.findBy("roleDef.id", id);

        ScopeDTO currentScope = ScopeHolder.getScopeDto();
        List<ScopeDTO> scopeDtos;

        if (currentScope.isShared()) {
            scopeDtos = scopeConnector.findAll();
        } else {
            scopeDtos = new ArrayList<ScopeDTO>();
            scopeDtos.add(currentScope);
        }

        for (ScopeDTO scopeDto : scopeDtos) {
            Role existedRole = null;

            for (Role role : roles) {
                if (role.getScopeId().equals(scopeDto.getId())) {
                    existedRole = role;

                    break;
                }
            }

            if (existedRole == null) {
                Role role = new Role();
                role.setName(roleDef.getName());
                role.setRoleDef(roleDef);
                role.setScopeId(scopeDto.getId());
                roleDao.save(role);
            }
        }

        for (Role role : roles) {
            boolean existed = false;

            for (ScopeDTO scopeDto : scopeDtos) {
                if (role.getScopeId().equals(scopeDto.getId())) {
                    existed = true;

                    break;
                }
            }

            if (!existed) {
                roleDao.remove(role);
            }
        }

        return "redirect:/auth/role-def-manage.do?id=" + id;
    }

    // ~ ======================================================================
    @Resource
    public void setRoleDefDao(RoleDefDao roleDefDao) {
        this.roleDefDao = roleDefDao;
    }

    @Resource
    public void setRoleDao(RoleDao roleDao) {
        this.roleDao = roleDao;
    }

    @Resource
    public void setRoleDefChecker(RoleDefChecker roleDefChecker) {
        this.roleDefChecker = roleDefChecker;
    }

    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }

    @Resource
    public void setScopeConnector(ScopeConnector scopeConnector) {
        this.scopeConnector = scopeConnector;
    }
}
