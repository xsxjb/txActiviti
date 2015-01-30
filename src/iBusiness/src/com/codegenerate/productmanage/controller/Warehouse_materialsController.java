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

import com.codegenerate.productmanage.entity.Warehouse_materialsEntity;
import com.codegenerate.productmanage.service.Warehouse_materialsService;

/**   
 * @Title: Controller
 * @Description: 原料库存管理表页面
 * @author JiangBo
 *
 */
@Controller
@RequestMapping("warehouse_materials")
public class Warehouse_materialsController {

    private MessageHelper messageHelper;
    private Warehouse_materialsService warehouse_materialsService;
   /**
     * 列表
     */
    @RequestMapping("warehouse_materials-list")
    public String list(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, Model model) {
        // 查询条件Filter过滤器
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        // 添加当前公司(用户范围)ID查询
    	propertyFilters = CommonBusiness.getInstance().editPFByScopeId(propertyFilters);
        // 根据条件查询数据
        page = warehouse_materialsService.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        // 返回JSP
        return "codegenerate/productmanage/warehouse_materials-list.jsp";
    }
    
    /**
     * 插入
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("warehouse_materials-input")
    public String input(@RequestParam(value = "id", required = false) String id, Model model) {
        Warehouse_materialsEntity entity = null;
        if (!CommonUtils.isNull(id)) {
            entity = warehouse_materialsService.get(id);
        } else {
            entity = new Warehouse_materialsEntity();
        }
        
        // 默认值公式
        entity = (Warehouse_materialsEntity) new FormulaCommon().defaultValue(entity, "IB_WAREHOUSE_MATERIALS");
        
        model.addAttribute("model", entity);
        
        // 在controller中设置页面控件用的数据
        return "codegenerate/productmanage/warehouse_materials-input.jsp";
    }

    /**
     * 保存
     * 
     * @return
     * @throws Exception
     */
    @RequestMapping("warehouse_materials-save")
    public String save(@ModelAttribute Warehouse_materialsEntity entity, RedirectAttributes redirectAttributes) throws Exception {
        // 先进行校验
        // 再进行数据复制
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            entity.setId(UUID.randomUUID().toString());
            warehouse_materialsService.insert(entity);
        } else {
            warehouse_materialsService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/warehouse_materials/warehouse_materials-list.do";
    }
   /**
     * 删除
     * @param selectedItem
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("warehouse_materials-remove")
    public String remove(@RequestParam("selectedItem") List<String> selectedItem, RedirectAttributes redirectAttributes) {
        List<Warehouse_materialsEntity> entitys = warehouse_materialsService.findByIds(selectedItem);
        for (Warehouse_materialsEntity entity : entitys) {
            warehouse_materialsService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");

        return "redirect:/warehouse_materials/warehouse_materials-list.do";
    }
    /**
     * excel导出
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("warehouse_materials-export")
    public void excelExport(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, HttpServletResponse response) {
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        page = warehouse_materialsService.pagedQuery(page, propertyFilters);
        List<Warehouse_materialsEntity> beans = (List<Warehouse_materialsEntity>) page.getResult();

        TableModel tableModel = new TableModel();
        // excel文件名
        tableModel.setExcelName("原料库存管理表页面"+CommonUtils.getInstance().getCurrentDateTime());
        // 列名
        tableModel.addHeaders("id", "materialtypeno", "materialno", "materialname", "materialmodel", "materialprice", "materialunit", "materialnum", "warehouseno", "warehousename");
        tableModel.setTableName("IB_WAREHOUSE_MATERIALS");
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
    @RequestMapping("warehouse_materials-importExcel")
    public String importExport(@RequestParam("attachment") MultipartFile attachment, HttpServletResponse response) {
        try {
            File file = new File("test.xls"); 
            attachment.transferTo(file);
            // 
            TableModel tableModel = new TableModel();
            // 列名
            tableModel.addHeaders("id", "materialtypeno", "materialno", "materialname", "materialmodel", "materialprice", "materialunit", "materialnum", "warehouseno", "warehousename");
            // 导入
            new ExcelCommon().uploadExcel(file, tableModel, "com.codegenerate.productmanage.entity.Warehouse_materialsEntity");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/warehouse_materials/warehouse_materials-list.do";
    }
    // ======================================================================
    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }

    @Resource
    public void setWarehouse_materialsService(Warehouse_materialsService warehouse_materialsService) {
        this.warehouse_materialsService = warehouse_materialsService;
    }
    
}
