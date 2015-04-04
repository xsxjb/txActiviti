package com.codegenerate.devicemanage.controller;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import org.springframework.web.multipart.MultipartFile;
import com.ibusiness.common.export.ExcelCommon;
import com.ibusiness.common.export.TableModel;
import com.ibusiness.security.util.SpringSecurityUtils;
import com.ibusiness.common.service.FormulaCommon;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import org.activiti.engine.impl.interceptor.Command;
import org.activiti.engine.task.Task;
import org.apache.commons.io.IOUtils;

import net.sf.json.JSONObject;

import com.ibusiness.common.model.ConfSelectItem;
import com.ibusiness.bpm.cmd.ProcessInstanceDiagramCmd;
import com.ibusiness.bpm.service.BpmComBusiness;
import com.ibusiness.core.spring.MessageHelper;
import com.ibusiness.common.page.PropertyFilter;
import com.ibusiness.common.page.Page;
import com.ibusiness.common.service.CommonBusiness;
import com.ibusiness.common.util.CommonUtils;
import com.ibusiness.security.util.SpringSecurityUtils;
import com.ibusiness.base.user.entity.UserBase;

import com.codegenerate.devicemanage.entity.Device_inEntity;
import com.codegenerate.devicemanage.service.Device_inService;
import com.codegenerate.devicemanage.entity.Device_in_sEntity;
import com.codegenerate.devicemanage.service.Device_in_sService;

/**   
 * @Title: Controller
 * @Description: 设备入库表流程
 * @author JiangBo
 *
 */
@Controller
@RequestMapping("device_in")
public class Device_inController {

