package com.map.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;


/**
 * 地图标注表  IB_MAP_SITE
 * @author JiangBo
 */
@Entity
@Table(name = "IB_MAP_SITE")
public class MapSite {
    // 标注Id
    private String id;
    // 标注编号
    private String siteNo;
    // 标注名称
    private String siteName;
    // 纬度
    private String latitude;
    // 经度
    private String longitude;
    // 图标编号
    private String iconId;
    // 图标类型
    private String iconTypeId;
    // 图标url
    private String iconPath;
    // 是否显示
    private Integer isDisplay;
    // 是否投用
    private Integer isUsed;
    // 管道ID
    private String lineId;
    // 备注
    private String remark;
    /**
     * @return the id
     */
    @Id
    @Column(name = "ID", nullable = false)
    public String getId() {
        return id;
    }
    /**
     * @param id the id to set
     */
    public void setId(String id) {
        this.id = id;
    }
    /**
     * @return the siteNo
     */
    @Column(name = "SITENO")
    public String getSiteNo() {
        return siteNo;
    }
    /**
     * @param siteNo the siteNo to set
     */
    public void setSiteNo(String siteNo) {
        this.siteNo = siteNo;
    }
    /**
     * @return the siteName
     */
    @Column(name = "SITENAME")
    public String getSiteName() {
        return siteName;
    }
    /**
     * @param siteName the siteName to set
     */
    public void setSiteName(String siteName) {
        this.siteName = siteName;
    }
    /**
     * @return the latitude
     */
    @Column(name = "LATITUDE")
    public String getLatitude() {
        return latitude;
    }
    /**
     * @param latitude the latitude to set
     */
    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }
    /**
     * @return the longitude
     */
    @Column(name = "LONGITUDE")
    public String getLongitude() {
        return longitude;
    }
    /**
     * @param longitude the longitude to set
     */
    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }
    /**
     * @return the iconId
     */
    @Column(name = "ICONID")
    public String getIconId() {
        return iconId;
    }
    /**
     * @param iconId the iconId to set
     */
    public void setIconId(String iconId) {
        this.iconId = iconId;
    }
    /**
     * @return the iconTypeId
     */
    @Column(name = "ICONTYPEID")
    public String getIconTypeId() {
        return iconTypeId;
    }
    /**
     * @param iconTypeId the iconTypeId to set
     */
    public void setIconTypeId(String iconTypeId) {
        this.iconTypeId = iconTypeId;
    }
    /**
     * @return the isDisplay
     */
    @Column(name = "ISDISPLAY")
    public Integer getIsDisplay() {
        return isDisplay;
    }
    /**
     * @param isDisplay the isDisplay to set
     */
    public void setIsDisplay(Integer isDisplay) {
        this.isDisplay = isDisplay;
    }
    /**
     * @return the isUsed
     */
    @Column(name = "ISUSED")
    public Integer getIsUsed() {
        return isUsed;
    }
    /**
     * @param isUsed the isUsed to set
     */
    public void setIsUsed(Integer isUsed) {
        this.isUsed = isUsed;
    }
    /**
     * @return the lineId
     */
    @Column(name = "LINEID")
    public String getLineId() {
        return lineId;
    }
    /**
     * @param lineId the lineId to set
     */
    public void setLineId(String lineId) {
        this.lineId = lineId;
    }
    /**
     * @return the remark
     */
    @Column(name = "REMARK")
    public String getRemark() {
        return remark;
    }
    /**
     * @param remark the remark to set
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }
    /**
     * @return the iconPath
     */
    @Transient
    public String getIconPath() {
        return iconPath;
    }
    /**
     * @param iconPath the iconPath to set
     */
    public void setIconPath(String iconPath) {
        this.iconPath = iconPath;
    }
}
