package com.ibusiness.panorama.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 全景图
 * 
 * @author JiangBo
 * 
 */
@Controller
@RequestMapping("panorama")
public class PanoramaController {

    
    /**
     * 流程图信息初始化
     * 
     * @param flowId
     * @return
     */
    @RequestMapping("panorama-init")
    public String initFlowChart(Model model) {
        
        return "ibusiness/panorama/panorama-show.jsp";
    }

    // ======================================================================
//    @Resource
//    public void setFlowChartService(FlowChartService flowChartService) {
//        this.flowChartService = flowChartService;
//    }
}
