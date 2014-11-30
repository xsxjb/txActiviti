package com.codegenerate.projectmanage.controller;

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

import com.codegenerate.projectmanage.entity.MaterialsEntity;
import com.codegenerate.projectmanage.service.MaterialsService;

/**   
 * @Title: Controller
 * @Description: 物料表
 * @author JiangBo
 *
 */
@Controller
@RequestMapping("materials")
public class MaterialsController {

    private MessageHelper messageHelper;
    private MaterialsService materialsService;
   /**
     * 列表
     */
    @RequestMapping("materials-list")
    public String list(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, Model model) {
        // 查询条件Filter过滤器
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        // 根据条件查询数据
        page = materialsService.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        // 返回JSP
        return "codegenerate/projectmanage/materials-list.jsp";
    }
    
    /**
     * 插入
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("materials-input")
    public String input(@RequestParam(value = "id", required = false) String id, Model model) {
        MaterialsEntity entity = null;
        if (!CommonUtils.isNull(id)) {
            entity = materialsService.get(id);
        } else {
            entity = new MaterialsEntity();
        }
        model.addAttribute("model", entity);
        
        // 在controller中设置页面控件用的数据
                Map<String, com.ibusiness.component.form.entity.ConfFormTableColumn> formTableColumnMap= CommonBusiness.getInstance().getFormTableColumnMap("IB_MATERIALS", "materials");net.sf.json.JSONObject jsonObj = net.sf.json.JSONObject.fromObject(formTableColumnMap.get("MATERIALTYPENO").getConfSelectInfo());String sql = jsonObj.getString("sql");
                List<Map<String,Object>> list = com.ibusiness.core.spring.ApplicationContextHelper.getBean(com.ibusiness.common.service.CommonBaseService.class).getJdbcTemplate().queryForList(sql);List<ConfSelectItem> materialtypenoItems = new java.util.ArrayList<ConfSelectItem>();for (Map<String,Object> mapBean : list) {    ConfSelectItem confSelectItem = new ConfSelectItem();    confSelectItem.setKey(mapBean.get("vKey").toString());    confSelectItem.setValue(mapBean.get("vValue").toString());    materialtypenoItems.add(confSelectItem);}model.addAttribute("materialtypenoItems", materialtypenoItems);
        return "codegenerate/projectmanage/materials-input.jsp";
    }

    /**
     * 保存
     * 
     * @return
     * @throws Exception
     */
    @RequestMapping("materials-save")
    public String save(@ModelAttribute MaterialsEntity entity, RedirectAttributes redirectAttributes) throws Exception {
        // 先进行校验
        // 再进行数据复制
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            entity.setId(UUID.randomUUID().toString());
            materialsService.insert(entity);
        } else {
            materialsService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/materials/materials-list.do";
    }
   /**
     * 删除
     * @param selectedItem
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("materials-remove")
    public String remove(@RequestParam("selectedItem") List<String> selectedItem, RedirectAttributes redirectAttributes) {
        List<MaterialsEntity> entitys = materialsService.findByIds(selectedItem);
        for (MaterialsEntity entity : entitys) {
            materialsService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");

        return "redirect:/materials/materials-list.do";
    }
    
    // ======================================================================
    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }

    @Resource
    public void setMaterialsService(MaterialsService materialsService) {
        this.materialsService = materialsService;
    }
    
}
