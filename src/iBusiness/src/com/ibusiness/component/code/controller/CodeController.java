package com.ibusiness.component.code.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ibusiness.codegenerate.code.generate.CodeGenerate;
import com.ibusiness.codegenerate.code.window.CreateFileProperty;
import com.ibusiness.component.code.entity.CodeGenerateBean;
import com.ibusiness.component.form.dao.ConfFormDao;
import com.ibusiness.component.form.dao.ConfFormTableDao;
import com.ibusiness.component.form.entity.ConfForm;
import com.ibusiness.component.form.entity.ConfFormTable;
import com.ibusiness.core.spring.MessageHelper;

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
    private MessageHelper messageHelper;
    
    /**
     * 生成器列表
     */
    @RequestMapping("code-generate-list")
    public String codeGenerateList(@RequestParam("packageName") String packageName, @RequestParam("formId") String formId, @RequestParam Map<String, Object> parameterMap, Model model) {
        // 控制tab标签显示属性
        model.addAttribute("tabType", "formCode");
        // 包名
        model.addAttribute("packageName", packageName);
        model.addAttribute("formId", formId);
        
        return "component/form/conf-form-input.jsp";
    }
    
    /**
     * 一对一生成器
     * 
     * @param parameterMap
     * @param model
     * @return
     */
    @RequestMapping("code-oneGUI-input")
    public String oneGUIInput(@RequestParam("packageName") String packageName, @RequestParam("formId") String formId, @RequestParam Map<String, Object> parameterMap, Model model) {
        // 一对一生成器
        // 
        ConfForm confForm = confFormDao.get(formId);
        String formTableHql = "from ConfFormTable where formName=? AND packageName=?";
        List<ConfFormTable> formTableList = confFormTableDao.find(formTableHql, confForm.getFormName(), confForm.getPackageName());
        if (null != formTableList && formTableList.size() > 0) {
            ConfFormTable confFormTable = formTableList.get(0);
            CodeGenerateBean bean = new CodeGenerateBean();
            // 包名
            bean.setPackageName(packageName);
            // 实体类名(首字母大写)
//            bean.setEntityName(entityName);
            // 表名
            bean.setTableName(confFormTable.getTableName());
            // 主键生成测率 UUID
            bean.setKeyType("UUID");
            // 实体功能描述
//            bean.setEntityTitle(entityTitle);
            // 行字段数目 1
            bean.setRowNumber("1");
            // 风格
            bean.setFormStyle("formStyle");
            // 
            model.addAttribute("model", bean);
            model.addAttribute("formId", formId);
            List<String> selectedItems = new ArrayList<String>();
            selectedItems.add("checkboxController");
            selectedItems.add("checkboxJsp");
            selectedItems.add("checkboxEntity");
            selectedItems.add("checkboxService");
            model.addAttribute("selectedItem", selectedItems);
        }
        return "component/code/code-oneGUI-input.jsp";
    }
    /**
     * 生成
     * 
     * @param packageName
     * @param formId
     * @param parameterMap
     * @param model
     * @return
     */
    @RequestMapping("code-generate-save")
    public String codeGenerateSave(CodeGenerateBean bean, @RequestParam(value = "selectedItem", required = false) List<String> selectedItems,
            @RequestParam("formId") String formId, @RequestParam Map<String, Object> parameterMap, RedirectAttributes redirectAttributes) {
        // 自动生成Java，JSP代码
        CreateFileProperty localCreateFileProperty = new CreateFileProperty();
        for (String selectedItem : selectedItems) {
            if ("".equals(selectedItem)) {
                localCreateFileProperty.setJspMode("02");
            } else {
                localCreateFileProperty.setJspMode("01");
            }
            if ("checkboxController".equals(selectedItem)) {
                localCreateFileProperty.setActionFlag(true);
            }
            if ("checkboxJsp".equals(selectedItem)) {
                localCreateFileProperty.setJspFlag(true);
            }
            if ("checkboxService".equals(selectedItem)) {
                localCreateFileProperty.setServiceIFlag(true);
            }
            if ("checkboxServiceImp".equals(selectedItem)) {
                localCreateFileProperty.setServiceImplFlag(true);
            }
//            if ("".equals(selectedItem)) {
//                localCreateFileProperty.setPageFlag(true);
//            }
            if ("checkboxEntity".equals(selectedItem)) {
                localCreateFileProperty.setEntityFlag(true);
            }
        }
        
        // 自动生成Java，JSP代码
        new CodeGenerate(bean.getPackageName(), bean.getEntityName(), bean.getTableName(), bean.getEntityTitle(),
                localCreateFileProperty, 1, "uuid", "").generateToFile();
        //////////////////////////////////////////////////////////////////////////////////////////////////
        
        //step.1 准备好智能表单的配置
        //step.2 判断表是否存在
        //step.3 调用代码生成器
//        new CgformCodeGenerate(createFileProperty,generateEntity).generateToFile();
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "生成成功");
        
        return "component/code/code-generate-list.jsp?packageName="+ bean.getPackageName() + "&formId="+ formId;
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
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }
}
