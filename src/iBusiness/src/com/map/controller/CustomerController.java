package com.map.controller;

import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibusiness.common.util.CommonUtils;
import com.map.entity.CustomerInfo;
import com.map.service.CustomerService;

/**
 * 客户controller
 * 
 * @author JiangBo
 */
@Controller
@RequestMapping("customer")
public class CustomerController {
    private CustomerService customerService;
    /**
     * 初始化客户信息数据
     * @return
     */
    @RequestMapping("queryCustomerInfo")
    @ResponseBody
    public String queryCustomerInfo(Model model) {
        List<CustomerInfo> list = customerService.getAll();
        JSONArray json = CommonUtils.getJsonFromList(list, null);
        return json.toString();
    }
    /**
     * 初始化客户信息数据
     * @return
     */
    @RequestMapping("queryCustomerById")
    @ResponseBody
    public String queryCustomerById(@RequestParam("id") String id, Model model) {
        CustomerInfo bean = customerService.get(id);
        JSONObject json = CommonUtils.getJsonFromBean(bean, null);
        return json.toString();
    }
    // ======================================================================
    @Resource
    public void setCustomerService(CustomerService customerService) {
        this.customerService = customerService;
    }
}