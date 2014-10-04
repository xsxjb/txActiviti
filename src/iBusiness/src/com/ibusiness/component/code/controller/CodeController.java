package com.ibusiness.component.code.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ibusiness.base.menu.dao.MenuDao;
import com.ibusiness.base.menu.entity.Menu;
import com.ibusiness.codegenerate.code.CodeParamBean;
import com.ibusiness.codegenerate.code.generate.CodeGenerate;
import com.ibusiness.codegenerate.code.generate.CodeGenerateOneToMany;
import com.ibusiness.codegenerate.code.window.CreateFileProperty;
import com.ibusiness.component.code.entity.CodeGenerateBean;
import com.ibusiness.component.form.dao.ConfFormDao;
import com.ibusiness.component.form.dao.ConfFormTableDao;
import com.ibusiness.component.form.entity.ConfForm;
import com.ibusiness.component.form.entity.ConfFormTable;
import com.ibusiness.component.portal.dao.ComponentDao;
import com.ibusiness.component.portal.entity.ConfComponent;
import com.ibusiness.component.table.dao.TableDao;
import com.ibusiness.component.table.entity.ConfTable;
import com.ibusiness.core.spring.MessageHelper;
import com.ibusiness.core.util.StringUtils;

/**
 * 代码生成器控制器
 * 
 * @author JiangBo
 *
 */
@Controller
@RequestMapping("code")
public class CodeController {

    private ConfFormTableDao confFormTableDao;
    private ConfFormDao confFormDao;
    private TableDao tableDao;
    private ComponentDao componentDao;
    private MenuDao menuDao;
    private MessageHelper messageHelper;
    
