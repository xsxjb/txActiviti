package com.ibusiness.bpm.service;

import java.io.ByteArrayInputStream;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.activiti.engine.HistoryService;
import org.activiti.engine.IdentityService;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ibusiness.bpm.dao.BpmProcessDao;
import com.ibusiness.bpm.dao.BpmProcessVersionDao;
import com.ibusiness.bpm.entity.BpmProcess;
import com.ibusiness.bpm.entity.BpmProcessVersion;
import com.ibusiness.core.spring.ApplicationContextHelper;
import com.ibusiness.security.util.SpringSecurityUtils;

/**
 * BPM流程共用类
 * 
 * @author JiangBo
 *
 */
public class BpmComBusiness {
    /**
     * 启动流程
     */
    public String flowStart(String flowId, String userId) {
        // 先设置登录用户
        IdentityService identityService = getProcessEngine().getIdentityService();
        identityService.setAuthenticatedUserId(SpringSecurityUtils.getCurrentUserId());
        // Get Activiti services
        RuntimeService runtimeService = getProcessEngine().getRuntimeService();
        // Start a process instance
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("assignee", userId);
        BpmProcessVersion bpmProcessVersion = getBpmProcessVersion(flowId);
        ProcessInstance processInstance = runtimeService.startProcessInstanceById(bpmProcessVersion.getBpmProsessId(), params);
        return processInstance.getId();
    }
    /**
     * 办理流程
     */
    public void completeTask(String taskId, String userId) {
        // Get Activiti services
        TaskService taskService = getProcessEngine().getTaskService();
        // complete a task
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("assignee", userId);
        taskService.complete(taskId, map);
    }
    /**
     * 判断task流程是否结束
     */
    public Boolean isFinishedByTask(String prosessId) {
        RuntimeService runtimeService = getProcessEngine().getRuntimeService();
        if (null == runtimeService.createProcessInstanceQuery().processInstanceId(prosessId).singleResult()) {
            return true;
        }
        return false;
    }
    /**
     * 待办任务（个人任务）---指定用户ID的
     * 
     * @return
     */
    public List<Task> listPersonalTasks(String userId) {
        TaskService taskService = getProcessEngine().getTaskService();
        List<Task> tasks = taskService.createTaskQuery().taskAssignee(userId).active().list();
        return tasks;
    }
    /**
     * 已办任务（历史任务）---指定用户ID的
     * 
     * @return
     */
    @RequestMapping("workspace-listHistoryTasks")
    public List<HistoricTaskInstance> listHistoryTasks(String userId) {
        HistoryService historyService = getProcessEngine().getHistoryService();
        List<HistoricTaskInstance> historicTasks = historyService.createHistoricTaskInstanceQuery().taskAssignee(userId).finished().list();
        return historicTasks;
    }
    // ~ ==================================国内特色流程====================================
    /**
     * 回退任务
     * 
     * @return
     */
    public void rollback(String taskId) {
        // TODO
//        Command<Integer> cmd = new RollbackTaskCmd(taskId);
//        getProcessEngine().getManagementService().executeCommand(cmd);
    }
    /**
     * 根据执行实例ID查询taskID
     * @param flowId
     * @return
     */
    public Task getTaskIdByExecutionId(String executionId) {
        // 取得TaskId
        TaskService taskservice = getProcessEngine().getTaskService();
        Task task = taskservice.createTaskQuery().executionId(executionId).singleResult();
        return task;
    }
    /**
     * 取得BPM流程版本管理信息
     * @param flowId
     * @return
     */
    private BpmProcessVersion getBpmProcessVersion(String flowId) {
        BpmProcess bpmProcess = getBpmProcessDao().get(flowId);
        if (null == bpmProcess) {
            return null;
        }
        BpmProcessVersion bpmProcessVersion = getBpmProcessVersionDao().get(bpmProcess.getVersionId());
        return bpmProcessVersion;
    }
    // ==============================================================
    /**
     * 发布流程  --- 根据XML信息和流程名
     * 
     * @param xml
     * @param xmlName
     */
    public void deployFlow(String xml, String xmlName) {
        ProcessEngine processEngine = getProcessEngine();
        // Get Activiti services
        RepositoryService repositoryService = processEngine.getRepositoryService();
        // Deploy the process definition 部署
        try {
            repositoryService.createDeployment()
                             .addInputStream(xmlName+".bpmn20.xml", new ByteArrayInputStream(xml.getBytes("UTF-8")))
                             .deploy();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }
    /**
     * 创建一个BPMN XML数据
     */
    public String createBpmnXML() {
        // TODO Auto-generated method stub
        String xml = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
        xml = xml + "<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/processdef\">";
        xml = xml + "  <process id=\"process\" name=\"getCar\" isExecutable=\"true\">";
        xml = xml + "    <startEvent id=\"sid-2C96A3F5-D9A1-47B8-82D2-FAF3E536D056\"></startEvent>";
        xml = xml + "    <userTask id=\"sid-EA7B879B-70BB-466A-9F63-BCBBF6B69F55\" name=\"请车申请\"></userTask>";
        xml = xml + "    <sequenceFlow id=\"sid-F1524339-A0AE-470F-B2E0-0C69FF5D4FB8\" sourceRef=\"sid-2C96A3F5-D9A1-47B8-82D2-FAF3E536D056\" targetRef=\"sid-EA7B879B-70BB-466A-9F63-BCBBF6B69F55\"></sequenceFlow>";
        xml = xml + "    <endEvent id=\"sid-C6064773-2F9C-4129-B5F7-7A23F4E380EF\"></endEvent>";
        xml = xml + "    <sequenceFlow id=\"sid-68B7650B-AB4E-41CD-B3CE-B9A05C37B6FE\" sourceRef=\"sid-EA7B879B-70BB-466A-9F63-BCBBF6B69F55\" targetRef=\"sid-C6064773-2F9C-4129-B5F7-7A23F4E380EF\"></sequenceFlow>";
        xml = xml + "    <userTask id=\"sid-C9DE79C8-A33F-4FF8-8FD7-055EE2615351\" name=\"请车审批\"></userTask>";
        xml = xml + "    <sequenceFlow id=\"sid-6E075568-C5BA-4133-9923-4ACA50461029\" sourceRef=\"sid-EA7B879B-70BB-466A-9F63-BCBBF6B69F55\" targetRef=\"sid-C9DE79C8-A33F-4FF8-8FD7-055EE2615351\"></sequenceFlow>";
        xml = xml + "    <endEvent id=\"sid-ABD05E45-C37E-4FB8-B573-2D31CE04255A\"></endEvent>";
        xml = xml + "    <sequenceFlow id=\"sid-46F759B7-4398-43C3-8FCE-337E6868356E\" sourceRef=\"sid-C9DE79C8-A33F-4FF8-8FD7-055EE2615351\" targetRef=\"sid-ABD05E45-C37E-4FB8-B573-2D31CE04255A\"></sequenceFlow>";
        xml = xml + "  </process>";
        xml = xml + "  <bpmndi:BPMNDiagram id=\"BPMNDiagram_process\">";
        xml = xml + "    <bpmndi:BPMNPlane bpmnElement=\"process\" id=\"BPMNPlane_process\">";
        xml = xml + "      <bpmndi:BPMNShape bpmnElement=\"sid-2C96A3F5-D9A1-47B8-82D2-FAF3E536D056\" id=\"BPMNShape_sid-2C96A3F5-D9A1-47B8-82D2-FAF3E536D056\">";
        xml = xml + "        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"203.0\" y=\"153.0\"></omgdc:Bounds>";
        xml = xml + "      </bpmndi:BPMNShape>";
        xml = xml + "      <bpmndi:BPMNShape bpmnElement=\"sid-EA7B879B-70BB-466A-9F63-BCBBF6B69F55\" id=\"BPMNShape_sid-EA7B879B-70BB-466A-9F63-BCBBF6B69F55\">";
        xml = xml + "        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"270.0\" y=\"120.0\"></omgdc:Bounds>";
        xml = xml + "      </bpmndi:BPMNShape>";
        xml = xml + "      <bpmndi:BPMNShape bpmnElement=\"sid-C6064773-2F9C-4129-B5F7-7A23F4E380EF\" id=\"BPMNShape_sid-C6064773-2F9C-4129-B5F7-7A23F4E380EF\">";
        xml = xml + "        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"423.0\" y=\"154.0\"></omgdc:Bounds>";
        xml = xml + "      </bpmndi:BPMNShape>";
        xml = xml + "      <bpmndi:BPMNShape bpmnElement=\"sid-C9DE79C8-A33F-4FF8-8FD7-055EE2615351\" id=\"BPMNShape_sid-C9DE79C8-A33F-4FF8-8FD7-055EE2615351\">";
        xml = xml + "        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"423.0\" y=\"128.0\"></omgdc:Bounds>";
        xml = xml + "      </bpmndi:BPMNShape>";
        xml = xml + "      <bpmndi:BPMNShape bpmnElement=\"sid-ABD05E45-C37E-4FB8-B573-2D31CE04255A\" id=\"BPMNShape_sid-ABD05E45-C37E-4FB8-B573-2D31CE04255A\">";
        xml = xml + "       <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"568.0\" y=\"154.0\"></omgdc:Bounds>";
        xml = xml + "      </bpmndi:BPMNShape>";
        xml = xml + "      <bpmndi:BPMNEdge bpmnElement=\"sid-46F759B7-4398-43C3-8FCE-337E6868356E\" id=\"BPMNEdge_sid-46F759B7-4398-43C3-8FCE-337E6868356E\">";
        xml = xml + "        <omgdi:waypoint x=\"523.0\" y=\"168.0\"></omgdi:waypoint>";
        xml = xml + "        <omgdi:waypoint x=\"568.0\" y=\"168.0\"></omgdi:waypoint>";
        xml = xml + "      </bpmndi:BPMNEdge>";
        xml = xml + "      <bpmndi:BPMNEdge bpmnElement=\"sid-68B7650B-AB4E-41CD-B3CE-B9A05C37B6FE\" id=\"BPMNEdge_sid-68B7650B-AB4E-41CD-B3CE-B9A05C37B6FE\">";
        xml = xml + "        <omgdi:waypoint x=\"370.0\" y=\"160.0\"></omgdi:waypoint>";
        xml = xml + "        <omgdi:waypoint x=\"396.5\" y=\"160.0\"></omgdi:waypoint>";
        xml = xml + "        <omgdi:waypoint x=\"396.5\" y=\"168.0\"></omgdi:waypoint>";
        xml = xml + "        <omgdi:waypoint x=\"423.0\" y=\"168.0\"></omgdi:waypoint>";
        xml = xml + "      </bpmndi:BPMNEdge>";
      xml = xml + "      <bpmndi:BPMNEdge bpmnElement=\"sid-F1524339-A0AE-470F-B2E0-0C69FF5D4FB8\" id=\"BPMNEdge_sid-F1524339-A0AE-470F-B2E0-0C69FF5D4FB8\">";
      xml = xml + "        <omgdi:waypoint x=\"232.95407566718828\" y=\"166.82713132022053\"></omgdi:waypoint>";
      xml = xml + "        <omgdi:waypoint x=\"270.0\" y=\"163.921568627451\"></omgdi:waypoint>";
      xml = xml + "      </bpmndi:BPMNEdge>";
      xml = xml + "      <bpmndi:BPMNEdge bpmnElement=\"sid-6E075568-C5BA-4133-9923-4ACA50461029\" id=\"BPMNEdge_sid-6E075568-C5BA-4133-9923-4ACA50461029\">";
      xml = xml + "        <omgdi:waypoint x=\"370.0\" y=\"160.0\"></omgdi:waypoint>";
      xml = xml + "        <omgdi:waypoint x=\"396.5\" y=\"160.0\"></omgdi:waypoint>";
      xml = xml + "        <omgdi:waypoint x=\"396.5\" y=\"168.0\"></omgdi:waypoint>";
      xml = xml + "        <omgdi:waypoint x=\"423.0\" y=\"168.0\"></omgdi:waypoint>";
      xml = xml + "      </bpmndi:BPMNEdge>";
      xml = xml + "    </bpmndi:BPMNPlane>";
      xml = xml + "  </bpmndi:BPMNDiagram>";
      xml = xml + "</definitions>";
        return xml;
    }
    // ==============================================================
    /**
     * 取得流程管理表DAO对象
     * @return
     */
    public BpmProcessDao getBpmProcessDao() {
        return ApplicationContextHelper.getBean(BpmProcessDao.class);
    }
    public BpmProcessVersionDao getBpmProcessVersionDao() {
        return ApplicationContextHelper.getBean(BpmProcessVersionDao.class);
    }
    public ProcessEngine getProcessEngine() {
        return ApplicationContextHelper.getBean(ProcessEngine.class);
    }
    public IdentityService getIdentityService() {
        return ApplicationContextHelper.getBean(IdentityService.class);
    }
    public RuntimeService getRuntimeService() {
        return ApplicationContextHelper.getBean(RuntimeService.class);
    }
}
