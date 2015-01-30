package com.codegenerate.projectmanage.controller;

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

import com.codegenerate.projectmanage.entity.Material_wasteEntity;
import com.codegenerate.projectmanage.service.Material_wasteService;

/**   
 * @Title: Controller
 * @Description: 作废产品原料清单页面
 * @author JiangBo
 *
 */
@Controller
@RequestMapping("material_waste")
public class Material_wasteController {

    private MessageHelper messageHelper;
    private Material_wasteService material_wasteService;
   /**
     * 列表
     */
    @RequestMapping("material_waste-list")
    public String list(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, Model model) {
        // 查询条件Filter过滤器
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        // 添加当前公司(用户范围)ID查询
    	propertyFilters = CommonBusiness.getInstance().editPFByScopeId(propertyFilters);
        // 根据条件查询数据
        page = material_wasteService.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        // 返回JSP
        return "codegenerate/projectmanage/material_waste-list.jsp";
    }
    
    /**
     * 插入
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("material_waste-input")
    public String input(@RequestParam(value = "id", required = false) String id, Model model) {
        Material_wasteEntity entity = null;
        if (!CommonUtils.isNull(id)) {
            entity = material_wasteService.get(id);
        } else {
            entity = new Material_wasteEntity();
        }
        
        // 默认值公式
        entity = (Material_wasteEntity) new FormulaCommon().defaultValue(entity, "IB_MATERIAL_WASTE");
        
        model.addAttribute("model", entity);
        
        // 在controller中设置页面控件用的数据
        return "codegenerate/projectmanage/material_waste-input.jsp";
    }

    /**
     * 保存
     * 
     * @return
     * @throws Exception
     */
    @RequestMapping("material_waste-save")
    public String save(@ModelAttribute Material_wasteEntity entity, RedirectAttributes redirectAttributes) throws Exception {
        // 先进行校验
        // 再进行数据复制
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            entity.setId(UUID.randomUUID().toString());
            material_wasteService.insert(entity);
        } else {
            material_wasteService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/material_waste/material_waste-list.do";
    }
   /**
     * 删除
     * @param selectedItem
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("material_waste-remove")
    public String remove(@RequestParam("selectedItem") List<String> selectedItem, RedirectAttributes redirectAttributes) {
        List<Material_wasteEntity> entitys = material_wasteService.findByIds(selectedItem);
        for (Material_wasteEntity entity : entitys) {
            material_wasteService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");

        return "redirect:/material_waste/material_waste-list.do";
    }
    /**
     * excel导出
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("material_waste-export")
    public void excelExport(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, HttpServletResponse response) {
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        page = material_wasteService.pagedQuery(page, propertyFilters);
        List<Material_wasteEntity> beans = (List<Material_wasteEntity>) page.getResult();

        TableModel tableModel = new TableModel();
        // excel文件名
        tableModel.setExcelName("作废产品原料清单页面"+CommonUtils.getInstance().getCurrentDateTime());
        // 列名
        tableModel.addHeaders("materialno", "materialname", "model", "materialnum", "currentstatus", "processingresults", "id");
        tableModel.setTableName("IB_MATERIAL_WASTE");
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
    @RequestMapping("material_waste-importExcel")
    public String importExport(@RequestParam("attachment") MultipartFile attachment, HttpServletResponse response) {
        try {
            File file = new File("test.xls"); 
            attachment.transferTo(file);
            // 
            TableModel tableModel = new TableModel();
            // 列名
            tableModel.addHeaders("materialno", "materialname", "model", "materialnum", "currentstatus", "processingresults", "id");
            // 导入
            new ExcelCommon().uploadExcel(file, tableModel, "com.codegenerate.projectmanage.entity.Material_wasteEntity");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/material_waste/material_waste-list.do";
    }
    // ======================================================================
    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }

    @Resource
    public void setMaterial_wasteService(Material_wasteService material_wasteService) {
        this.material_wasteService = material_wasteService;
    }
    
}
