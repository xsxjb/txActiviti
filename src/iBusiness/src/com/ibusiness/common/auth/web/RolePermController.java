package com.ibusiness.common.auth.web;

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

import com.ibusiness.common.auth.component.CheckRoleException;
import com.ibusiness.common.auth.component.RoleDefChecker;
import com.ibusiness.common.auth.dao.PermDao;
import com.ibusiness.common.auth.dao.PermTypeDao;
import com.ibusiness.common.auth.dao.RoleDefDao;
import com.ibusiness.common.auth.entity.Perm;
import com.ibusiness.common.auth.entity.PermType;
import com.ibusiness.common.auth.entity.RoleDef;
import com.ibusiness.core.spring.MessageHelper;
import com.ibusiness.security.api.scope.ScopeHolder;

@Controller
@RequestMapping("auth")
public class RolePermController {
    private static Logger logger = LoggerFactory.getLogger(RolePermController.class);
    private PermDao permDao;
    private RoleDefDao roleDefDao;
    private PermTypeDao permTypeDao;
    private MessageHelper messageHelper;
    private RoleDefChecker roleDefChecker;

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
            roleDef.getPerms().clear();

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

    @RequestMapping("role-perm-input")
    public String input(@RequestParam("id")
    Long id, Model model) {
        RoleDef roleDef = roleDefDao.get(id);
        List<Long> selectedItem = new ArrayList<Long>();

        for (Perm perm : roleDef.getPerms()) {
            selectedItem.add(perm.getId());
        }

        String hql = "from PermType where type=0 and scopeId=?";
        List<PermType> permTypes = permTypeDao.find(hql, ScopeHolder.getScopeId());
        model.addAttribute("permTypes", permTypes);
        model.addAttribute("selectedItem", selectedItem);
        model.addAttribute("id", id);

        return "common/auth/role-perm-input.jsp";
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
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }
}
