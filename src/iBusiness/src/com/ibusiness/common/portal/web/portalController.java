package com.ibusiness.common.portal.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ibusiness.common.menu.dao.MenuDao;
import com.ibusiness.common.menu.entity.Menu;
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
    private MenuDao menuDao;
    
    @SuppressWarnings("unchecked")
    @RequestMapping("portal")
    public String list(Model model, HttpSession session) {
        // 当前座席ID
        String userId = SpringSecurityUtils.getCurrentUserId();
        UserBase userBase = userBaseDao.get(Long.parseLong(userId));
        // 设置request
        session.setAttribute("userCSS",userBase.getCss());
        
        // 菜单设置
        String hql = "from Menu where menuLevel='1'";
        List<Menu> menus = menuDao.find(hql);
        session.setAttribute("menuItemList", menus);
        // 返回jsp
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
    @Resource
    public void setMenuDao(MenuDao menuDao) {
        this.menuDao = menuDao;
    }
}
