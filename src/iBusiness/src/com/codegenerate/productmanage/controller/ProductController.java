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

import com.codegenerate.productmanage.entity.ProductEntity;
import com.codegenerate.productmanage.service.ProductService;

/**   
 * @Title: Controller
 * @Description: 产品管理表页面
 * @author JiangBo
 *
 */
@Controller
@RequestMapping("product")
public class ProductController {

    private MessageHelper messageHelper;
    private ProductService productService;
   /**
     * 列表
     */
    @RequestMapping("product-list")
    public String list(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, Model model) {
        // 查询条件Filter过滤器
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        // 添加当前公司(用户范围)ID查询
    	propertyFilters = CommonBusiness.getInstance().editPFByScopeId(propertyFilters);
        // 根据条件查询数据
        page = productService.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        // 返回JSP
        return "codegenerate/productmanage/product-list.jsp";
    }
    
    /**
     * 插入
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("product-input")
    public String input(@RequestParam(value = "id", required = false) String id, Model model) {
        ProductEntity entity = null;
        if (!CommonUtils.isNull(id)) {
            entity = productService.get(id);
        } else {
            entity = new ProductEntity();
        }
        
        // 默认值公式
        entity = (ProductEntity) new FormulaCommon().defaultValue(entity, "IB_PRODUCT");
        
        model.addAttribute("model", entity);
        
        // 在controller中设置页面控件用的数据
                Map<String, com.ibusiness.component.form.entity.ConfFormTableColumn> producttypeFTCMap= CommonBusiness.getInstance().getFormTableColumnMap("IB_PRODUCT", "product");JSONObject producttypeJsonObj = JSONObject.fromObject(producttypeFTCMap.get("PRODUCTTYPE").getConfSelectInfo());String producttypeSql = producttypeJsonObj.getString("sql");List<Map<String,Object>> producttypeList = com.ibusiness.core.spring.ApplicationContextHelper.getBean(com.ibusiness.common.service.CommonBaseService.class).getJdbcTemplate().queryForList(producttypeSql);List<ConfSelectItem> producttypeItems = new java.util.ArrayList<ConfSelectItem>();for (Map<String,Object> mapBean : producttypeList) {    ConfSelectItem confSelectItem = new ConfSelectItem();    confSelectItem.setKey(mapBean.get("vKey").toString());    confSelectItem.setValue(mapBean.get("vValue").toString());    producttypeItems.add(confSelectItem);}model.addAttribute("producttypeItems", producttypeItems);
        return "codegenerate/productmanage/product-input.jsp";
    }

    /**
     * 保存
     * 
     * @return
     * @throws Exception
     */
    @RequestMapping("product-save")
    public String save(@ModelAttribute ProductEntity entity, RedirectAttributes redirectAttributes) throws Exception {
        // 先进行校验
        // 再进行数据复制
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            entity.setId(UUID.randomUUID().toString());
            productService.insert(entity);
        } else {
            productService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/product/product-list.do";
    }
   /**
     * 删除
     * @param selectedItem
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("product-remove")
    public String remove(@RequestParam("selectedItem") List<String> selectedItem, RedirectAttributes redirectAttributes) {
        List<ProductEntity> entitys = productService.findByIds(selectedItem);
        for (ProductEntity entity : entitys) {
            productService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");

        return "redirect:/product/product-list.do";
    }
    /**
     * excel导出
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("product-export")
    public void excelExport(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, HttpServletResponse response) {
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        page = productService.pagedQuery(page, propertyFilters);
        List<ProductEntity> beans = (List<ProductEntity>) page.getResult();

        TableModel tableModel = new TableModel();
        // excel文件名
        tableModel.setExcelName("产品管理表页面"+CommonUtils.getInstance().getCurrentDateTime());
        // 列名
        tableModel.addHeaders("id", "producttype", "productflowid", "productno", "productname", "productmodel", "productunit", "unitprice");
        tableModel.setTableName("IB_PRODUCT");
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
    @RequestMapping("product-importExcel")
    public String importExport(@RequestParam("attachment") MultipartFile attachment, HttpServletResponse response) {
        try {
            File file = new File("test.xls"); 
            attachment.transferTo(file);
            // 
            TableModel tableModel = new TableModel();
            // 列名
            tableModel.addHeaders("id", "producttype", "productflowid", "productno", "productname", "productmodel", "productunit", "unitprice");
            // 导入
            new ExcelCommon().uploadExcel(file, tableModel, "com.codegenerate.productmanage.entity.ProductEntity");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/product/product-list.do";
    }
    // ======================================================================
    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }

    @Resource
    public void setProductService(ProductService productService) {
        this.productService = productService;
    }
    
}