    private MessageHelper messageHelper;
    private Device_inService device_inService;
        private Device_in_sService device_in_sService;
   /**
     * 列表
     */
    @RequestMapping("device_in-list")
    public String list(@ModelAttribute Page page, @RequestParam(value = "flowId", required = false) String flowId, @RequestParam(value = "flowType", required = false) String flowType, @RequestParam Map<String, Object> parameterMap, Model model) {
        // 查询条件Filter过滤器
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        propertyFilters.add(new PropertyFilter("EQI_doneflag", flowType));
        propertyFilters.add(new PropertyFilter("EQS_assigneeuser", SpringSecurityUtils.getCurrentUserId()));
        // 根据条件查询数据
        page = device_inService.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        model.addAttribute("flowId", flowId);
        model.addAttribute("flowType", flowType);
        // 返回JSP
        return "codegenerate/devicemanage/device_in-list.jsp";
    }
    /**
     * 新建一条流程, 进入流程表单信息页面
     * @param id
     * @param model
     * @return
     */
    @RequestMapping("device_in-input")
    public String input(@ModelAttribute Page page, @RequestParam(value = "flowId", required = false) String flowId, @RequestParam(value = "id", required = false) String id, Model model) {
        Device_inEntity entity = null;
        BpmComBusiness bpmComBusiness = new BpmComBusiness();
        if (!CommonUtils.isNull(id)) {
            entity = device_inService.get(id);
        } else {
            entity = new Device_inEntity();
            
            // 发起一个流程, 设置当前用户执行
            String userId = SpringSecurityUtils.getCurrentUserId();
            String executionId = bpmComBusiness.flowStart(flowId, userId);
            entity.setExecutionid(executionId);
            // 设置流程实例信息=========================
            Task task = bpmComBusiness.getTaskIdByExecutionId(entity.getExecutionid());
            entity.setCreatedatebpm(task.getCreateTime());
            entity.setNodename(task.getName());
            entity.setAssigneeuser(userId);
            entity.setUsername(CommonBusiness.getInstance().getUserBean(userId).getDisplayName());
            entity.setDoneflag(0);
            // 进行存储
            entity.setId(UUID.randomUUID().toString());
            entity.setDoneflag(0);
            // 流程标题
            entity.setTasktitle("设备入库流程");
            device_inService.insert(entity);
        }
        
        // 默认值公式
        entity = (Device_inEntity) new FormulaCommon().defaultValue(entity, "IB_DEVICE_IN");
        
        model.addAttribute("model", entity);
        
        // 取得当前流程节点信息
        Task task = bpmComBusiness.getTaskIdByExecutionId(entity.getExecutionid());
        String nodeCode = task.getTaskDefinitionKey();
        // 根据流程和节点信息取得 流程指定节点的字段信息
        JSONObject json = bpmComBusiness.getNodeColumsInfo(flowId, entity.getExecutionid(), nodeCode, Device_inEntity.class);
        model.addAttribute("nodeColumsMap", json);
        
        // 子表信息
        Map<String, Object> map = new HashMap<String, Object>();
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(map);
        propertyFilters.add(new PropertyFilter("EQS_parentid", id));
        // 根据条件查询数据
	        page = device_in_sService.pagedQuery(page, propertyFilters);
	        model.addAttribute("device_in_sPage", page);
        
        // 流程ID
        model.addAttribute("flowId", flowId);
        // 取得用户
        List<UserBase> list = CommonBusiness.getInstance().getUserBaseList();
        model.addAttribute("userItems", list);
        // TODO
        model.addAttribute("userId", SpringSecurityUtils.getCurrentUserId());
        
        // 在controller中设置页面控件用的数据
                Map<String, com.ibusiness.component.form.entity.ConfFormTableColumn> suppliersnameFTCMap= CommonBusiness.getInstance().getFormTableColumnMap("IB_DEVICE_IN", "devicein");JSONObject suppliersnameJsonObj = JSONObject.fromObject(suppliersnameFTCMap.get("SUPPLIERSNAME").getConfSelectInfo());String suppliersnameSql = suppliersnameJsonObj.getString("sql");List<Map<String,Object>> suppliersnameList = com.ibusiness.core.spring.ApplicationContextHelper.getBean(com.ibusiness.common.service.CommonBaseService.class).getJdbcTemplate().queryForList(suppliersnameSql);List<ConfSelectItem> suppliersnameItems = new java.util.ArrayList<ConfSelectItem>();for (Map<String,Object> mapBean : suppliersnameList) {    ConfSelectItem confSelectItem = new ConfSelectItem();    confSelectItem.setKey(mapBean.get("vKey").toString());    confSelectItem.setValue(mapBean.get("vValue").toString());    suppliersnameItems.add(confSelectItem);}model.addAttribute("suppliersnameItems", suppliersnameItems);
                Map<String, com.ibusiness.component.form.entity.ConfFormTableColumn> warehousenoFTCMap= CommonBusiness.getInstance().getFormTableColumnMap("IB_DEVICE_IN", "devicein");JSONObject warehousenoJsonObj = JSONObject.fromObject(warehousenoFTCMap.get("WAREHOUSENO").getConfSelectInfo());String warehousenoSql = warehousenoJsonObj.getString("sql");List<Map<String,Object>> warehousenoList = com.ibusiness.core.spring.ApplicationContextHelper.getBean(com.ibusiness.common.service.CommonBaseService.class).getJdbcTemplate().queryForList(warehousenoSql);List<ConfSelectItem> warehousenoItems = new java.util.ArrayList<ConfSelectItem>();for (Map<String,Object> mapBean : warehousenoList) {    ConfSelectItem confSelectItem = new ConfSelectItem();    confSelectItem.setKey(mapBean.get("vKey").toString());    confSelectItem.setValue(mapBean.get("vValue").toString());    warehousenoItems.add(confSelectItem);}model.addAttribute("warehousenoItems", warehousenoItems);
        return "codegenerate/devicemanage/device_in-input.jsp";
    }
    
    /**
     * 控件添加的方法 ========
     */
    
