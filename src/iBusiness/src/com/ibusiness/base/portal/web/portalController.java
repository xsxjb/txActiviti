package com.ibusiness.base.portal.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibusiness.base.menu.dao.MenuDao;
import com.ibusiness.base.menu.entity.Menu;
import com.ibusiness.base.user.dao.UserBaseDao;
import com.ibusiness.base.user.entity.UserBase;
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
    
    /**
     * 登录页面 验证码 Ajax call
     * @ResponseBody 代表是ajax请求
     */
    @ResponseBody
    @RequestMapping(value="checkcodeAjax", method=RequestMethod.POST)
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        String webcode = request.getParameter("inputcode");
        HttpSession session = request.getSession();
        String sessioncode = (String) session.getAttribute("number");
        int result = 0;
        if (webcode.equalsIgnoreCase(sessioncode)) {
            result = 1;
        }
        out.println(result);
    }
    
    /**
     * 
     * @param model
     * @param session
     * @return
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("portal")
    public String list(Model model, HttpSession session) {
        // 当前座席ID
        String userId = SpringSecurityUtils.getCurrentUserId();
        UserBase userBase = userBaseDao.get(Long.parseLong(userId));
        // 设置request
        session.setAttribute("userCSS",userBase.getCss());
        
        // 菜单设置
        String hql = "select m from Menu m, MenuRoleDef mrd, UserBase ub where m.id=mrd.menuId AND mrd.roleDefId= ub.roleDef.id AND m.menuLevel='1' AND ub.id=?";
        List<Menu> menus = menuDao.find(hql, Long.parseLong(userId));
        
        String hql2 = "select m from Menu m, MenuRoleDef mrd, UserBase ub where m.id=mrd.menuId AND mrd.roleDefId= ub.roleDef.id AND m.menuLevel='2' AND ub.id=?";
        List<Menu> menus2 = menuDao.find(hql2, Long.parseLong(userId));
        
        String hql3 = "select m from Menu m, MenuRoleDef mrd, UserBase ub where m.id=mrd.menuId AND mrd.roleDefId= ub.roleDef.id AND m.menuLevel='3' AND ub.id=?";
        List<Menu> menus3 = menuDao.find(hql3, Long.parseLong(userId));
        for (Menu menu1 : menus) {
            menu1.getChiledItems().clear();
            for (Menu menu2 : menus2) {
                if(menu1.getId().equals(menu2.getIbMenu().getId())) {
                    menu1.getChiledItems().add(menu2);
                }
                menu2.getChiledItems().clear();
                for (Menu menu3 : menus3) {
                    if (menu2.getId().equals(menu3.getIbMenu().getId())) {
                        menu2.getChiledItems().add(menu3);
                    }
                }
            }
        }
        
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
