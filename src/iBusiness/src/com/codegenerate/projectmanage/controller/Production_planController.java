package com.codegenerate.projectmanage.controller;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import net.sf.json.JSONObject;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import org.springframework.web.multipart.MultipartFile;
import com.ibusiness.common.export.ExcelCommon;
import com.ibusiness.common.export.TableModel;
import com.ibusiness.common.service.FormulaCommon;

import com.ibusiness.security.util.SpringSecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import org.activiti.engine.impl.interceptor.Command;
import org.activiti.engine.task.Task;
import org.apache.commons.io.IOUtils;

import com.ibusiness.common.model.ConfSelectItem;
import com.ibusiness.bpm.cmd.ProcessInstanceDiagramCmd;
import com.ibusiness.bpm.service.BpmComBusiness;
import com.ibusiness.core.spring.MessageHelper;
import com.ibusiness.common.page.PropertyFilter;
import com.ibusiness.common.page.Page;
import com.ibusiness.common.util.CommonUtils;
import com.ibusiness.security.util.SpringSecurityUtils;

import com.codegenerate.projectmanage.entity.Production_planEntity;
import com.codegenerate.projectmanage.service.Production_planService;
import com.codegenerate.projectmanage.entity.Production_plan_sEntity;
import com.codegenerate.projectmanage.service.Production_plan_sService;

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
        private Production_plan_sService production_plan_sService;
   /**
     * 列表
     */
    @RequestMapping("production_plan-list")
    public String list(@ModelAttribute Page page,  @RequestParam Map<String, Object> parameterMap, Model model) {
        // 查询条件Filter过滤器
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        // 根据条件查询数据
        page = production_planService.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        // 返回JSP
        return "codegenerate/projectmanage/production_plan-list.jsp";
    }
    /**
     * 新建一条流程, 进入流程表单信息页面
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("production_plan-input")
    public String input(@ModelAttribute Page page,  @RequestParam(value = "id", required = false) String id, Model model) {
        Production_planEntity entity = null;
        if (!CommonUtils.isNull(id)) {
            entity = production_planService.get(id);
        } else {
            entity = new Production_planEntity();
        }
        // 默认值公式
        entity = (Production_planEntity) new FormulaCommon().defaultValue(entity, "IB_PRODUCTION_PLAN");
        
        model.addAttribute("model", entity);
        // 子表信息
        Map<String, Object> map = new HashMap<String, Object>();
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(map);
        propertyFilters.add(new PropertyFilter("EQS_parentid", id));
        // 根据条件查询数据
	        page = production_plan_sService.pagedQuery(page, propertyFilters);
	        model.addAttribute("page", page);
        
        // 在controller中设置页面控件用的数据
        return "codegenerate/projectmanage/production_plan-input.jsp";
    }
    
    /**
     * 子表新建
     */
    @RequestMapping("production_plan_s-input")
    public String production_plan_sInput(@RequestParam(value = "flowId", required = false) String flowId, @RequestParam("id") String id, @RequestParam("subId") String subId, Model model) {
        Production_plan_sEntity entity = production_plan_sService.get(subId);
        model.addAttribute("model", entity);
        model.addAttribute("parentid", id);
        model.addAttribute("flowId", flowId);
        return "codegenerate/projectmanage/production_plan_s-input.jsp";
    }
    /**
     * 保存主表
     * 
     * @return
     * @throws Exception
     */
    @RequestMapping("production_plan-save")
    public String saveDraft(@ModelAttribute Production_planEntity entity, RedirectAttributes redirectAttributes) throws Exception {
        // 再进行数据复制
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            entity.setId(UUID.randomUUID().toString());
            production_planService.insert(entity);
            id = entity.getId();
        } else {
            production_planService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/production_plan/production_plan-input.do?id=" + id;
    }
    /**
     * 子表保存
     */
    @RequestMapping("production_plan_s-save")
    public String subSave(@ModelAttribute Production_plan_sEntity entity, @RequestParam(value = "flowId", required = false) String flowId, @RequestParam(value = "parentid", required = false) String parentid, RedirectAttributes redirectAttributes) throws Exception {
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            id = UUID.randomUUID().toString();
            entity.setId(id);
            entity.setParentid(parentid);
            production_plan_sService.insert(entity);
        } else {
            production_plan_sService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/production_plan/production_plan-input.do?id=" + entity.getParentid();
    }
    /**
     * 子表 excel导出
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("production_plan_s-export")
    public void excelProduction_plan_sExport(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, HttpServletResponse response) {
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        page = production_plan_sService.pagedQuery(page, propertyFilters);
        List<Production_plan_sEntity> beans = (List<Production_plan_sEntity>) page.getResult();

        TableModel tableModel = new TableModel();
        // excel文件名
        tableModel.setExcelName("项目生产计划表"+CommonUtils.getInstance().getCurrentDateTime());
        // 列名
        tableModel.addHeaders();
        tableModel.setTableName("IB_PRODUCTION_PLAN");
        tableModel.setData(beans);
        try {
            new ExcelCommon().exportExcel(response, tableModel);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    /**
     * 子表 excel导入
     */
    @RequestMapping("production_plan_s-importExcel")
    public String importProduction_plan_sExport(@RequestParam("attachment") MultipartFile attachment, @RequestParam(value = "parentid", required = false) String parentid, HttpServletResponse response) {
        try {
            File file = new File("test.xls"); 
            attachment.transferTo(file);
            // 
            TableModel tableModel = new TableModel();
            // 列名
            tableModel.addHeaders();
            // 导入
            new ExcelCommon().uploadExcel(file, tableModel, "com.codegenerate.projectmanage.entity.Production_plan_sEntity");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/production_plan/production_plan-input.do?id=" + parentid;
    }
    /**
     * 删除一条流程信息
     * @param selectedItem
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("production_plan-remove")
    public String remove(@RequestParam("selectedItem") List<String> selectedItem, @RequestParam(value = "flowId", required = false) String flowId, RedirectAttributes redirectAttributes) {
        List<Production_planEntity> entitys = production_planService.findByIds(selectedItem);
        for (Production_planEntity entity : entitys) {
            production_planService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");

        return "redirect:/production_plan/production_plan-list.do?flowId=" + flowId;
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
        @Resource
	    public void setProduction_plan_sService(Production_plan_sService production_plan_sService) {
	        this.production_plan_sService = production_plan_sService;
	    }
}