    /**
     * 子表新建
     */
    @RequestMapping("device_in_s-input")
    public String device_in_sInput(@RequestParam(value = "flowId", required = false) String flowId, @RequestParam("id") String id, @RequestParam("subId") String subId, Model model) {
        Device_in_sEntity entity = device_in_sService.get(subId);
        model.addAttribute("model", entity);
        model.addAttribute("parentid", id);
        model.addAttribute("flowId", flowId);
        
        // 取得主表中的 executionid
        Device_inEntity mainEntity = device_inService.get(id);
        BpmComBusiness bpmComBusiness = new BpmComBusiness();
        // 取得当前流程节点信息
        Task task = bpmComBusiness.getTaskIdByExecutionId(mainEntity.getExecutionid());
        String nodeCode = task.getTaskDefinitionKey();
        // 根据流程和节点信息取得 流程指定节点的字段信息
        JSONObject json = bpmComBusiness.getNodeColumsInfo(flowId, mainEntity.getExecutionid(), nodeCode, Device_in_sEntity.class);
        model.addAttribute("nodeColumsMap", json);
        
        // 在controller中设置页面控件用的数据
        return "codegenerate/devicemanage/device_in_s-input.jsp";
    }
    /**
     * 办理
     * 
     * @return
     * @throws Exception
     */
    @RequestMapping("device_in-complete")
    public String completeTask(@ModelAttribute Device_inEntity entity, @RequestParam(value = "flowId", required = false) String flowId, @RequestParam(value = "userId", required = false) String userId, RedirectAttributes redirectAttributes) throws Exception {
        BpmComBusiness bpmComBusiness = new BpmComBusiness();
        String executionId = null;
        // 
        if (CommonUtils.isNull(entity.getExecutionid())) {
            // 启动流程, 设置执行实例ID
            executionId = bpmComBusiness.flowStart(flowId, userId);
            entity.setExecutionid(executionId);
            // 设置流程实例信息=========================
            Task task = bpmComBusiness.getTaskIdByExecutionId(entity.getExecutionid());
            entity.setCreatedatebpm(task.getCreateTime());
            entity.setNodename(task.getName());
            entity.setAssigneeuser(userId);
            entity.setUsername(CommonBusiness.getInstance().getUserBean(userId).getDisplayName());
            entity.setDoneflag(0);
        } else {
            Task task = bpmComBusiness.getTaskIdByExecutionId(entity.getExecutionid());
            // 办理流程
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("assignee", userId);
            map.put("bean", entity);
            
            bpmComBusiness.completeTask(task.getId(), map);
            if (bpmComBusiness.isFinishedByTask(entity.getExecutionid())) {
                entity.setDoneflag(1);
            } else {
                entity.setDoneflag(0);
            }
            // 设置流程实例信息=========================
            entity.setCreatedatebpm(task.getCreateTime());
            entity.setNodename(task.getName());
            entity.setAssigneeuser(userId);
            entity.setUsername(CommonBusiness.getInstance().getUserBean(userId).getDisplayName());
        }
        // 再进行数据存储
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            entity.setId(UUID.randomUUID().toString());
            entity.setDoneflag(0);
            id = entity.getId();
            device_inService.insert(entity);
        } else {
            device_inService.update(entity);
        }
        // 
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "办理成功");
        return "redirect:/device_in/device_in-list.do?flowType=0&flowId=" + flowId;
    }
    /**
     * 回退功能
     */
    @RequestMapping("device_in-rollback")
    public String rollback(@RequestParam("executionId") String executiond, @RequestParam("flowId") String flowId) {
        BpmComBusiness bpmComBusiness = new BpmComBusiness();
        Task task = bpmComBusiness.getTaskIdByExecutionId(executiond);
        
        new BpmComBusiness().rollback(task.getId());
        return "redirect:/device_in/device_in-list.do?flowType=0&flowId=" + flowId;
    }
    /**
     * 草稿
     * 
     * @return
     * @throws Exception
     */
    @RequestMapping("device_in-save-draft")
    public String saveDraft(@ModelAttribute Device_inEntity entity, @RequestParam(value = "flowId", required = false) String flowId, RedirectAttributes redirectAttributes) throws Exception {
        // 再进行数据复制
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            entity.setId(UUID.randomUUID().toString());
            entity.setDoneflag(0);
            device_inService.insert(entity);
            id = entity.getId();
        } else {
            device_inService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/device_in/device_in-input.do?flowId=" + flowId + "&id=" + id;
    }
    /**
     * 删除一条流程信息
     * @param selectedItem
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("device_in-remove")
    public String remove(@RequestParam("selectedItem") List<String> selectedItem, @RequestParam(value = "flowId", required = false) String flowId, RedirectAttributes redirectAttributes) {
        List<Device_inEntity> entitys = device_inService.findByIds(selectedItem);
        // 实例化BPM流程共用类对象
        BpmComBusiness bpmComBusiness = new BpmComBusiness();
        for (Device_inEntity entity : entitys) {
            device_inService.remove(entity);
            // 删除流程实例
            bpmComBusiness.deleteProcessInstance(entity.getExecutionid());
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");

        return "redirect:/device_in/device_in-list.do?flowType=0&flowId=" + flowId;
    }
    
    /**
     * 子表保存
     */
    @RequestMapping("device_in_s-save")
    public String subSave(@ModelAttribute Device_in_sEntity entity, @RequestParam(value = "flowId", required = false) String flowId, @RequestParam(value = "parentid", required = false) String parentid, RedirectAttributes redirectAttributes) throws Exception {
        String id = entity.getId();
        if (CommonUtils.isNull(id)) {
            id = UUID.randomUUID().toString();
            entity.setId(id);
            entity.setParentid(parentid);
            device_in_sService.insert(entity);
        } else {
            device_in_sService.update(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");
        return "redirect:/device_in/device_in-input.do?flowId=" + flowId + "&id=" + entity.getParentid();
    }
    /**
     * 子表删除
     */
    @RequestMapping("device_in_s-remove")
    public String device_in_sRemove(@RequestParam("device_in_sSelectedItem") List<String> selectedItem, @RequestParam(value = "flowId", required = false) String flowId, RedirectAttributes redirectAttributes) throws Exception {
        List<Device_in_sEntity> entitys = device_in_sService.findByIds(selectedItem);
        for (Device_in_sEntity entity : entitys) {
            device_in_sService.remove(entity);
        }
        messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");
        return "redirect:/device_in/device_in-input.do?flowId=" + flowId + "&id=" + entitys.get(0).getParentid();
    }
    /**
     * 子表 excel导出
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("device_in_s-export")
    public void excelDevice_in_sExport(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, HttpServletResponse response) {
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        // 根据当前公司(用户范围)ID进行查询
    	propertyFilters = CommonBusiness.getInstance().editPFByScopeId(propertyFilters);
        page = device_in_sService.pagedQuery(page, propertyFilters);
        List<Device_in_sEntity> beans = (List<Device_in_sEntity>) page.getResult();

        TableModel tableModel = new TableModel();
        // excel文件名
        tableModel.setExcelName("设备入库表流程"+CommonUtils.getInstance().getCurrentDateTime());
        // 列名
        tableModel.addHeaders("devicename", "devicemodel", "deviceunit", "devicenum", "amount", "manufacturename", "remark", "id", "parentid");
        tableModel.setTableName("IB_DEVICE_IN");
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
    @RequestMapping("device_in_s-importExcel")
    public String importDevice_in_sExport(@RequestParam("attachment") MultipartFile attachment, @RequestParam(value = "flowId", required = false) String flowId, @RequestParam(value = "parentid", required = false) String parentid, HttpServletResponse response) {
        try {
            File file = new File("test.xls"); 
            attachment.transferTo(file);
            // 
            TableModel tableModel = new TableModel();
            // 列名
            tableModel.addHeaders("devicename", "devicemodel", "deviceunit", "devicenum", "amount", "manufacturename", "remark", "id", "parentid");
            // 导入
            new ExcelCommon().uploadExcel(file, tableModel, "com.codegenerate.devicemanage.entity.Device_in_sEntity");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/device_in/device_in-input.do?flowId=" + flowId + "&id=" + parentid;
    }

    /**
     * 流程定义图像
     * @param bpmProcessId
     * @param response
     * @throws Exception
     */
    @RequestMapping("device_in-graph")
    public void graphProcessDefinition(@RequestParam("id") String id, HttpServletResponse response) throws Exception {
        Device_inEntity entity = device_inService.get(id);
        BpmComBusiness bpmComBusiness = new BpmComBusiness();
        if (CommonUtils.isNull(entity.getExecutionid())) {
            return;
        }
        Task task = bpmComBusiness.getTaskIdByExecutionId(entity.getExecutionid());
        Command<InputStream> cmd = new ProcessInstanceDiagramCmd(task.getProcessInstanceId());
        // 
        InputStream is = bpmComBusiness.getProcessEngine().getManagementService().executeCommand(cmd);
        response.setContentType("image/png");

        IOUtils.copy(is, response.getOutputStream());
    }
    
    // ======================================================================
    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }
    @Resource
    public void setDevice_inService(Device_inService device_inService) {
        this.device_inService = device_inService;
    }
        @Resource
	    public void setDevice_in_sService(Device_in_sService device_in_sService) {
	        this.device_in_sService = device_in_sService;
	    }
}
