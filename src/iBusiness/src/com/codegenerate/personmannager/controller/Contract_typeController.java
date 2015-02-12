package com.codegenerate.personmannager.controller;

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

import com.codegenerate.personmannager.entity.Contract_typeEntity;
import com.codegenerate.personmannager.service.Contract_typeService;

/**   
 * @Title: Controller
 * @Description: 合同类型页面
 * @author JiangBo
 *
 */
@Controller
@RequestMapping("contract_type")
public class Contract_typeController {

    private MessageHelper messageHelper;
    private Contract_typeService contract_typeService;
   /**
     * 列表
     */
    @RequestMapping("contract_type-list")
    public String list(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, Model model) {
        // 查询条件Filter过滤器
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        // 添加当前公司(用户范围)ID查询
    	propertyFilters = CommonBusiness.getInstance().editPFByScopeId(propertyFilters);
        // 根据条件查询数据
        page = contract_typeService.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        // 返回JSP
        return "codegenerate/personmannager/contract_type-list.jsp";
    }
    
    /**
     * 插入
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("contract_type-input")
    public String input(@RequestParam(value = "id", required = false) String id, Model model) {
        Contract_typeEntity entity = null;
        if (!CommonUtils.isNull(id)) {
            entity = contract_typeService.get(id);
        } else {
            entity = new Contract_typeEntity();
        }
        
        // 默认值公式
        entity = (Contract_typeEntity) new FormulaCommon().defaultValue(entity, "IB_CONTRACT_TYPE");
        
        model.addAttribute("model", entity);
        
        // 在controller中设置页面控件用的数据
        return "codegenerate/personmannager/contract_type-input.jsp";
    }

    /**
     * 保存
     * 
     * @return
     * @throws Exception
     */
    @RequestMapping("contract_type-save")
    public String save(@ModelAttribute Contract_typeEntity entity, RedirectAttributes redirectAttributes) throws Exception {
        // 先进行校验
        // 再进行数据复制
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            entity.setId(UUID.randomUUID().toString());
            // 设置范围ID
            entity.setScopeid(CommonBusiness.getInstance().getCurrentUserScopeId());
            contract_typeService.insert(entity);
        } else {
            contract_typeService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/contract_type/contract_type-list.do";
    }
   /**
     * 删除
     * @param selectedItem
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("contract_type-remove")
    public String remove(@RequestParam("selectedItem") List<String> selectedItem, RedirectAttributes redirectAttributes) {
        List<Contract_typeEntity> entitys = contract_typeService.findByIds(selectedItem);
        for (Contract_typeEntity entity : entitys) {
            contract_typeService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");

        return "redirect:/contract_type/contract_type-list.do";
    }
    /**
     * excel导出
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("contract_type-export")
    public void excelExport(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, HttpServletResponse response) {
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        page = contract_typeService.pagedQuery(page, propertyFilters);
        List<Contract_typeEntity> beans = (List<Contract_typeEntity>) page.getResult();

        TableModel tableModel = new TableModel();
        // excel文件名
        tableModel.setExcelName("合同类型页面"+CommonUtils.getInstance().getCurrentDateTime());
        // 列名
        tableModel.addHeaders("typename", "typedescribe", "id", "scopeid");
        tableModel.setTableName("IB_CONTRACT_TYPE");
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
    @RequestMapping("contract_type-importExcel")
    public String importExport(@RequestParam("attachment") MultipartFile attachment, HttpServletResponse response) {
        try {
            File file = new File("test.xls"); 
            attachment.transferTo(file);
            // 
            TableModel tableModel = new TableModel();
            // 列名
            tableModel.addHeaders("typename", "typedescribe", "id", "scopeid");
            // 导入
            new ExcelCommon().uploadExcel(file, tableModel, "com.codegenerate.personmannager.entity.Contract_typeEntity");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/contract_type/contract_type-list.do";
    }
    // ======================================================================
    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }

    @Resource
    public void setContract_typeService(Contract_typeService contract_typeService) {
        this.contract_typeService = contract_typeService;
    }
    
}
