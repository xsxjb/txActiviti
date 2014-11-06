package com.map.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibusiness.core.spring.ApplicationContextHelper;
import com.map.entity.MapIconType;

/**
 * Map共用类
 * 
 * @author JiangBo
 *
 */
public class MapComBusiness {
    private MapComBusiness () {}
    private static MapComBusiness instance = new MapComBusiness();
    public static MapComBusiness getInstance() {
        return instance;
    }
    
    // 图标名称Map
    private List<MapIconType> mapIconTypeList = new ArrayList<MapIconType>();
    private Map<String, MapIconType> mapIconTypeMap = new HashMap<String, MapIconType>();
    /**
     * 取得图标信息List
     * @return
     */
    public List<MapIconType> queryMapIconTypeList() {
        mapIconTypeList = getMapIconTypeService().getAll();
        return mapIconTypeList;
    }
    /**
     * 取得图标信息Map
     * @return
     */
    public Map<String, MapIconType> queryMapIconTypeMap() {
        if (mapIconTypeMap.size() < 1) {
            for (MapIconType mapIconType : queryMapIconTypeList()) {
                mapIconTypeMap.put(mapIconType.getId(), mapIconType);
            }
        }
        return mapIconTypeMap;
    }
    // ===========================================================================
    public MapIconTypeService getMapIconTypeService() {
        return ApplicationContextHelper.getBean(MapIconTypeService.class);
    }
}
