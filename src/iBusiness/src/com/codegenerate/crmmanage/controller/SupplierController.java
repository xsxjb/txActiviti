package com.codegenerate.crmmanage.controller;

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

import com.codegenerate.crmmanage.entity.SupplierEntity;
import com.codegenerate.crmmanage.service.SupplierService;

/**   
 * @Title: Controller
 * @Description: 原材料供应商维护页面
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
        // 添加当前公司(用户范围)ID查询
    	propertyFilters = CommonBusiness.getInstance().editPFByScopeId(propertyFilters);
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
        
        // 默认值公式
        entity = (SupplierEntity) new FormulaCommon().defaultValue(entity, "IB_SUPPLIER");
        
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
    /**
     * excel导出
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("supplier-export")
    public void excelExport(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, HttpServletResponse response) {
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        page = supplierService.pagedQuery(page, propertyFilters);
        List<SupplierEntity> beans = (List<SupplierEntity>) page.getResult();

        TableModel tableModel = new TableModel();
        // excel文件名
        tableModel.setExcelName("原材料供应商维护页面"+CommonUtils.getInstance().getCurrentDateTime());
        // 列名
        tableModel.addHeaders("information", "suppliernumber", "category", "unitname", "useraddress", "unitcharacter", "registered", "enrolltime", "url", "companyphone", "companyfax", "product", "userperson", "userphone", "usermobilephone", "userfax", "businesscontacts", "contacttelephone", "contactmobilephone", "contactfax", "financialcontacts", "financialcall", "financialphone", "financialfax", "remittancename", "beneficiary", "taxno", "accountno", "yourcompany", "youraddress", "yourname", "yourphone", "telephone", "estinationcity", "updatas", "id");
        tableModel.setTableName("IB_SUPPLIER");
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
    @RequestMapping("supplier-importExcel")
    public String importExport(@RequestParam("attachment") MultipartFile attachment, HttpServletResponse response) {
        try {
            File file = new File("test.xls"); 
            attachment.transferTo(file);
            // 
            TableModel tableModel = new TableModel();
            // 列名
            tableModel.addHeaders("information", "suppliernumber", "category", "unitname", "useraddress", "unitcharacter", "registered", "enrolltime", "url", "companyphone", "companyfax", "product", "userperson", "userphone", "usermobilephone", "userfax", "businesscontacts", "contacttelephone", "contactmobilephone", "contactfax", "financialcontacts", "financialcall", "financialphone", "financialfax", "remittancename", "beneficiary", "taxno", "accountno", "yourcompany", "youraddress", "yourname", "yourphone", "telephone", "estinationcity", "updatas", "id");
            // 导入
            new ExcelCommon().uploadExcel(file, tableModel, "com.codegenerate.crmmanage.entity.SupplierEntity");
        } catch (Exception e) {
            e.printStackTrace();
        }
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
