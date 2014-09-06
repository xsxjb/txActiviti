package com.ibusiness.base.menu.web;

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

import com.ibusiness.base.auth.dao.AccessDao;
import com.ibusiness.base.auth.dao.PermDao;
import com.ibusiness.base.auth.dao.PermTypeDao;
import com.ibusiness.base.auth.entity.Access;
import com.ibusiness.base.auth.entity.Perm;
import com.ibusiness.base.menu.dao.MenuDao;
import com.ibusiness.base.menu.entity.Menu;
import com.ibusiness.common.page.Page;
import com.ibusiness.common.page.PropertyFilter;
import com.ibusiness.common.util.CommonUtils;
import com.ibusiness.core.mapper.BeanMapper;
import com.ibusiness.core.spring.MessageHelper;
import com.ibusiness.security.api.scope.ScopeHolder;
import com.ibusiness.security.client.ResourcePublisher;

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
    // 权限相关
    private AccessDao accessDao;
    private MessageHelper messageHelper;
    private PermDao permDao;
    private PermTypeDao permTypeDao;
    private ResourcePublisher resourcePublisher;
    
    /**
     * 菜单列表
     * 
     * @param page
     * @param parameterMap
     * @param model
     * @return
     */
    @SuppressWarnings("unchecked")
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
            // 新建
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
        if (CommonUtils.isNull(dest.getIconUrl())) {
            dest.setIconUrl("imac/img/Appstore.png");
        }
        // save
        menuDao.save(dest);
        
        // 保存菜单关联权限
        saveMenuPerm(menu);
        
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        
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
     * 保存菜单关联权限
     * 
     * @param menu
     */
    @SuppressWarnings("unchecked")
    private void saveMenuPerm(Menu menu) {
        // 如果菜单没有具体的URL那么不进行URL权限控制
        if (menu.getMenuUrl().indexOf(".") < 0) {
            return;
        }
        Access dest = new Access();
        List<Access> accessList = accessDao.find("from Access where menuId = ?", menu.getId());
        if (accessList != null && accessList.size() > 0) {
            dest = accessList.get(0);
        } else {
            dest.setScopeId(ScopeHolder.getScopeId());
            dest.setMenuId(menu.getId());
        }
        // 资源value设置为菜单URL的.do之前的部分 + *
        String urlValue = menu.getMenuUrl().substring(0,menu.getMenuUrl().indexOf("."));
        dest.setValue(urlValue + "*");
        dest.setType("URL");
        dest.setPriority(10);
        // 权限代码 设置为菜单UUID主键,防止重复
        String permCode = menu.getId();
        // foreign 授权管理
        List<Perm> permList = permDao.find("from Perm where code = ?", permCode);
        Perm perm = new Perm();
        if (null != permList && permList.size() > 0) {
            perm = permList.get(0);
            perm.setCode(permCode);
            perm.setName(menu.getMenuName());
        } else {
            // 新建
            perm.setCode(permCode);
            perm.setName(menu.getMenuName());
            perm.setPermType(permTypeDao.get(Long.parseLong("7")));
            // 优先级
            perm.setScopeId("1");
        }
        //
        permDao.save(perm);
        dest.setPerm(perm);
        // save
        accessDao.save(dest);
        // 发布资源包
        resourcePublisher.publish();
    }
    /**
     * 删除
     * 
     * @param selectedItem
     * @param menuLevel
     * @param redirectAttributes
     * @return
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("menu-remove")
    public String remove(@RequestParam("selectedItem") List<String> selectedItem, RedirectAttributes redirectAttributes) {
        List<Menu> menus = menuDao.findByIds(selectedItem);
        Menu menu = menus.get(0);
        menuDao.removeAll(menus);
        for (Menu bean : menus) {
            // 资源
            List<Access> accesses = accessDao.find("from Access where menuId = ?", bean.getId());
            accessDao.removeAll(accesses);
            // 权限
            List<Perm> perms = permDao.find("from Perm where code = ?", bean.getId());
            accessDao.removeAll(perms);
        }
        
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
    // 权限相关
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
