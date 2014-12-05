package com.codegenerate.productmanage.controller;

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

import com.codegenerate.productmanage.entity.Materials_typeEntity;
import com.codegenerate.productmanage.service.Materials_typeService;

/**   
 * @Title: Controller
 * @Description: 原料分类表
 * @author JiangBo
 *
 */
@Controller
@RequestMapping("materials_type")
public class Materials_typeController {

    private MessageHelper messageHelper;
    private Materials_typeService materials_typeService;
   /**
     * 列表
     */
    @RequestMapping("materials_type-list")
    public String list(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, Model model) {
        // 查询条件Filter过滤器
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        // 根据条件查询数据
        page = materials_typeService.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        // 返回JSP
        return "codegenerate/productmanage/materials_type-list.jsp";
    }
    
    /**
     * 插入
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("materials_type-input")
    public String input(@RequestParam(value = "id", required = false) String id, Model model) {
        Materials_typeEntity entity = null;
        if (!CommonUtils.isNull(id)) {
            entity = materials_typeService.get(id);
        } else {
            entity = new Materials_typeEntity();
        }
        model.addAttribute("model", entity);
        
        // 在controller中设置页面控件用的数据
                Map<String, com.ibusiness.component.form.entity.ConfFormTableColumn> rparentidFTCMap= CommonBusiness.getInstance().getFormTableColumnMap("IB_MATERIALS_TYPE", "materialsType");net.sf.json.JSONObject rparentidJsonObj = net.sf.json.JSONObject.fromObject(rparentidFTCMap.get("RPARENTID").getConfSelectInfo());String rparentidSql = rparentidJsonObj.getString("sql");List<Map<String,Object>> rparentidList = com.ibusiness.core.spring.ApplicationContextHelper.getBean(com.ibusiness.common.service.CommonBaseService.class).getJdbcTemplate().queryForList(rparentidSql);List<ConfSelectItem> rparentidItems = new java.util.ArrayList<ConfSelectItem>();for (Map<String,Object> mapBean : rparentidList) {    ConfSelectItem confSelectItem = new ConfSelectItem();    confSelectItem.setKey(mapBean.get("vKey").toString());    confSelectItem.setValue(mapBean.get("vValue").toString());    rparentidItems.add(confSelectItem);}model.addAttribute("rparentidItems", rparentidItems);
        return "codegenerate/productmanage/materials_type-input.jsp";
    }

    /**
     * 保存
     * 
     * @return
     * @throws Exception
     */
    @RequestMapping("materials_type-save")
    public String save(@ModelAttribute Materials_typeEntity entity, RedirectAttributes redirectAttributes) throws Exception {
        // 先进行校验
        // 再进行数据复制
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            entity.setId(UUID.randomUUID().toString());
            materials_typeService.insert(entity);
        } else {
            materials_typeService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/materials_type/materials_type-list.do";
    }
   /**
     * 删除
     * @param selectedItem
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("materials_type-remove")
    public String remove(@RequestParam("selectedItem") List<String> selectedItem, RedirectAttributes redirectAttributes) {
        List<Materials_typeEntity> entitys = materials_typeService.findByIds(selectedItem);
        for (Materials_typeEntity entity : entitys) {
            materials_typeService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");

        return "redirect:/materials_type/materials_type-list.do";
    }
    
    // ======================================================================
    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }

    @Resource
    public void setMaterials_typeService(Materials_typeService materials_typeService) {
        this.materials_typeService = materials_typeService;
    }
    
}
