package com.map.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ibusiness.common.util.CommonUtils;
import com.map.entity.MapBase;
import com.map.entity.MapIcon;
import com.map.entity.MapIconType;
import com.map.entity.MapSite;
import com.map.service.MapComBusiness;
import com.map.service.MapIconService;
import com.map.service.MapIconTypeService;
import com.map.service.MapSiteService;

/**
 * 地图基本信息 controller
 * 
 * @author JiangBo
 */
@Controller
@RequestMapping("map")
public class MapBaseController {
    // 图标名称Service
    private MapIconService mapIconService;
    // 图标类型Service
    private MapIconTypeService mapIconTypeService;
    // 节点Service
    private MapSiteService mapSiteService;
    /**
     * 初始化Map地图基础数据
     * @return
     */
    @RequestMapping("init-map-base")
    public String initMapBase(Model model) {
        MapBase mapBase = new MapBase();
        model.addAttribute("mapBase", mapBase);
        return "map/map.jsp";
    }
    /**
     * 获得地图的初始配置数据
     * 
     * @return ajax 返回json数据
     */
    @RequestMapping("queryMapConfig")
    @ResponseBody
    public String queryMapConfig(Model model) {
        Map<String, String> map = new HashMap<String, String>();
        //地图-IP
        map.put("MAP_IP", "localhost");
        //地图-PORT端口
        map.put("MAP_PORT", "9999");
        //地图-CITY城市
        map.put("MAP_CITY", "haerbin");
        //地图-是否显示在线地图
        map.put("MAP_SHOW_ONLINE", "false");
        //地图-初始级别
        map.put("MAP_GRID", "3");
        //地图-地图初始页面中心 经度
        map.put("MAP_CENTER_LONGITUDE", "0");
        //地图-地图初始页面中心 纬度
        map.put("MAP_CENTER_LATITUDE", "0");
        JSONObject jsonObj = new JSONObject();
        jsonObj.putAll(map);
        return jsonObj.toString();
    }
    /**
     * 得到公司/工厂/客户的默认图标(即在正常状态时的图标)
     * 
     * @return ajax 返回json数据
     */
    @RequestMapping("queryIconNormal")
    @ResponseBody
    public String queryIconNormal() {
        List<MapIcon> list = mapIconService.getAll();
        JSONArray jsonArray = CommonUtils.getJsonFromList(list, null);
        return jsonArray.toString();
    }
    /**
     * 根据图标编号得到其所有的图标
     * 
     * @return
     */
    @RequestMapping("queryMapIconType")
    @ResponseBody
    public String queryMapIconType(Model model) {
        List<MapIconType> list = mapIconTypeService.getAll();
        JSONArray jsonArray = CommonUtils.getJsonFromList(list, null);
        return jsonArray.toString();
    }
    /**
     * 根据图标编号得到其所有的图标
     * 
     * @return
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("findIconStatusByType")
    @ResponseBody
    public String findIconStatusByType(@RequestParam("iconId") String iconId,Model model) {
        String hql = "from MapIconType where iconId=?";
        List<MapIconType> list = mapIconTypeService.find(hql, iconId);
        JSONArray jsonArray = CommonUtils.getJsonFromList(list, null);
        return jsonArray.toString();
    }
    /**
     * 初始化站点,将所有有效的站点进行标注
     * @return
     */
    @RequestMapping("findValidSites")
    @ResponseBody
    public String findValidSites() {
        List<MapSite> list = mapSiteService.getAll();
        Map<String, MapIconType> mapIconTypes = MapComBusiness.getInstance().queryMapIconTypeMap();
        for (MapSite bean : list) {
            MapIconType mapIconType = mapIconTypes.get(bean.getIconTypeId());
            bean.setIconPath(mapIconType.getIconPath());
        }
        JSONArray json = CommonUtils.getJsonFromList(list, null);
        return json.toString();
    }
    /**
     * 显示站点信息
     * @return
     */
    @SuppressWarnings("unchecked")
    @RequestMapping("findSiteInfoToDel")
    @ResponseBody
    public String findSiteInfoToDel(@RequestParam("siteNo") String siteNo, @RequestParam("iconId") String iconId) {
        String sql ="from MapSite where siteNo=? AND iconId=?";
        List<MapSite> list = mapSiteService.find(sql, siteNo, iconId);
        if (null != list && list.size() > 0) {
            MapSite mapSite = list.get(0);
            JSONObject json= CommonUtils.getJsonFromBean(mapSite, null);
            return json.toString();
        }
        return "0";
    }
    /**
     * 显示站点信息
     * @return
     */
    @RequestMapping("findPointInfoToDel")
    @ResponseBody
    public String findPointInfoToDel(@RequestParam("id") String id) {
        return "";
    }
    /**
     * 搜索站点
     * @return
     */
    @RequestMapping("findSites")
    @ResponseBody
    public String findSites(@RequestParam("iconId") String iconId, @RequestParam("siteName") String siteName) {
        String sql ="from MapSite where iconId=? AND siteName like ?";
        List<MapSite> list = mapSiteService.find(sql, iconId, '%' + siteName + '%');
        JSONArray json= CommonUtils.getJsonFromList(list, null);
        return json.toString();
    }
    /**
     * 保存节点信息
     * @return
     */
    @RequestMapping("saveSite")
    @ResponseBody
    public String saveSite(MapSite mapSite) {
        try {
            mapSite.setId(UUID.randomUUID().toString());
            mapSite.setSiteNo(mapSite.getSiteNo());
            mapSite.setSiteNo(mapSite.getSiteName());
            // 纬度
            mapSite.setLatitude(mapSite.getLatitude());
            // 经度
            mapSite.setLongitude(mapSite.getLongitude());
            // 图标编号
            mapSite.setIconId(mapSite.getIconTypeId());
            // 图标类型
            mapSite.setIconTypeId("0001");
            // 是否显示
            mapSite.setIsDisplay(0);
            // 是否投用
            mapSite.setIsUsed(0);
            // 管道ID
            mapSite.setLineId(mapSite.getLineId());
            // 备注
            mapSite.setRemark("");
            mapSiteService.saveInsert(mapSite);
            // 成功
            return mapSite.getId();
        } catch (Exception e) {
            // 失败
            return "0";
        }
    }
    /**
     * 保存结点
     * @param iconId
     * @param model
     * @return
     */
    @RequestMapping("savePoint")
    @ResponseBody
    public String savePoint(@RequestParam("siteId") String siteId, @RequestParam("siteName") String siteName,
            @RequestParam("pointLongitude") String pointLongitude, @RequestParam("pointLatitude") String pointLatitude, Model model) {
        try {
            MapSite mapSite = new MapSite();
            mapSite.setId(UUID.randomUUID().toString());
            mapSite.setSiteNo(siteId);
            mapSite.setSiteNo(siteName);
            // 纬度
            mapSite.setLatitude(pointLatitude);
            // 经度
            mapSite.setLongitude(pointLongitude);
            // 图标编号
            mapSite.setIconId("P");
            // 图标类型
            mapSite.setIconTypeId("0003");
            // 是否显示
            mapSite.setIsDisplay(0);
            // 是否投用
            mapSite.setIsUsed(0);
            // 管道ID
            mapSite.setLineId("");
            // 备注
            mapSite.setRemark("");
            mapSiteService.saveInsert(mapSite);
            // 成功
            return mapSite.getId();
        } catch (Exception e) {
            // 失败
            return "0";
        }
    }
    /**
     * 删除节点
     * @return
     */
    @RequestMapping("deleteSite")
    @ResponseBody
    public String deleteSite(@RequestParam("siteId") String siteId) {
        MapSite bean = mapSiteService.get(siteId);
        mapSiteService.remove(bean);
        return "1";
    }
    // ======================================================================
    @Resource
    public void setMapIconService(MapIconService mapIconService) {
        this.mapIconService = mapIconService;
    }
    @Resource
    public void setMapIconTypeService(MapIconTypeService mapIconTypeService) {
        this.mapIconTypeService = mapIconTypeService;
    }
    @Resource
    public void setMapSiteService(MapSiteService mapSiteService) {
        this.mapSiteService = mapSiteService;
    }
}
