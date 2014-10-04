package com.ibusiness.bpm.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.activiti.engine.HistoryService;
import org.activiti.engine.IdentityService;
import org.activiti.engine.ProcessEngine;
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
