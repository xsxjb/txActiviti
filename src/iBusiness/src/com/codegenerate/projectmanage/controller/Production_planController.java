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

import com.codegenerate.projectmanage.entity.Production_planEntity;
import com.codegenerate.projectmanage.service.Production_planService;

/**   
 * @Title: Controller
 * @Description: 项目生产计划表
 * @author JiangBo
 *
 */
@Controller
@RequestMapping("production_plan")
public class Production_planController {

    private MessageHelper messageHelper;
    private Production_planService production_planService;
   /**
     * 列表
     */
    @RequestMapping("production_plan-list")
    public String list(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, Model model) {
        // 查询条件Filter过滤器
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        // 根据条件查询数据
        page = production_planService.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        // 返回JSP
        return "codegenerate/projectmanage/production_plan-list.jsp";
    }
    
    /**
     * 插入
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("production_plan-input")
    public String input(@RequestParam(value = "id", required = false) String id, Model model) {
        Production_planEntity entity = null;
        if (!CommonUtils.isNull(id)) {
            entity = production_planService.get(id);
        } else {
            entity = new Production_planEntity();
        }
        
        // 默认值公式
        entity = (Production_planEntity) new FormulaCommon().defaultValue(entity, "IB_PRODUCTION_PLAN");
        
        model.addAttribute("model", entity);
        
        // 在controller中设置页面控件用的数据
        return "codegenerate/projectmanage/production_plan-input.jsp";
    }

    /**
     * 保存
     * 
     * @return
     * @throws Exception
     */
    @RequestMapping("production_plan-save")
    public String save(@ModelAttribute Production_planEntity entity, RedirectAttributes redirectAttributes) throws Exception {
        // 先进行校验
        // 再进行数据复制
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            entity.setId(UUID.randomUUID().toString());
            production_planService.insert(entity);
        } else {
            production_planService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/production_plan/production_plan-list.do";
    }
   /**
     * 删除
     * @param selectedItem
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("production_plan-remove")
    public String remove(@RequestParam("selectedItem") List<String> selectedItem, RedirectAttributes redirectAttributes) {
        List<Production_planEntity> entitys = production_planService.findByIds(selectedItem);
        for (Production_planEntity entity : entitys) {
            production_planService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");

        return "redirect:/production_plan/production_plan-list.do";
    }
    /**
     * excel导出
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("production_plan-export")
    public void excelExport(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, HttpServletResponse response) {
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        page = production_planService.pagedQuery(page, propertyFilters);
        List<Production_planEntity> beans = (List<Production_planEntity>) page.getResult();

        TableModel tableModel = new TableModel();
        // excel文件名
        tableModel.setExcelName("项目生产计划表"+CommonUtils.getInstance().getCurrentDateTime());
        // 列名
        tableModel.addHeaders("projectno", "projectname", "projecttype", "customername", "productmanage", "batchno", "productiontype", "productionmode", "productionaddress", "producttype", "productflowid", "productno", "productname", "productmodel", "workingday", "starttime", "endtime", "buystarttime", "buyendtime", "prodstarttime", "prodendtime", "prodoutstarttime", "prodoutendtime", "id");
        tableModel.setTableName("IB_PRODUCTION_PLAN");
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
    @RequestMapping("production_plan-importExcel")
    public String importExport(@RequestParam("attachment") MultipartFile attachment, HttpServletResponse response) {
        try {
            File file = new File("test.xls"); 
            attachment.transferTo(file);
            // 
            TableModel tableModel = new TableModel();
            // 列名
            tableModel.addHeaders("projectno", "projectname", "projecttype", "customername", "productmanage", "batchno", "productiontype", "productionmode", "productionaddress", "producttype", "productflowid", "productno", "productname", "productmodel", "workingday", "starttime", "endtime", "buystarttime", "buyendtime", "prodstarttime", "prodendtime", "prodoutstarttime", "prodoutendtime", "id");
            // 导入
            new ExcelCommon().uploadExcel(file, tableModel, "com.codegenerate.projectmanage.entity.Production_planEntity");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/production_plan/production_plan-list.do";
    }
    // ======================================================================
    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }

    @Resource
    public void setProduction_planService(Production_planService production_planService) {
        this.production_planService = production_planService;
    }
    
}
