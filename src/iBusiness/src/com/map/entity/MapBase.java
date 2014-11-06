package com.map.entity;
/**
 * Map地图基础信息
 * 
 * @author JiangBo
 *
 */
public class MapBase {
    //地图-IP
    private String mapIp = "localhost";
    //地图-PORT端口
    private String mapPort = "8088";
    //地图-CITY城市
    private String mapCity = "pingliang";
    //地图-是否显示在线地图
    private String mapShowOnline = "false";
    //地图-初始级别
    private String mapGrid = "3";
    //地图-地图初始页面中心 经度
    private String mapCenterLongitude = "0";
    //地图-地图初始页面中心 纬度
    private String mapCenterLatitude = "0";
    /**
     * @return the mapIp
     */
    public String getMapIp() {
        return mapIp;
    }
    /**
     * @param mapIp the mapIp to set
     */
    public void setMapIp(String mapIp) {
        this.mapIp = mapIp;
    }
    /**
     * @return the mapPort
     */
    public String getMapPort() {
        return mapPort;
    }
    /**
     * @param mapPort the mapPort to set
     */
    public void setMapPort(String mapPort) {
        this.mapPort = mapPort;
    }
    /**
     * @return the mapCity
     */
    public String getMapCity() {
        return mapCity;
    }
    /**
     * @param mapCity the mapCity to set
     */
    public void setMapCity(String mapCity) {
        this.mapCity = mapCity;
    }
    /**
     * @return the mapShowOnline
     */
    public String getMapShowOnline() {
        return mapShowOnline;
    }
    /**
     * @param mapShowOnline the mapShowOnline to set
     */
    public void setMapShowOnline(String mapShowOnline) {
        this.mapShowOnline = mapShowOnline;
    }
    /**
     * @return the mapGrid
     */
    public String getMapGrid() {
        return mapGrid;
    }
    /**
     * @param mapGrid the mapGrid to set
     */
    public void setMapGrid(String mapGrid) {
        this.mapGrid = mapGrid;
    }
    /**
     * @return the mapCenterLongitude
     */
    public String getMapCenterLongitude() {
        return mapCenterLongitude;
    }
    /**
     * @param mapCenterLongitude the mapCenterLongitude to set
     */
    public void setMapCenterLongitude(String mapCenterLongitude) {
        this.mapCenterLongitude = mapCenterLongitude;
    }
    /**
     * @return the mapCenterLatitude
     */
    public String getMapCenterLatitude() {
        return mapCenterLatitude;
    }
    /**
     * @param mapCenterLatitude the mapCenterLatitude to set
     */
    public void setMapCenterLatitude(String mapCenterLatitude) {
        this.mapCenterLatitude = mapCenterLatitude;
    }
}