    /**
     * 表单生成器
     */
    @RequestMapping("code-generate-input")
    public String codeGenerateList(@RequestParam("packageName") String packageName, @RequestParam("formId") String formId, @RequestParam("isBpmForm") String isBpmForm, @RequestParam Map<String, Object> parameterMap, Model model) {
        // 取得表单数据
        ConfForm confForm = confFormDao.get(formId);
        
        // 控制tab标签显示属性
        String returnUrl = createCodeGUI(packageName, confForm, parameterMap, model);
        
        model.addAttribute("formId", formId);
        model.addAttribute("packageName", packageName);
        model.addAttribute("isBpmForm", confForm.getIsBpmForm());
        // 控制tab标签显示属性
        model.addAttribute("tabType", "formCode");
        model.addAttribute("isBpmForm", isBpmForm);
        
        return returnUrl;
    }
    /**
     * 生成---调用表单生成器
     * 
     * @param packageName
     * @param formId
     * @param parameterMap
     * @param model
     * @return
     */
    @RequestMapping("code-generate-save")
    public String codeGenerateSave(@Valid CodeGenerateBean bean, 
            @RequestParam("formId") String formId, @RequestParam("menuUrl") String menuUrl, RedirectAttributes redirectAttributes) {
        //step.1 准备好表单的配置
        //step.2 判断表是否存在
        CreateFileProperty createFileProperty = new CreateFileProperty();
        for (String selectedItem : bean.getSelectedItems()) {
            if ("".equals(selectedItem)) {
                createFileProperty.setJspMode("02");
            } else {
                createFileProperty.setJspMode("01");
            }
            if ("checkboxController".equals(selectedItem)) {
                createFileProperty.setActionFlag(true);
            }
            if ("checkboxJsp".equals(selectedItem)) {
                createFileProperty.setJspFlag(true);
            }
            if ("checkboxService".equals(selectedItem)) {
                createFileProperty.setServiceIFlag(true);
            }
            if ("checkboxServiceImp".equals(selectedItem)) {
                createFileProperty.setServiceImplFlag(true);
            }
            if ("checkboxEntity".equals(selectedItem)) {
                createFileProperty.setEntityFlag(true);
            }
        }
        
        //step.3 调用代码生成器
        // 取得表单信息
        ConfForm confForm = confFormDao.get(formId);
        // 取得页面提交的生成器信息，子表生成器信息
        List<CodeGenerateBean> subCodeGenerateBeans = bean.getSubCodeGenerateBeans();
        // 流程表单调用流程生成器
        if (1 == confForm.getIsBpmForm()) {
            if (null != subCodeGenerateBeans && subCodeGenerateBeans.size() > 0) {
                // 一对多流程表单生成器
                CodeParamBean codeParamBean = new CodeParamBean();
                codeParamBean.setPackageName(bean.getPackageName());
                codeParamBean.setFormName(bean.getFormName());
                codeParamBean.setEntityName(bean.getEntityName());
                codeParamBean.setTableName(bean.getTableName());
                codeParamBean.setKeyType("uuid");
                codeParamBean.setEntityTitle(bean.getEntityTitle());
                codeParamBean.setRowNumber(bean.getRowNumber());
                codeParamBean.setFormStyle(bean.getFormStyle());
                List<CodeParamBean> subParamList = new ArrayList<CodeParamBean>();
                for (CodeGenerateBean codeGenerateBean : subCodeGenerateBeans) {
                    CodeParamBean subParamBean = new CodeParamBean();
                    subParamBean.setPackageName(bean.getPackageName());
                    subParamBean.setFormName(bean.getFormName());
                    subParamBean.setTableName(codeGenerateBean.getTableName());
                    subParamBean.setEntityName(codeGenerateBean.getEntityName());
                    subParamBean.setKeyType("uuid");
                    subParamBean.setEntityTitle(bean.getEntityTitle());
                    subParamBean.setRowNumber(bean.getRowNumber());
                    subParamBean.setFormStyle(bean.getFormStyle());
                    // 子表生成
                    CreateFileProperty subFileProperty = new CreateFileProperty();
                    subFileProperty.setJspFlag(true);
                    subFileProperty.setServiceIFlag(true);
                    subFileProperty.setEntityFlag(true);
                    subFileProperty.setJspMode("sub");
                    new CodeGenerate(subParamBean, subFileProperty).generateToFile();
                    subParamList.add(subParamBean);
                }
                codeParamBean.setSubParamBeans(subParamList);
                // 代码生成器--流程
                new CodeGenerateOneToMany(codeParamBean, createFileProperty).generateToFile();
            } else {
                // 一对一流程表单生成器
            }
        } else {
            // 非流程表单---调用非流程生成器
            if (null != subCodeGenerateBeans && subCodeGenerateBeans.size() > 0) {
                // 一对多非流程表单生成器
                CodeParamBean codeParamBean = new CodeParamBean();
                codeParamBean.setPackageName(bean.getPackageName());
                codeParamBean.setFormName(bean.getFormName());
                codeParamBean.setEntityName(bean.getEntityName());
                codeParamBean.setTableName(bean.getTableName());
                codeParamBean.setKeyType("uuid");
                codeParamBean.setEntityTitle(bean.getEntityTitle());
                codeParamBean.setRowNumber(bean.getRowNumber());
                codeParamBean.setFormStyle(bean.getFormStyle());
                List<CodeParamBean> subParamList = new ArrayList<CodeParamBean>();
                for (CodeGenerateBean codeGenerateBean : subCodeGenerateBeans) {
                    CodeParamBean subParamBean = new CodeParamBean();
                    subParamBean.setPackageName(codeGenerateBean.getPackageName());
                    subParamBean.setFormName(bean.getFormName());
                    subParamBean.setTableName(codeGenerateBean.getTableName());
                    subParamBean.setEntityName(codeGenerateBean.getEntityName());
                    subParamBean.setKeyType("uuid");
                    subParamBean.setEntityTitle(bean.getEntityTitle());
                    subParamBean.setRowNumber(bean.getRowNumber());
                    subParamBean.setFormStyle(bean.getFormStyle());
                }
                codeParamBean.setSubParamBeans(subParamList);
                
                new CodeGenerateOneToMany(codeParamBean, createFileProperty).generateToFile();
            } else {
                // 一对一非流程表单生成器
                CodeParamBean codeParamBean = new CodeParamBean();
                codeParamBean.setPackageName(bean.getPackageName());
                codeParamBean.setFormName(bean.getFormName());
                codeParamBean.setEntityName(bean.getEntityName());
                codeParamBean.setTableName(bean.getTableName());
                codeParamBean.setKeyType("uuid");
                codeParamBean.setEntityTitle(bean.getEntityTitle());
                codeParamBean.setRowNumber(bean.getRowNumber());
                codeParamBean.setFormStyle(bean.getFormStyle());
                new CodeGenerate(codeParamBean, createFileProperty).generateToFile();
            }
            // 非流程表单直接生成菜单
            createMenu(confForm, menuUrl);
        }
        
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "生成成功");
        
