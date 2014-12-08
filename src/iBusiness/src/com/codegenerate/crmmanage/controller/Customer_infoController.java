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

import com.ibusiness.common.model.ConfSelectItem;
import com.ibusiness.common.service.CommonBusiness;
import com.ibusiness.component.form.entity.ConfFormTableColumn;

import com.ibusiness.core.spring.MessageHelper;
import com.ibusiness.common.page.PropertyFilter;
import com.ibusiness.common.page.Page;
import com.ibusiness.common.util.CommonUtils;

import com.codegenerate.crmmanage.entity.Customer_infoEntity;
import com.codegenerate.crmmanage.service.Customer_infoService;

/**   
 * @Title: Controller
 * @Description: 客户信息表
 * @author JiangBo
 *
 */
@Controller
@RequestMapping("customer_info")
public class Customer_infoController {

    private MessageHelper messageHelper;
    private Customer_infoService customer_infoService;
   /**
     * 列表
     */
    @RequestMapping("customer_info-list")
    public String list(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, Model model) {
        // 查询条件Filter过滤器
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        // 根据条件查询数据
        page = customer_infoService.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        // 返回JSP
        return "codegenerate/crmmanage/customer_info-list.jsp";
    }
    
    /**
     * 插入
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("customer_info-input")
    public String input(@RequestParam(value = "id", required = false) String id, Model model) {
        Customer_infoEntity entity = null;
        if (!CommonUtils.isNull(id)) {
            entity = customer_infoService.get(id);
        } else {
            entity = new Customer_infoEntity();
        }
        model.addAttribute("model", entity);
        
        // 在controller中设置页面控件用的数据
        return "codegenerate/crmmanage/customer_info-input.jsp";
    }

    /**
     * 保存
     * 
     * @return
     * @throws Exception
     */
    @RequestMapping("customer_info-save")
    public String save(@ModelAttribute Customer_infoEntity entity, RedirectAttributes redirectAttributes) throws Exception {
        // 先进行校验
        // 再进行数据复制
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            entity.setId(UUID.randomUUID().toString());
            customer_infoService.insert(entity);
        } else {
            customer_infoService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/customer_info/customer_info-list.do";
    }
   /**
     * 删除
     * @param selectedItem
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("customer_info-remove")
    public String remove(@RequestParam("selectedItem") List<String> selectedItem, RedirectAttributes redirectAttributes) {
        List<Customer_infoEntity> entitys = customer_infoService.findByIds(selectedItem);
        for (Customer_infoEntity entity : entitys) {
            customer_infoService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");

        return "redirect:/customer_info/customer_info-list.do";
    }
    /**
     * excel导出
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("customer_info-export")
    public void excelExport(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, HttpServletResponse response) {
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        page = customer_infoService.pagedQuery(page, propertyFilters);
        List<Customer_infoEntity> beans = (List<Customer_infoEntity>) page.getResult();

        TableModel tableModel = new TableModel();
        // excel文件名
        tableModel.setExcelName("客户信息表"+CommonUtils.getInstance().getCurrentDateTime());
        // 列名
        tableModel.addHeaders("id", "customerno", "customerstate", "customername", "customertype", "customeraddress", "phone", "telephone", "salesmanager", "systemsales", "infosource", "relationshipstatus", "province", "city", "customernature", "superviseunit", "planinfo", "customerdemand", "cooperationinfo", "invoicename", "bank", "accountno", "taxid", "invoiceuser", "invoiceusertel", "invoicemailunitname", "mailaddress", "invoiczip", "invoicaddressee", "invoicphonetel", "customeruser", "userposition", "usertelephone", "userphone", "useremail", "userofficeaddress", "userzip");
        tableModel.setTableName("IB_CUSTOMER_INFO");
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
    @RequestMapping("customer_info-importExcel")
    public String importExport(@RequestParam("attachment") MultipartFile attachment, HttpServletResponse response) {
        try {
            File file = new File("test.xls"); 
            attachment.transferTo(file);
            // 
            TableModel tableModel = new TableModel();
            // 列名
            tableModel.addHeaders("id", "customerno", "customerstate", "customername", "customertype", "customeraddress", "phone", "telephone", "salesmanager", "systemsales", "infosource", "relationshipstatus", "province", "city", "customernature", "superviseunit", "planinfo", "customerdemand", "cooperationinfo", "invoicename", "bank", "accountno", "taxid", "invoiceuser", "invoiceusertel", "invoicemailunitname", "mailaddress", "invoiczip", "invoicaddressee", "invoicphonetel", "customeruser", "userposition", "usertelephone", "userphone", "useremail", "userofficeaddress", "userzip");
            // 导入
            new ExcelCommon().uploadExcel(file, tableModel, "com.codegenerate.crmmanage.entity.Customer_infoEntity");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/customer_info/customer_info-list.do";
    }
    // ======================================================================
    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }

    @Resource
    public void setCustomer_infoService(Customer_infoService customer_infoService) {
        this.customer_infoService = customer_infoService;
    }
    
}
