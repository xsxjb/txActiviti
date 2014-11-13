package com.codegenerate.test.controller;

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

import com.ibusiness.common.model.ConfSelectItem;
import com.ibusiness.common.service.CommonBusiness;
import com.ibusiness.component.form.entity.ConfFormTableColumn;

import com.ibusiness.core.spring.MessageHelper;
import com.ibusiness.common.page.PropertyFilter;
import com.ibusiness.common.page.Page;
import com.ibusiness.common.util.CommonUtils;

import com.codegenerate.test.entity.TestEntity;
import com.codegenerate.test.service.TestService;

/**   
 * @Title: Controller
 * @Description: 测试练习表
 * @author JiangBo
 *
 */
@Controller
@RequestMapping("test")
public class TestController {

    private MessageHelper messageHelper;
    private TestService testService;
   /**
     * 列表
     */
    @RequestMapping("test-list")
    public String list(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, Model model) {
        // 查询条件Filter过滤器
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        // 根据条件查询数据
        page = testService.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        // 返回JSP
        return "codegenerate/test/test-list.jsp";
    }
    
    /**
     * 插入
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("test-input")
    public String input(@RequestParam(value = "id", required = false) String id, Model model) {
        TestEntity entity = null;
        if (!CommonUtils.isNull(id)) {
            entity = testService.get(id);
        } else {
            entity = new TestEntity();
        }
        model.addAttribute("model", entity);
        // 取得表单对应表管理表Map
        Map<String, ConfFormTableColumn> formTableColumnMap= CommonBusiness.getInstance().getFormTableColumnMap("IB_TEST", "testForm");
	            // 下拉列表
	            List<ConfSelectItem> sexItems = (List<ConfSelectItem>) CommonUtils.getListFromJson(formTableColumnMap.get("SEX").getConfSelectInfo(), ConfSelectItem.class);
                model.addAttribute("sexItems", sexItems);
        return "codegenerate/test/test-input.jsp";
    }

    /**
     * 保存
     * 
     * @return
     * @throws Exception
     */
    @RequestMapping("test-save")
    public String save(@ModelAttribute TestEntity entity, RedirectAttributes redirectAttributes) throws Exception {
        // 先进行校验
        // 再进行数据复制
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            entity.setId(UUID.randomUUID().toString());
            testService.insert(entity);
        } else {
            testService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/test/test-list.do";
    }
   /**
     * 删除
     * @param selectedItem
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("test-remove")
    public String remove(@RequestParam("selectedItem") List<String> selectedItem, RedirectAttributes redirectAttributes) {
        List<TestEntity> entitys = testService.findByIds(selectedItem);
        for (TestEntity entity : entitys) {
            testService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");

        return "redirect:/test/test-list.do";
    }
    
    // ======================================================================
    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }

    @Resource
    public void setTestService(TestService testService) {
        this.testService = testService;
    }
    
}
