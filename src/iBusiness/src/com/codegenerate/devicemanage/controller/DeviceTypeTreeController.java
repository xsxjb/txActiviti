package com.codegenerate.devicemanage.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.codegenerate.devicemanage.entity.Device_typeEntity;
import com.codegenerate.devicemanage.service.Device_typeService;
import com.ibusiness.common.util.CommonUtils;

/**   
 * 原料分类树页面
 * @author JiangBo
 *
 */
@Controller
@RequestMapping("deviceTypeTree")
public class DeviceTypeTreeController {

    private Device_typeService device_typeService;
    
    /**
     * 树列表
     */
    @RequestMapping("tree-list")
    public String list(Model model) {
        // 返回JSP
        return "codegenerate/devicemanage/device-type-tree.jsp";
    }
   /**
     * 显示树
     */
    @SuppressWarnings("unchecked")
    @ResponseBody
    @RequestMapping("show-tree")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Map<String, Object>> showTree(@RequestParam(value = "id", required = false) String nodeId, Model model) {
        // 0为根节点
        if (CommonUtils.isNull(nodeId)) {
            nodeId = "0";
        }
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        List<Device_typeEntity> device_typeEntityList = device_typeService.find("from Device_typeEntity where parentid=?", nodeId);
        for (Device_typeEntity entity : device_typeEntityList) {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("id", entity.getId());
            map.put("pId", entity.getParentid());
            map.put("name", entity.getTypename());
            map.put("isParent", entity.getIsleaf());
            map.put("open", "true");  // 展开
            list.add(map);
        }
        return list;
    }
    /**
     * 删除树
     * @param model
     * @return
     */
    @SuppressWarnings("unchecked")
    @ResponseBody
    @RequestMapping("remove-tree")
    public String removeTree(@RequestParam(value = "id", required = false) String nodeId, Model model) {
        // 1.删除表中数据
        List<Device_typeEntity> list = device_typeService.find("from Device_typeEntity where id=?", nodeId);
        loopDeleteNodes(list);
        return "success";
    }
    /**
     * 保存树
     * @param model
     * @return
     */
    @ResponseBody
    @RequestMapping("save-tree")
    public String saveTree(@RequestParam(value = "nodes", required = false) String nodes, Model model) {
        try {
            nodes = URLDecoder.decode(nodes, "utf-8");
            JSONArray jsonArray = JSONArray.fromObject(nodes);
            // 2.根据前台传递数据插入数据
            loopInsertNodes(jsonArray);
            return "success";
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return null;
    }
    /**
     * 向数据库中插入数据
     * @param jsonObject
     */
    private void insertNode(JSONObject jsonObject) {
        Device_typeEntity device_typeEntity = device_typeService.get(jsonObject.getString("id"));
        if (null == device_typeEntity) {
            device_typeEntity = new Device_typeEntity();
            device_typeEntity.setId(jsonObject.getString("id"));
            device_typeEntity.setParentid(CommonUtils.isNull(jsonObject.getString("pId"))? "0" : jsonObject.getString("pId"));
            device_typeEntity.setTypename(jsonObject.getString("name"));
            device_typeEntity.setIsleaf(jsonObject.getString("isParent"));
            device_typeService.saveInsert(device_typeEntity);
        } else {
            device_typeEntity.setTypename(jsonObject.getString("name"));
            device_typeService.update(device_typeEntity);
        }
    }
    /**
     * 循环插入节点
     * @param entities
     * @param partyStructTypeId
     * @return
     */
    private void loopInsertNodes(JSONArray jsonArray) {
        if (jsonArray == null) {
            return;
        }
        for (int i = 0; i < jsonArray.size(); i++) {
            JSONObject jsonObject= (JSONObject) jsonArray.get(i);
            // 向数据库中插入数据   
            insertNode(jsonObject);
            if (jsonObject.containsKey("children")) {
                JSONArray childrens = jsonObject.getJSONArray("children");
                loopInsertNodes(childrens);
            }
        }
    }
    /**
     * 循环删除节点
     * @param entities
     * @param partyStructTypeId
     * @return
     */
    @SuppressWarnings("unchecked")
    private void loopDeleteNodes(List<Device_typeEntity> list) {
        if (list == null) {
            return;
        }
        for (Device_typeEntity bean : list) {
            List<Device_typeEntity> subList= device_typeService.find("from Device_typeEntity where parentid=?", bean.getId());
            loopDeleteNodes(subList);
        }
        // 
        device_typeService.removeAll(list);
    }
    
    // ======================================================================
    @Resource
    public void setDevice_typeService(Device_typeService device_typeService) {
        this.device_typeService = device_typeService;
    }
    
}
