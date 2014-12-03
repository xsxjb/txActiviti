package com.codegenerate.crmmanage.controller;

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

import com.codegenerate.crmmanage.entity.SupplierEntity;
import com.codegenerate.crmmanage.service.SupplierService;

/**   
 * @Title: Controller
 * @Description: 原材料供应商维护
 * @author JiangBo
 *
 */
@Controller
@RequestMapping("supplier")
public class SupplierController {

    private MessageHelper messageHelper;
    private SupplierService supplierService;
   /**
     * 列表
     */
    @RequestMapping("supplier-list")
    public String list(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, Model model) {
        // 查询条件Filter过滤器
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        // 根据条件查询数据
        page = supplierService.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        // 返回JSP
        return "codegenerate/crmmanage/supplier-list.jsp";
    }
    
    /**
     * 插入
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("supplier-input")
    public String input(@RequestParam(value = "id", required = false) String id, Model model) {
        SupplierEntity entity = null;
        if (!CommonUtils.isNull(id)) {
            entity = supplierService.get(id);
        } else {
            entity = new SupplierEntity();
        }
        model.addAttribute("model", entity);
        
        // 在controller中设置页面控件用的数据
        return "codegenerate/crmmanage/supplier-input.jsp";
    }

    /**
     * 保存
     * 
     * @return
     * @throws Exception
     */
    @RequestMapping("supplier-save")
    public String save(@ModelAttribute SupplierEntity entity, RedirectAttributes redirectAttributes) throws Exception {
        // 先进行校验
        // 再进行数据复制
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            entity.setId(UUID.randomUUID().toString());
            supplierService.insert(entity);
        } else {
            supplierService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/supplier/supplier-list.do";
    }
   /**
     * 删除
     * @param selectedItem
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("supplier-remove")
    public String remove(@RequestParam("selectedItem") List<String> selectedItem, RedirectAttributes redirectAttributes) {
        List<SupplierEntity> entitys = supplierService.findByIds(selectedItem);
        for (SupplierEntity entity : entitys) {
            supplierService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");

        return "redirect:/supplier/supplier-list.do";
    }
    
    // ======================================================================
    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }

    @Resource
    public void setSupplierService(SupplierService supplierService) {
        this.supplierService = supplierService;
    }
    
}
