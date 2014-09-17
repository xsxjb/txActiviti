package com.ibusiness.codebpm.controller.test;

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

import com.ibusiness.core.spring.MessageHelper;
import com.ibusiness.common.page.PropertyFilter;
import com.ibusiness.common.page.Page;
import com.ibusiness.common.util.CommonUtils;

import com.ibusiness.codebpm.entity.test.Test1Entity;
import com.ibusiness.codebpm.service.test.Test1Service;

/**   
 * @Title: Controller
 * @Description: 测试表1
 * @author JiangBo
 *
 */
@Controller
@RequestMapping("test1")
public class Test1Controller {

    private MessageHelper messageHelper;
    private Test1Service test1Service;
   /**
     * 列表
     */
    @RequestMapping("test1-list")
    public String list(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, Model model) {
        // 查询条件Filter过滤器
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        // 根据条件查询数据
        page = test1Service.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        // 返回JSP
        return "codebpm/test/test1-list.jsp";
    }
    
    /**
     * 插入
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("test1-input")
    public String input(@RequestParam(value = "id", required = false) String id, Model model) {
        Test1Entity entity = null;
        if (!CommonUtils.isNull(id)) {
            entity = test1Service.get(id);
        } else {
            entity = new Test1Entity();
        }
        model.addAttribute("model", entity);
        
        return "codebpm/test/test1-input.jsp";
    }

    /**
     * 保存
     * 
     * @return
     * @throws Exception
     */
    @RequestMapping("test1-save")
    public String save(@ModelAttribute Test1Entity entity, RedirectAttributes redirectAttributes) throws Exception {
        // 先进行校验
        // 再进行数据复制
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            entity.setId(UUID.randomUUID().toString());
            test1Service.insert(entity);
        } else {
            test1Service.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/test1/test1-list.do";
    }
   /**
     * 删除
     * @param selectedItem
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("test1-remove")
    public String remove(@RequestParam("selectedItem") List<String> selectedItem, RedirectAttributes redirectAttributes) {
        List<Test1Entity> entitys = test1Service.findByIds(selectedItem);
        for (Test1Entity entity : entitys) {
            test1Service.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");

        return "redirect:/test1/test1-list.do";
    }
    
    // ======================================================================
    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }

    @Resource
    public void setTest1Service(Test1Service test1Service) {
        this.test1Service = test1Service;
    }
    
}
