package com.map.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Map地图基础信息
 * 
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_MAP_CONF")
public class MapConf {
    //地图-IP
    private String mapIp = "localhost";
    //地图-PORT端口
    private String mapPort = "8088";
    //地图-CITY城市
    private String mapCity = "haerbin";
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
    @Id
    @Column(name = "MAPIP", nullable = false)
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
    @Column(name = "MAPPORT")
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
    @Column(name = "MAPCITY")
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
    @Column(name = "MAPSHOWONLINE")
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
    @Column(name = "MAPGRID")
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
    @Column(name = "MAPCENTERLONGITUDE")
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
    @Column(name = "MAPCENTERLATITUDE")
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
