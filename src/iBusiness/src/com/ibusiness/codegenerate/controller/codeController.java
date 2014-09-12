package com.ibusiness.codegenerate.controller;

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
public class codeController {

    private ConfFormTableDao confFormTableDao;
    private MessageHelper messageHelper;
    /**
     * 一对一生成器
     * 
     * @param parameterMap
     * @param model
     * @return
     */
    @RequestMapping("code-oneGUI-input")
    public String oneGUIInput(@RequestParam("packageName") String packageName, @RequestParam Map<String, Object> parameterMap, Model model) {
        // 一对一生成器
        
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
