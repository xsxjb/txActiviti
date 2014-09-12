package com.ibusiness.component.code.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ibusiness.component.form.dao.ConfFormTableDao;
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
        model.addAttribute("model", formId);
        return "component/code/code-oneGUI-input.jsp";
    }
    
    
    // ======================================================================
    @Resource
    public void setConfFormTableDao(ConfFormTableDao confFormTableDao) {
        this.confFormTableDao = confFormTableDao;
    }
    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }
}
