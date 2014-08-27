package com.ibusiness.common.portal.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ibusiness.common.user.dao.UserBaseDao;
import com.ibusiness.common.user.entity.UserBase;
import com.ibusiness.security.util.SpringSecurityUtils;
/**
 * 登录后首页controller
 * 
 * @author JiangBo
 *
 */
@Controller
@RequestMapping("portal")
public class portalController {

    private UserBaseDao userBaseDao;
    
    @RequestMapping("portal")
    public String list(Model model, HttpSession session) {
        // 当前座席ID
        String userId = SpringSecurityUtils.getCurrentUserId();
        UserBase userBase = userBaseDao.get(Long.parseLong(userId));
        // 设置request
        session.setAttribute("userCSS",userBase.getCss());
        return "base/portal/portal.jsp";
    }
    
    // ==================================================
    /**
     * @return the userBaseDao
     */
    @Resource
    public void setUserBaseDao(UserBaseDao userBaseDao) {
        this.userBaseDao = userBaseDao;
    }

}
