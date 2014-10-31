package com.ibusiness.flowchart.controller;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibusiness.bpm.dao.BpmProcessDao;
import com.ibusiness.bpm.entity.BpmProcess;
import com.ibusiness.common.util.CommonUtils;
import com.ibusiness.flowchart.entity.ConfFlowChart;
import com.ibusiness.flowchart.service.FlowChartService;

/**
 * 流程表单相关配置
 * 
 * @author JiangBo
 * 
 */
@Controller
@RequestMapping("flowchart")
public class FlowChartController {

    private FlowChartService flowChartService;
    private BpmProcessDao bpmProcessDao;
    
    /**
     * 查询
     * @param flowId
     * @return
     */
    @RequestMapping("init-flow-chart")
    public String initFlowChart(@RequestParam(value = "packageName", required = false) String packageName, @RequestParam(value = "bpmId", required = false) String bpmId, Model model) {
        //
        model.addAttribute("packageName", packageName);
        model.addAttribute("bpmId", bpmId);
        model.addAttribute("tabType", "flowChart");
        return "ibusiness/bpm/bpm-process-input.jsp";
    }
    
    /**
     * 查询
     * @param flowId
     * @return
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("query-flow-chart")
    @ResponseBody
    public String queryFlowChart(@RequestParam(value = "flowId") String flowId) {
        String hql = "from ConfFlowChart where flowId=? ";
        List<ConfFlowChart> list = flowChartService.find(hql, flowId);
        // 查询PLC图像数据
        return CommonUtils.getJsonFromList(list, null).toString();
    }
    /**
     * 取得流程名list
     * @return
     */
    @RequestMapping("flow-list")
    @ResponseBody
    public String getFlowList(@RequestParam(value = "flowId") String flowId, Model model) {
        List<BpmProcess> bpmProcessList= bpmProcessDao.getAll();
        if(bpmProcessList != null && bpmProcessList.size() > 0){
            // 
            StringBuffer sb = new StringBuffer();
            String selected;
            //遍历数据，构建select列表
            for(BpmProcess bean : bpmProcessList){
                selected = bean.getId().equals(flowId) ? "selected" : "";
                sb.append("<option value='"+bean.getId()+"' "+selected+">"+bean.getFlowTitle()+"</option>");
            }
            model.addAttribute("bpmFlowList", bpmProcessList);
            return sb.toString();
        }
        return "<option value=''>请选择...</option>";
    }

    /**
     * 保存
     * @return
     */
    @RequestMapping("save-flow-chart")
    public String saveFlowChart(@RequestParam(value = "contexts") String contexts, @RequestParam(value = "flowId") String flowId) {
        // 保存在线画图信息流程图数据
        saveConfFlowChart(contexts, flowId);
        // 
        // 保存修改流程相关BPMN.XML信息 TODO
//        saveBpmnXmlInfo();
        
        return "/ibusiness/flowchart/draw.jsp";
    }

    /**
     * 保存在线画图信息流程图数据
     * @param contexts
     * @param flowId
     */
    @SuppressWarnings("unchecked")
    private void saveConfFlowChart(String contexts, String flowId) {
        // 设置插入对象
        JSONArray jsonArray = JSONArray.fromObject(contexts);
        ConfFlowChart bean = null;
        // 第一步 先删除
        String hql = "from ConfFlowChart where flowId=?";
        List<ConfFlowChart> list = flowChartService.find(hql, flowId);
        flowChartService.removeAll(list);
        // 第二步 插入
        // 解析前台传递的JSONString
        for (int i = 0; i < jsonArray.size(); i++) {
            JSONObject jo = (JSONObject) jsonArray.get(i);
            if (!jo.containsKey("id")) {
                continue;
            }
            bean = new ConfFlowChart();
            bean.setId(UUID.randomUUID().toString());
            bean.setFlowId(flowId);
            bean.setItemId(jo.getString("id"));
            bean.setContext(jo.toString());
            // 插入
            flowChartService.saveInsert(bean);
        }
    }
    /**
     * 删除
     * @return
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("delete-flow-chart")
    public String deleteFlowChart(@RequestParam(value = "flowId") String flowId) {
        String hql = "from ConfFlowChart where flowId=?";
        List<ConfFlowChart> list = flowChartService.find(hql, flowId);
        if (null != list && list.size() > 0) {
            flowChartService.removeAll(list);
        }
        return "redirect:/flowchart/query-flow-chart.do?flowId="+flowId;
    }
    /**
     * 显示启动流程的表单.
     */
    @RequestMapping("form-viewStartForm")
    public String viewStartForm(@RequestParam("bpmProcessId")
    String bpmProcessId, @RequestParam(value = "businessKey", required = false)
    String businessKey, Model model) throws Exception {
        model.addAttribute("bpmProcessId", bpmProcessId);
        model.addAttribute("businessKey", businessKey);
            // 如果没找到form，就判断是否配置负责人 TODO
//            return taskConf(new LinkedMultiValueMap(), bpmProcessId, businessKey, nextStep, model);
        return "redirect:/flowchart/testForm-list.do";
    }

    // ======================================================================
    @Resource
    public void setFlowChartService(FlowChartService flowChartService) {
        this.flowChartService = flowChartService;
    }
    @Resource
    public void setBpmProcessDao(BpmProcessDao bpmProcessDao) {
        this.bpmProcessDao = bpmProcessDao;
    }
}
