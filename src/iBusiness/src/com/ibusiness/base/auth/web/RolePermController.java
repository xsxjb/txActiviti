package com.ibusiness.base.auth.web;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ibusiness.base.auth.component.CheckRoleException;
import com.ibusiness.base.auth.component.RoleDefChecker;
import com.ibusiness.base.auth.dao.PermDao;
import com.ibusiness.base.auth.dao.PermTypeDao;
import com.ibusiness.base.auth.dao.RoleDefDao;
import com.ibusiness.base.auth.entity.Perm;
import com.ibusiness.base.auth.entity.PermType;
import com.ibusiness.base.auth.entity.RoleDef;
import com.ibusiness.base.menu.dao.MenuDao;
import com.ibusiness.base.menu.entity.Menu;
import com.ibusiness.core.spring.MessageHelper;
import com.ibusiness.security.api.scope.ScopeHolder;

/**
 * 权限设置
 * 
 * @author JiangBo
 * 
 */
@Controller
@RequestMapping("auth")
public class RolePermController {
    private static Logger logger = LoggerFactory.getLogger(RolePermController.class);
    private PermDao permDao;
    private RoleDefDao roleDefDao;
    private PermTypeDao permTypeDao;
    private MessageHelper messageHelper;
    private RoleDefChecker roleDefChecker;
    private MenuDao menuDao;

    /**
     * 标签权限保存
     * 
     * @param id
     * @param model
     * @param selectedItem
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("role-perm-save")
    public String save(@RequestParam("id")
    Long id, Model model, @RequestParam(value = "selectedItem", required = false)
    List<Long> selectedItem, RedirectAttributes redirectAttributes) {
        if (selectedItem == null) {
            selectedItem = Collections.emptyList();
        }

        try {
            RoleDef roleDef = roleDefDao.get(id);
            roleDefChecker.check(roleDef);
            // 清空非menu类型的,类型编号!=7
            List<Perm> permList = permDao.find("from Perm where permType.id != ?", Long.parseLong("7"));
            for (Perm perm : permList) {
                roleDef.getPerms().remove(perm);
            }

            for (Long permId : selectedItem) {
                Perm perm = permDao.get(permId);
                roleDef.getPerms().add(perm);
            }

            roleDefDao.save(roleDef);
            messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        } catch (CheckRoleException ex) {
            logger.warn(ex.getMessage(), ex);
            messageHelper.addFlashMessage(redirectAttributes, ex.getMessage());

            return input(id, model);
        }

        return "redirect:/auth/role-perm-input.do?id=" + id;
    }

    /**
     * 标签权限设置
     * 
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("role-perm-input")
    public String input(@RequestParam("id") Long id, Model model) {
        RoleDef roleDef = roleDefDao.get(id);
        List<Long> selectedItem = new ArrayList<Long>();

        for (Perm perm : roleDef.getPerms()) {
            selectedItem.add(perm.getId());
        }

        String hql = "from PermType where id!=7 and type=0 and scopeId=?";
        List<PermType> permTypes = permTypeDao.find(hql, ScopeHolder.getScopeId());
        model.addAttribute("permTypes", permTypes);
        model.addAttribute("selectedItem", selectedItem);
        model.addAttribute("id", id);

        return "common/auth/role-perm-input.jsp";
    }
    
    /**
     * 菜单权限设置
     * 
     * @param id
     * @param model
     * @return
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("role-menu-input")
    public String menuinput(@RequestParam("id") Long id, Model model) {
        RoleDef roleDef = roleDefDao.get(id);
        List<String> selectedItem = new ArrayList<String>();
        for (Menu menu : roleDef.getMenus()) {
            selectedItem.add(menu.getId());
        }
        String hql = "from Menu where menuLevel='1'";
        List<Menu> menus = menuDao.find(hql);
        model.addAttribute("menus", menus);
        model.addAttribute("selectedItem", selectedItem);
        model.addAttribute("id", id);
        return "common/auth/role-menu-input.jsp";
    }
    /**
     * 菜单权限保存
     * 
     * @param id
     * @param model
     * @param selectedItem
     * @param redirectAttributes
     * @return
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("role-menu-save")
    public String menuSave(@RequestParam("id")
    Long id, Model model, @RequestParam(value = "selectedItem", required = false)
    List<String> selectedItem, RedirectAttributes redirectAttributes) {
        if (selectedItem == null) {
            selectedItem = Collections.emptyList();
        }

        try {
            RoleDef roleDef = roleDefDao.get(id);
            roleDefChecker.check(roleDef);
            // 只清空menu类型
            roleDef.getMenus().clear();
            // 清空menu类型的,类型编号=7
            List<Perm> permList = permDao.find("from Perm where permType.id = ?", Long.parseLong("7"));
            for (Perm perm : permList) {
                roleDef.getPerms().remove(perm);
            }
            // 保存数据
            for (String menuId : selectedItem) {
                Menu menu = menuDao.get(menuId);
                roleDef.getMenus().add(menu);
                List<Perm> permAddList = permDao.find("from Perm where permType.id = 7 AND code=?", menuId);
                if (null!=permAddList && permAddList.size() > 0) {
                    roleDef.getPerms().add(permAddList.get(0));
                }
            }
            roleDefDao.save(roleDef);
            messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        } catch (CheckRoleException ex) {
            logger.warn(ex.getMessage(), ex);
            messageHelper.addFlashMessage(redirectAttributes, ex.getMessage());

            return input(id, model);
        }

        // 返回角色列表
        return "redirect:/auth/role-def-list.do";
    }

    // ~ ======================================================================
    @Resource
    public void setPermDao(PermDao permDao) {
        this.permDao = permDao;
    }

    @Resource
    public void setRoleDefDao(RoleDefDao roleDefDao) {
        this.roleDefDao = roleDefDao;
    }

    @Resource
    public void setRoleDefChecker(RoleDefChecker roleDefChecker) {
        this.roleDefChecker = roleDefChecker;
    }

    @Resource
    public void setPermTypeDao(PermTypeDao permTypeDao) {
        this.permTypeDao = permTypeDao;
    }
    @Resource
    public void setMenuDao(MenuDao menuDao) {
        this.menuDao = menuDao;
    }
    
    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }
}
