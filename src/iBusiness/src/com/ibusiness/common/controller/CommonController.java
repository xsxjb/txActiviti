package com.ibusiness.common.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 管理controller
 * 
 * @author JiangBo
 * 
 */
@Controller
@RequestMapping("common")
public class CommonController {

	private SimpleDateFormat ymdhms = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
    /**
     * 内存使用情况查询
     * 
     * @return
     */
    @RequestMapping("quary-memory")
    public String quaryMemory(Model model) {
    	// 可使用内存 
        long totalMemory = Runtime.getRuntime().totalMemory()/1000/1000; // kb; 
        // 剩余内存 
        long freeMemory = Runtime.getRuntime().freeMemory()/1000/1000; // kb; 
        // 最大可使用内存 
        long maxMemory = Runtime.getRuntime().maxMemory()/1000/1000; // kb;
        
        model.addAttribute("totalMemory", totalMemory + "kb");
        model.addAttribute("freeMemory", freeMemory + "kb");
        model.addAttribute("maxMemory", maxMemory + "kb");

        return "common/memory/memory-info.jsp";
    }
    /**
     * 内存使用情况查询
     * 
     * @return
     */
    @ResponseBody
    @RequestMapping("show-memory-chart")
    public String showMemoryChart(Model model) {
    	// 可使用内存
        long totalMemory = Runtime.getRuntime().totalMemory()/1000/1000; // kb; 
        // 剩余内存
        long freeMemory = Runtime.getRuntime().freeMemory()/1000/1000; // kb; 
        // 最大可使用内存
        long maxMemory = Runtime.getRuntime().maxMemory()/1000/1000; // kb;
        
        JSONArray array = new JSONArray();
        JSONObject obj = new JSONObject();
        obj.put("eventTime", ymdhms.format(new Date()));
        obj.put("maxMemory", maxMemory);
        obj.put("totalMemory", totalMemory);
        obj.put("freeMemory", freeMemory);
        array.add(obj);
        
        return array.toString();
    }

    // ~ ======================================================================
    
}