        return "redirect:/form/conf-form-input.do?packageName="+ bean.getPackageName() + "&formId="+ formId + "&isBpmForm=2";
    }
    /**
     * 生成菜单
     * 
     * @param formId
     * @param menuUrl
     */
    @SuppressWarnings("unchecked")
    private void createMenu(ConfForm confForm, String menuUrl) {
        ///////////////////////// 一级菜单 //////////////////////////////////////
        String hql = "from ConfComponent where packagename=?";
        List<ConfComponent> list = componentDao.find(hql, confForm.getPackageName());
        if (null != list && list.size() > 0) {
            // 菜单名称
            String menuName = list.get(0).getModulename();
            String menu1Hql = "from Menu where menuName=?";
            List<Menu> menus= menuDao.find(menu1Hql, menuName);
            // 实例化一个菜单
            Menu menu = new Menu();
            if (null != menus && menus.size() > 0) {
                menu = menus.get(0);
            } else {
                menu.setId(UUID.randomUUID().toString());//菜单编号
                menu.setMenuName(list.get(0).getModulename());//菜单名称
                menu.setMenuLevel("1");//菜单等级
                menu.setMenuUrl("#");//菜单地址
                menu.setMenuIframe("URL");//菜单地址打开方式
                menu.setMenuOrder("9");//菜单排序
                menu.setDesktopIcon("0");//是否桌面显示
                Menu ibMenu = new Menu();
                ibMenu.setId("0");
                menu.setIbMenu(ibMenu);//父菜单
                menuDao.save(menu);
            }
            ///////////////////////// 二级菜单 //////////////////////////////////////
            String menu2Hql = "from Menu where menuName=? AND ibMenu.id=?";
            List<Menu> menus2= menuDao.find(menu2Hql, menuName, menu.getId());
            Menu menu2 = new Menu();
            if (null != menus2 && menus2.size() > 0) {
                menu2 = menus2.get(0);
            } else {
                menu2.setId(UUID.randomUUID().toString());//菜单编号
                menu2.setMenuName(list.get(0).getModulename());//菜单名称
                menu2.setMenuLevel("2");//菜单等级
                menu2.setMenuUrl("#");//菜单地址
                menu2.setMenuIframe("URL");//菜单地址打开方式
                menu2.setMenuOrder("9");//菜单排序
                menu2.setDesktopIcon("0");//是否桌面显示
                menu2.setIbMenu(menu);//父菜单
                menuDao.save(menu2);
            }
            ///////////////////////// 三级菜单 //////////////////////////////////////
            String menu3Hql = "from Menu where menuName=? AND ibMenu.id=?";
            List<Menu> menus3= menuDao.find(menu3Hql, confForm.getFormTitle(), menu2.getId());
            Menu menu3 = new Menu();
            if (null == menus3 || menus3.size() <= 0) {
                menu3.setId(UUID.randomUUID().toString());//菜单编号
                menu3.setMenuName(confForm.getFormTitle());//菜单名称
                menu3.setMenuLevel("3");//菜单等级
                menu3.setMenuUrl(menuUrl);//菜单地址
                menu3.setMenuIframe("URL");//菜单地址打开方式
                menu3.setMenuOrder("9");//菜单排序
                menu3.setDesktopIcon("0");//是否桌面显示
                menu3.setIbMenu(menu2);//父菜单
                menuDao.save(menu3);
            }
        }
    }
    /**
     * 表单生成器
     * 
     * @param parameterMap
     * @param model
     * @return
     */
    @SuppressWarnings("unchecked")
    private String createCodeGUI(String packageName, ConfForm confForm, Map<String, Object> parameterMap, Model model) {
        
        // 取得表单关联主表信息数据
        String formTableHql = "from ConfFormTable where formName=? AND packageName=? AND tableType='main'";
        List<ConfFormTable> formTableList = confFormTableDao.find(formTableHql, confForm.getFormName(), confForm.getPackageName());
        // 表单信息
        CodeGenerateBean bean = new CodeGenerateBean();
        if (null != formTableList && formTableList.size() > 0) {
            ConfFormTable confFormTable = formTableList.get(0);
            // 包名
            bean.setPackageName(packageName);
            // 表单名
            bean.setFormName(confFormTable.getFormName());
            // 实体类名(首字母大写)
            String entityName = confFormTable.getTableName().replace("IB_", "").toLowerCase();
            bean.setEntityName(StringUtils.capitalize(entityName));
            // 表名
            bean.setTableName(confFormTable.getTableName());
            // 主键生成测率 UUID
            bean.setKeyType("uuid");
            // 实体功能描述
            String tableHql = "from ConfTable where tableName=? AND packageName=?";
            List<ConfTable> tables = tableDao.find(tableHql, confFormTable.getTableName(), packageName);
            if (null != tables && tables.size() > 0) {
                bean.setEntityTitle(tables.get(0).getTableNameComment());
            }
            // 每行字段数目 1
            bean.setRowNumber("1");
            // 风格
            bean.setFormStyle("formStyle");
            // 菜单URL
            bean.setMenuUrl("/" + entityName + "/" + entityName + "-list.do");
            
            // 需要生成的代码
            List<String> selectedItems = new ArrayList<String>();
            selectedItems.add("checkboxController");
            selectedItems.add("checkboxJsp");
            selectedItems.add("checkboxEntity");
            selectedItems.add("checkboxService");
            bean.setSelectedItems(selectedItems);
        }
        
        // 取得表单关联子表信息数据
        String subFormTableHql = "from ConfFormTable where formName=? AND packageName=? AND tableType='sub'";
        List<ConfFormTable> subFormTableList = confFormTableDao.find(subFormTableHql, confForm.getFormName(), confForm.getPackageName());
        if (null != subFormTableList && subFormTableList.size() > 0) {
            for (ConfFormTable confFormTable : subFormTableList) {
                CodeGenerateBean subbean = new CodeGenerateBean();
                // 包名
                subbean.setPackageName(packageName);
                // 表单名
                subbean.setFormName(confFormTable.getFormName());
                // 实体类名(首字母大写)
                String entityName = confFormTable.getTableName().replace("IB_", "").toLowerCase();
                subbean.setEntityName(StringUtils.capitalize(entityName));
                // 表名
                subbean.setTableName(confFormTable.getTableName());
                // 主键生成测率 UUID
                subbean.setKeyType("UUID");
                // 实体功能描述
                String tableHql = "from ConfTable where tableName=? AND packageName=?";
                List<ConfTable> tables = tableDao.find(tableHql, confFormTable.getTableName(), packageName);
                if (null != tables && tables.size() > 0) {
                    subbean.setEntityTitle(tables.get(0).getTableNameComment());
                }
                // 每行字段数目 1
                subbean.setRowNumber("1");
                // 风格
                subbean.setFormStyle("formStyle");
                // 菜单URL
                subbean.setMenuUrl("/" + entityName + "/" + entityName + "-list.do");
                // 需要生成的代码选项信息
                List<String> selectedItems = new ArrayList<String>();
                selectedItems.add("checkboxController");
                selectedItems.add("checkboxJsp");
                selectedItems.add("checkboxEntity");
                selectedItems.add("checkboxService");
                subbean.setSelectedItems(selectedItems);
                
                // 将子表信息设置到主表中
                bean.getSubCodeGenerateBeans().add(subbean);
            }
        }
        
        // 设置信息
        model.addAttribute("model", bean);
        return "component/form/conf-form-input.jsp";
    }
    // ======================================================================
    @Resource
    public void setConfFormDao(ConfFormDao confFormDao) {
        this.confFormDao = confFormDao;
    }
    @Resource
    public void setConfFormTableDao(ConfFormTableDao confFormTableDao) {
        this.confFormTableDao = confFormTableDao;
    }
    @Resource
    public void setTableDao(TableDao tableDao) {
        this.tableDao = tableDao;
    }
    @Resource
    public void setComponentDao(ComponentDao componentDao) {
        this.componentDao = componentDao;
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
