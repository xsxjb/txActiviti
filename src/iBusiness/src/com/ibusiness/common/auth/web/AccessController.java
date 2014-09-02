package com.ibusiness.common.auth.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ibusiness.common.auth.dao.AccessDao;
import com.ibusiness.common.auth.dao.PermDao;
import com.ibusiness.common.auth.dao.PermTypeDao;
import com.ibusiness.common.auth.entity.Access;
import com.ibusiness.common.auth.entity.Perm;
import com.ibusiness.common.page.Page;
import com.ibusiness.common.page.PropertyFilter;
import com.ibusiness.core.mapper.BeanMapper;
import com.ibusiness.core.spring.MessageHelper;
import com.ibusiness.security.api.scope.ScopeHolder;
import com.ibusiness.security.client.ResourcePublisher;
/**
 * 访问权限
 * 
 * @author JiangBo
 *
 */
@Controller
@RequestMapping("auth")
public class AccessController {
    private AccessDao accessDao;
    private MessageHelper messageHelper;
    private BeanMapper beanMapper = new BeanMapper();
    private PermDao permDao;
    private PermTypeDao permTypeDao;
    private ResourcePublisher resourcePublisher;

    /**
     * 访问权限列表
     * 
     * @param page
     * @param parameterMap
     * @param model
     * @return
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("access-list")
    public String list(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        propertyFilters.add(new PropertyFilter("EQS_scopeId", ScopeHolder.getScopeId()));
        // 只查看菜单相关的
        List<Perm> permList= permDao.find("from Perm where permType.id = ?", Long.parseLong("7"));
        String permIds = "";
        for (Perm perm : permList) {
            if (!"".equals(permIds)) {
                permIds = permIds + ",";
            }
            permIds = permIds + perm.getId().toString();
        }
        propertyFilters.add(new PropertyFilter("INL_perm.id", permIds));
        
        page = accessDao.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);

        return "common/auth/access-list.jsp";
    }

    /**
     * 新建/修改 访问权限
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("access-input")
    public String input(@RequestParam(value = "id", required = false) Long id, Model model) {
        if (id != null) {
            Access access = accessDao.get(id);
            model.addAttribute("model", access);
        }

        return "common/auth/access-input.jsp";
    }

    /**
     * 保存访问权限
     * 
     * @param access
     * @param permId
     * @param redirectAttributes
     * @return
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("access-save")
    public String save(@ModelAttribute Access access, @RequestParam("permCode") String permCode, @RequestParam("permName") String permName, RedirectAttributes redirectAttributes) {
        // copy
        Access dest = null;

        Long id = access.getId();
        if (id != null) {
            dest = accessDao.get(id);
            beanMapper.copy(access, dest);
        } else {
            dest = access;
        }

        // foreign 授权管理
        List<Perm> permList = permDao.find("from Perm where code = ?", permCode);
        Perm perm = new Perm();
        if (null != permList && permList.size() > 0) {
            perm = permList.get(0);
            perm.setCode(permCode);
            perm.setName(permName);
        } else {
            // 新建
            perm.setCode(permCode);
            perm.setName(permName);
            perm.setPermType(permTypeDao.get(Long.parseLong("7")));
            // 优先级
            perm.setScopeId("1");
        }
        // 
        permDao.save(perm);
        dest.setPerm(perm);
        if (id == null) {
            dest.setScopeId(ScopeHolder.getScopeId());
        }

        // save
        accessDao.save(dest);

        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        // 发布资源包
        resourcePublisher.publish();

        return "redirect:/auth/access-list.do";
    }

    /**
     * 删除
     * 
     * @param selectedItem
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("access-remove")
    public String remove(@RequestParam("selectedItem")
    List<Long> selectedItem, RedirectAttributes redirectAttributes) {
        List<Access> accesses = accessDao.findByIds(selectedItem);
        accessDao.removeAll(accesses);
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");

        resourcePublisher.publish();

        return "redirect:/auth/access-list.do";
    }

    // ======================================================================
    @Resource
    public void setAccessDao(AccessDao accessDao) {
        this.accessDao = accessDao;
    }

    @Resource
    public void setPermDao(PermDao permDao) {
        this.permDao = permDao;
    }
    @Resource
    public void setPermTypeDao(PermTypeDao permTypeDao) {
        this.permTypeDao = permTypeDao;
    }
    
    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }

    @Resource
    public void setResourcePublisher(ResourcePublisher resourcePublisher) {
        this.resourcePublisher = resourcePublisher;
    }
}
