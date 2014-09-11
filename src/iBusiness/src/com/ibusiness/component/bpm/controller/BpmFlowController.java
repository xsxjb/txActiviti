package com.ibusiness.component.bpm.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ibusiness.common.page.Page;
import com.ibusiness.common.page.PropertyFilter;
import com.ibusiness.component.bpm.dao.ConfBpmFlowDao;
import com.ibusiness.core.spring.MessageHelper;

/**
 * 流程管理控制器
 * 
 * @author JiangBo
 *
 */
@Controller
@RequestMapping("bpmflow")
public class BpmFlowController {

    private ConfBpmFlowDao confBpmFlowDao;
    private MessageHelper messageHelper;
    
    /**
     * 菜单列表
     * 
     * @param page
     * @param parameterMap
     * @param model
     * @return
     */
    @RequestMapping("bpm-flow-list")
    public String bpmFlowList(@ModelAttribute Page page, @RequestParam("packageName") String packageName, @RequestParam Map<String, Object> parameterMap, Model model) {
        // 取得表结构信息。
        List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
        propertyFilters.add(new PropertyFilter("EQS_packageName", packageName));
        page = confBpmFlowDao.pagedQuery(page, propertyFilters);
        model.addAttribute("page", page);
        model.addAttribute("packageName", packageName);
        
        return "component/bpm/bpm-flow-list.jsp";
    }
    
    
    // ======================================================================
    @Resource
    public void setConfBpmFlowDao(ConfBpmFlowDao confBpmFlowDao) {
        this.confBpmFlowDao = confBpmFlowDao;
    }
    @Resource
    public void setMessageHelper(MessageHelper messageHelper) {
        this.messageHelper = messageHelper;
    }
}
