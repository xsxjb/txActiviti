package com.codegenerate.productmanage.controller;

import java.util.List;
import java.util.Map;
import java.util.UUID;
import net.sf.json.JSONObject;

import javax.annotation.Resource;
import java.io.File;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.multipart.MultipartFile;
import com.ibusiness.common.export.ExcelCommon;
import com.ibusiness.common.export.TableModel;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ibusiness.security.util.SpringSecurityUtils;
import com.ibusiness.common.model.ConfSelectItem;
import com.ibusiness.common.service.CommonBusiness;
import com.ibusiness.component.form.entity.ConfFormTableColumn;
import com.ibusiness.common.service.FormulaCommon;

import com.ibusiness.core.spring.MessageHelper;
import com.ibusiness.common.page.PropertyFilter;
import com.ibusiness.common.page.Page;
import com.ibusiness.common.util.CommonUtils;

import com.codegenerate.productmanage.entity.MaterialsEntity;
import com.codegenerate.productmanage.service.MaterialsService;

/**   
 * @Title: Controller
 * @Description: 原料表页面
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
        // 添加当前公司(用户范围)ID查询
    	propertyFilters = CommonBusiness.getInstance().editPFByScopeId(propertyFilters);
        // 根据条件查询数据
        page = materialsService.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        // 返回JSP
        return "codegenerate/productmanage/materials-list.jsp";
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
        
        // 默认值公式
        entity = (MaterialsEntity) new FormulaCommon().defaultValue(entity, "IB_MATERIALS");
        
        model.addAttribute("model", entity);
        
        // 在controller中设置页面控件用的数据
                Map<String, com.ibusiness.component.form.entity.ConfFormTableColumn> materialtypenoFTCMap= CommonBusiness.getInstance().getFormTableColumnMap("IB_MATERIALS", "materials");JSONObject materialtypenoJsonObj = JSONObject.fromObject(materialtypenoFTCMap.get("MATERIALTYPENO").getConfSelectInfo());String materialtypenoSql = materialtypenoJsonObj.getString("sql");List<Map<String,Object>> materialtypenoList = com.ibusiness.core.spring.ApplicationContextHelper.getBean(com.ibusiness.common.service.CommonBaseService.class).getJdbcTemplate().queryForList(materialtypenoSql);List<ConfSelectItem> materialtypenoItems = new java.util.ArrayList<ConfSelectItem>();for (Map<String,Object> mapBean : materialtypenoList) {    ConfSelectItem confSelectItem = new ConfSelectItem();    confSelectItem.setKey(mapBean.get("vKey").toString());    confSelectItem.setValue(mapBean.get("vValue").toString());    materialtypenoItems.add(confSelectItem);}model.addAttribute("materialtypenoItems", materialtypenoItems);
        return "codegenerate/productmanage/materials-input.jsp";
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
    /**
     * excel导出
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("materials-export")
    public void excelExport(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, HttpServletResponse response) {
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        page = materialsService.pagedQuery(page, propertyFilters);
        List<MaterialsEntity> beans = (List<MaterialsEntity>) page.getResult();

        TableModel tableModel = new TableModel();
        // excel文件名
        tableModel.setExcelName("原料表页面"+CommonUtils.getInstance().getCurrentDateTime());
        // 列名
        tableModel.addHeaders("id", "materialtypeno", "materialno", "materialname", "model", "materialprice", "materialunit");
        tableModel.setTableName("IB_MATERIALS");
        tableModel.setData(beans);
        try {
            new ExcelCommon().exportExcel(response, tableModel);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    /**
     * excel导入
     */
    @RequestMapping("materials-importExcel")
    public String importExport(@RequestParam("attachment") MultipartFile attachment, HttpServletResponse response) {
        try {
            File file = new File("test.xls"); 
            attachment.transferTo(file);
            // 
            TableModel tableModel = new TableModel();
            // 列名
            tableModel.addHeaders("id", "materialtypeno", "materialno", "materialname", "model", "materialprice", "materialunit");
            // 导入
            new ExcelCommon().uploadExcel(file, tableModel, "com.codegenerate.productmanage.entity.MaterialsEntity");
        } catch (Exception e) {
            e.printStackTrace();
        }
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
