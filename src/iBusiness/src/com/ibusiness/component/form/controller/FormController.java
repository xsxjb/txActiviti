package com.ibusiness.component.form.controller;

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

import com.ibusiness.common.page.Page;
import com.ibusiness.common.page.PropertyFilter;
import com.ibusiness.common.util.CommonUtils;
import com.ibusiness.component.form.dao.ConfFormDao;
import com.ibusiness.component.form.entity.ConfForm;
import com.ibusiness.core.spring.MessageHelper;

/**
 * 表单管理
 * 
 * @author JiangBo
 * 
 */
@Controller
@RequestMapping("form")
public class FormController {

    private ConfFormDao confFormDao;
    private MessageHelper messageHelper;

    /**
     * 表单信息列表
     * 
     * @return
     */
    @RequestMapping("conf-form-list")
    public String formList(@ModelAttribute Page page, @RequestParam("packageName") String packageName, @RequestParam Map<String, Object> parameterMap, Model model) {
        // 取得表结构信息。
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        propertyFilters.add(new PropertyFilter("EQS_packageName", packageName));
        page = confFormDao.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        model.addAttribute("packageName", packageName);
        
        return "component/form/conf-form-list.jsp"; 
    }
    /**
     * 插入页面
     * 
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("conf-form-input")
    public String input(@RequestParam(value = "id", required = false) String id, @RequestParam("packageName") String packageName, Model model) {
        ConfForm confForm = null;
        if (id != null) {
            confForm = confFormDao.get(id);
        } else {
            confForm = new ConfForm();
            confForm.setPackageName(packageName);
        }
        model.addAttribute("model", confForm);

        return "component/form/conf-form-input.jsp";
    }
    
    /**
     * 保存
     * 
     * @return
     * @throws Exception
     */
    @RequestMapping("conf-form-save")
    public String save(@ModelAttribute ConfForm confForm, 
    @RequestParam Map<String, Object> parameterMap, RedirectAttributes redirectAttributes) throws Exception {
        String id = confForm.getId();
        if (CommonUtils.isNull(id)) {
            confForm.setId(UUID.randomUUID().toString());
            // save
            confFormDao.saveInsert(confForm);
        } else {
            // save
            confFormDao.save(confForm);
        }
        
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/form/conf-form-list.do?packageName=" + confForm.getPackageName();
    }
    
    /**
     * 注入 
     */
    @Resource
    public void setConfFormDao(ConfFormDao confFormDao) {
        this.confFormDao = confFormDao;
    }
    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }
}
