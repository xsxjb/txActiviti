package com.ibusiness.common.menu.web;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ibusiness.common.menu.dao.MenuDao;
import com.ibusiness.common.menu.entity.Menu;
import com.ibusiness.common.page.Page;
import com.ibusiness.common.page.PropertyFilter;
import com.ibusiness.core.mapper.BeanMapper;

/**
 * 菜单控制器
 * 
 * @author JiangBo
 *
 */
@Controller
@RequestMapping("menu")
public class MenuController {

    private MenuDao menuDao;
    private BeanMapper beanMapper = new BeanMapper();
    
    /**
     * 级菜单列表
     * 
     * @param page
     * @param parameterMap
     * @param model
     * @return
     */
    @RequestMapping("menu-list")
    public String menuList(@ModelAttribute Page page, @RequestParam("menuLevel") String menuLevel, @RequestParam("menuLevelOne") String menuLevelOne, @RequestParam("menuLevelTwo") String menuLevelTwo, @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        propertyFilters.add(new PropertyFilter("EQS_menuLevel", menuLevel));
        if ("2".equals(menuLevel)) {
            propertyFilters.add(new PropertyFilter("EQS_ibMenu.id", menuLevelOne));
        } else if ("3".equals(menuLevel)) {
            propertyFilters.add(new PropertyFilter("EQS_ibMenu.id", menuLevelTwo));
        }
        page = menuDao.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        model.addAttribute("menuLevel", menuLevel);
        model.addAttribute("menuLevelOne", menuLevelOne);
        model.addAttribute("menuLevelTwo", menuLevelTwo);
        // 
        List<Menu> menuList = menuDao.find("from Menu where menuLevel = '1'");
        model.addAttribute("levelOneInfos", menuList);
        // 
        List<Menu> menu2List = menuDao.find("from Menu where menuLevel = '2'");
        model.addAttribute("levelTwoInfos", menu2List);
        
        return "common/menu/menu-list.jsp";
    }
    /**
     * 新建/修改 访问权限
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("menu-input")
    public String input(@RequestParam(value = "id", required = false) String id,
            @RequestParam("menuLevel") String menuLevel,@RequestParam("menuLevelOne") String menuLevelOne,@RequestParam("menuLevelTwo") String menuLevelTwo, Model model) {
        if (id != null) {
            Menu menu = menuDao.get(id);
            model.addAttribute("model", menu);
            model.addAttribute("parentId",menu.getIbMenu().getId());
        } else {
            Menu menu = new Menu();
            menu.setMenuLevel(menuLevel);
            // 二级菜单的父菜单ID是一级菜单的ID,三级是二级的,一级菜单的父菜单ID是0
            model.addAttribute("parentId", "2".equals(menuLevel) ? menuLevelOne : ("3".equals(menuLevel) ? menuLevelTwo: "0"));
            model.addAttribute("model", menu);
        }
        return "common/menu/menu-input.jsp";
    }
    
    /**
     * 保存
     * 
     * @param access
     * @param permId
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("menu-save")
    public String save(@ModelAttribute Menu menu, @RequestParam("parentId") String parentId, RedirectAttributes redirectAttributes) {
        // copy
        Menu dest = null;
        String id = menu.getId();
        if (id != null && !"".equals(id)) {
            dest = menuDao.get(id);
            beanMapper.copy(menu, dest);
        } else {
            dest = menu;
        }
        // 
        if (id == null || "".equals(id)) {
            dest.setId(UUID.randomUUID().toString());
            dest.setIbMenu(menuDao.get(parentId));
        }
        dest.setMenuIframe("URL");
        // save
        menuDao.save(dest);
        if ("3".equals(dest.getMenuLevel())) {
            String menuLevelOne = menuDao.get(parentId).getIbMenu().getId();
            return "redirect:/menu/menu-list.do?menuLevel=3&menuLevelOne=" + menuLevelOne + "&menuLevelTwo=" + dest.getIbMenu().getId();
        } else if ("2".equals(dest.getMenuLevel())) {
            return "redirect:/menu/menu-list.do?menuLevel=2&menuLevelOne=" + parentId + "&menuLevelTwo=0";
        } else {
            return "redirect:/menu/menu-list.do?menuLevel=1&menuLevelOne=0&menuLevelTwo=0";
        }
        
    }
    /**
     * 删除
     * 
     * @param selectedItem
     * @param menuLevel
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("menu-remove")
    public String remove(@RequestParam("selectedItem") List<String> selectedItem, RedirectAttributes redirectAttributes) {
        List<Menu> menus = menuDao.findByIds(selectedItem);
        Menu menu = menus.get(0);
        menuDao.removeAll(menus);
        if ("3".equals(menu.getMenuLevel())) {
            String menuLevelOne = menuDao.get(menu.getIbMenu().getId()).getIbMenu().getId();
            return "redirect:/menu/menu-list.do?menuLevel=3&menuLevelOne=" + menuLevelOne + "&menuLevelTwo=" + menu.getIbMenu().getId();
        } else if ("2".equals(menu.getMenuLevel())) {
            return "redirect:/menu/menu-list.do?menuLevel=2&menuLevelOne=" + menu.getIbMenu().getId() + "&menuLevelTwo=0";
        } else {
            return "redirect:/menu/menu-list.do?menuLevel=1&menuLevelOne=0&menuLevelTwo=0";
        }
    }
    // ======================================================================
    @Resource
    public void setMenuDao(MenuDao menuDao) {
        this.menuDao = menuDao;
    }
    
//    /**
//     * 拼装bootstrap头部菜单
//     * @param pFunctions
//     * @param functions
//     * @return
//     */
//    public static String getBootstrapMenu(Map<Integer, List<TSFunction>> map) {
//        StringBuffer menuString = new StringBuffer();
//        menuString.append("<ul class=\"nav\">");
//        List<TSFunction> pFunctions = (List<TSFunction>) map.get(0);
//        if(pFunctions==null || pFunctions.size()==0){
//            return "";
//        }
//        for (TSFunction pFunction : pFunctions) {
//            //是否有子菜单
//            boolean hasSub = pFunction.getTSFunctions().size()==0?false:true;
//            
//            //绘制一级菜单
//            menuString.append(" <li class=\"dropdown\"> ");
//            menuString.append("     <a href=\"javascript:;\" class=\"dropdown-toggle\" data-toggle=\"dropdown\"> ");
//            menuString.append("         <span class=\"bootstrap-icon\" style=\"background-image: url('"+pFunction.getTSIcon().getIconPath()+"')\"></span> "+pFunction.getFunctionName()+" ");
//            if(hasSub){
//                menuString.append("         <b class=\"caret\"></b> ");
//            }
//            menuString.append("     </a> ");
//            //绘制二级菜单
//            if(hasSub){
//                menuString.append(getBootStrapChild(pFunction, 1, map));
//            }
//            menuString.append(" </li> ");
//        }
//        menuString.append("</ul>");
//        return menuString.toString();
//    }
//    /**
//    * @Title: getBootStrapChild
//    * @Description: 递归获取bootstrap的子菜单
//    *  @param parent
//    *  @param level
//    *  @param map
//    * @return String    
//    * @throws
//     */
//    private static String getBootStrapChild(TSFunction parent,int level,Map<Integer, List<TSFunction>> map){
//        StringBuffer menuString = new StringBuffer();
//        List<TSFunction> list = map.get(level);
//        if(list==null || list.size()==0){
//            return "";
//        }
//        menuString.append("     <ul class=\"dropdown-menu\"> ");
//        for (TSFunction function : list) {
//            // 父菜单ID
//            if (function.getTSFunction().getId().equals(parent.getId())){
//                boolean hasSub = function.getTSFunctions().size()!=0 && map.containsKey(level+1);
//                String menu_url = function.getFunctionUrl();
//                if(StringUtils.isNotEmpty(menu_url)){
//                    menu_url += "&clickFunctionId="+function.getId();
//                }
//                menuString.append("     <li onclick=\"showContent(\'"+function.getFunctionName()+"\',\'"+menu_url+"\')\"  title=\""+function.getFunctionName()+"\" url=\""+function.getFunctionUrl()+"\" ");
//                if(hasSub){
//                    menuString.append(" class=\"dropdown-submenu\"");
//                }
//                menuString.append(" > ");
//                menuString.append("         <a href=\"javascript:;\"> ");
//                menuString.append("             <span class=\"bootstrap-icon\" style=\"background-image: url('"+function.getTSIcon().getIconPath()+"')\"></span>         ");
//                menuString.append(function.getFunctionName());
//                menuString.append("         </a> ");
//                if(hasSub){
//                    menuString.append(getBootStrapChild(function,level+1,map));
//                }
//                menuString.append("     </li> ");
//            }
//        }
//        menuString.append("     </ul> ");
//        return menuString.toString();
//    }
}
