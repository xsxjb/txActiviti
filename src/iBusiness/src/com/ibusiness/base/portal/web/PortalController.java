package com.ibusiness.base.portal.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.activiti.engine.task.Task;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ibusiness.base.menu.dao.MenuDao;
import com.ibusiness.base.menu.entity.Menu;
import com.ibusiness.base.user.entity.UserBase;
import com.ibusiness.bpm.service.BpmComBusiness;
import com.ibusiness.common.service.CommonBusiness;
import com.ibusiness.security.util.SpringSecurityUtils;
/**
 * 登录后首页controller
 * 
 * @author JiangBo
 *
 */
@Controller
@RequestMapping("portal")
public class PortalController {

    private MenuDao menuDao;
    
    /**
     * 首页
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("portal")
    public String list(Model model, HttpSession session) {
        // 当前用户ID
        String userId = SpringSecurityUtils.getCurrentUserId();
        UserBase userBase = CommonBusiness.getInstance().getUserBaseMap().get(userId);
        // 设置当前用户CSS样式
        session.setAttribute("userCSS",userBase.getCss());
        
        // 查询菜单
        List<Menu> menusAll = queryMenus(userId);
        // 设置菜单
        // 桌面图标list
        List<Menu> deskmenus = new ArrayList<Menu>();
        Map<String, Menu> menuMap = new HashMap<String, Menu>();
        Map<String, Menu> menuMap2 = new HashMap<String, Menu>();
        List<Menu> menus3 = new ArrayList<Menu>();
        for (Menu menu : menusAll) {
            if ("1".equals(menu.getMenuLevel())) {
                menu.getChiledItems().clear();
                menuMap.put(menu.getId(), menu);
            } else if ("2".equals(menu.getMenuLevel())) {
                menu.getChiledItems().clear();
                menuMap2.put(menu.getId(), menu);
            } else if ("3".equals(menu.getMenuLevel())) {
                menus3.add(menu);
            }
            // 桌面图标设置, 设置桌面IMCA菜单
            if ("1".equals(menu.getDesktopIcon())) {
                // TODO 速度慢先不开启
                if ("待办任务".equals(menu.getMenuName())) {
                    // 取得待办任务（个人任务）---指定用户ID的
                    BpmComBusiness bpmComBusiness = new BpmComBusiness();
                    List<Task> tasks = bpmComBusiness.listPersonalTasks(SpringSecurityUtils.getCurrentUserId());
                    menu.setDataCount(String.valueOf(tasks.size()));
                }
                if ("公告查看".equals(menu.getMenuName())) {
                    // 如果有新的公告显示new
                    menu.setDataCount("NEW~");
                }
                deskmenus.add(menu);
            }
        }
        List<Menu> menus = createMenu(menuMap, menuMap2, menus3);
        // 设置菜单
        session.setAttribute("menuItemList", menus);
        
        // 设置桌面IMCA菜单
        session.setAttribute("deskMenuItems", deskmenus);
        
        // 返回JSP
        return "ibusiness/base/portal/portal.jsp";
    }

    /**
     * 查询菜单
     */
    @SuppressWarnings("unchecked")
    private List<Menu> queryMenus(String userId) {
        String hqlAll = "select m from Menu m, MenuRoleDef mrd, UserBase ub where m.id=mrd.menuId AND mrd.roleDefId= ub.roleDef.id AND ub.id=? ORDER BY m.menuOrder";
        List<Menu> menus = menuDao.find(hqlAll, userId);
        return menus;
    }

    /**
     * 设置菜单
     * 
     * @param userId
     * @return
     */
    private List<Menu> createMenu(Map<String, Menu> menuMap, Map<String, Menu> menuMap2, List<Menu> menus3) {
        List<Menu> menusList = new ArrayList<Menu>();
        // 三级目录存二级
        for (Menu menu3 : menus3) {
            if (menuMap2.containsKey(menu3.getIbMenu().getId())) {
                menuMap2.get(menu3.getIbMenu().getId()).getChiledItems().add(menu3);
            }
        }
        // 二级目录存一级
        for (Map.Entry<String, Menu> entry : menuMap2.entrySet()) {
            Menu menu2 = entry.getValue();
            if(menuMap.containsKey(menu2.getIbMenu().getId())) {
                menuMap.get(menu2.getIbMenu().getId()).getChiledItems().add(menu2);
            }
        }
        // 一级目录list
        for(Map.Entry<String, Menu> entry : menuMap.entrySet()) {
            menusList.add(entry.getValue());
        }
        return menusList;
    }
    
    // ==================================================
    // 菜单
    @Resource
    public void setMenuDao(MenuDao menuDao) {
        this.menuDao = menuDao;
    }
}
