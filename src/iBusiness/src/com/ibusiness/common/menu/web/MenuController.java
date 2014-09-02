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
     * 一级菜单列表
     * 
     * @param page
     * @param parameterMap
     * @param model
     * @return
     */
    @RequestMapping("menu-levelone-list")
    public String levelOneList(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        propertyFilters.add(new PropertyFilter("EQS_menuLevel", "1"));
        page = menuDao.pagedQuery(page, propertyFilters);
        model.addAttribute("page1", page);
        model.addAttribute("menuLevel", "1");
        // 
        List<Menu> menuList = menuDao.find("from Menu where menuLevel = '1'");
        model.addAttribute("levelOneInfos", menuList);
        // 
        List<Menu> menu2List = menuDao.find("from Menu where menuLevel = '2'");
        model.addAttribute("levelTwoInfos", menu2List);
        
        return "common/menu/menu-list.jsp";
    }
    
    /**
     * 二级菜单列表
     * 
     * @param page
     * @param parameterMap
     * @param model
     * @return
     */
    @RequestMapping("menu-leveltwo-list")
    public String levelTwoList(@ModelAttribute Page page, @RequestParam("menuLevelOne") String parentId, @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        propertyFilters.add(new PropertyFilter("EQS_menuLevel", "2"));
        propertyFilters.add(new PropertyFilter("EQS_ibMenu.id", parentId));
        page = menuDao.pagedQuery(page, propertyFilters);
        model.addAttribute("page2", page);
        model.addAttribute("menuLevel", "2");
        model.addAttribute("menuLevelOne", parentId);
        // 
        List<Menu> menuList = menuDao.find("from Menu where menuLevel = '1'");
        model.addAttribute("levelOneInfos", menuList);
        // 
        List<Menu> menu2List = menuDao.find("from Menu where menuLevel = '2'");
        model.addAttribute("levelTwoInfos", menu2List);

        return "common/menu/menu-list.jsp";
    }
    
    /**
     * 三级菜单列表
     * 
     * @param page
     * @param parameterMap
     * @param model
     * @return
     */
    @RequestMapping("menu-levelthree-list")
    public String levelThreeList(@ModelAttribute Page page, @RequestParam("menuLevelOne") String menuLevelOne, @RequestParam("menuLevelTwo") String parentId, @RequestParam Map<String, Object> parameterMap, Model model) {
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        propertyFilters.add(new PropertyFilter("EQS_menuLevel", "3"));
        propertyFilters.add(new PropertyFilter("EQS_ibMenu.id", parentId));
        page = menuDao.pagedQuery(page, propertyFilters);
        model.addAttribute("page3", page);
        model.addAttribute("menuLevel", "3");
        model.addAttribute("menuLevelOne", menuLevelOne);
        model.addAttribute("menuLevelTwo", parentId);
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
            @RequestParam("menuLevel") String menuLevel,@RequestParam("parentId") String parentId, Model model) {
        if (id != null) {
            Menu menu = menuDao.get(id);
            model.addAttribute("model", menu);
        } else {
            Menu menu = new Menu();
            menu.setMenuLevel(menuLevel);
            Menu parentMenu = menuDao.get(parentId);
            menu.setIbMenu(parentMenu);
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
    public String save(@ModelAttribute Menu menu, RedirectAttributes redirectAttributes) {
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
        if (id == null) {
            dest.setId(UUID.randomUUID().toString());
        }
        // save
        menuDao.save(dest);
        if ("3".equals(dest.getMenuLevel())) {
            String menuLevelOne = menuDao.get(dest.getIbMenu().getId()).getIbMenu().getId();
            return "redirect:/menu/menu-levelthree-list.do?menuLevelOne=" + menuLevelOne + "&menuLevelTwo=" + dest.getIbMenu().getId();
        } else if ("2".equals(dest.getMenuLevel())) {
            return "redirect:/menu/menu-leveltwo-list.do?menuLevelOne=" + dest.getIbMenu().getId();
        } else {
            return "redirect:/menu/menu-levelone-list.do";
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
