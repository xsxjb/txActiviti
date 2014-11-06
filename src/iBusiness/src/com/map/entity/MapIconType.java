package com.map.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * IB_MAP_ICON_TYPE-图标类型表
 * 
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_MAP_ICON_TYPE")
public class MapIconType {
    // 图标类型ID
    private String id;
    // 图标ID
    private String iconId;
    // 图标名称
    private String iconName;
    // 图标状态
    private String iconStatusId;
    // 图片状态名称
    private String iconStatusName;
    // 图片路径
    private String iconPath;
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
     * @return the iconStatusId
     */
    @Column(name = "ICONSTATUSID")
    public String getIconStatusId() {
        return iconStatusId;
    }
    /**
     * @param iconStatusId the iconStatusId to set
     */
    public void setIconStatusId(String iconStatusId) {
        this.iconStatusId = iconStatusId;
    }
    /**
     * @return the iconStatusName
     */
    @Column(name = "ICONSTATUSNAME")
    public String getIconStatusName() {
        return iconStatusName;
    }
    /**
     * @param iconStatusName the iconStatusName to set
     */
    public void setIconStatusName(String iconStatusName) {
        this.iconStatusName = iconStatusName;
    }
    /**
     * @return the iconPath
     */
    @Column(name = "ICONPATH")
    public String getIconPath() {
        return iconPath;
    }
    /**
     * @param iconPath the iconPath to set
     */
    public void setIconPath(String iconPath) {
        this.iconPath = iconPath;
    }
    /**
     * @return the iconName
     */
    @Column(name = "ICONNAME")
    public String getIconName() {
        return iconName;
    }
    /**
     * @param iconName the iconName to set
     */
    public void setIconName(String iconName) {
        this.iconName = iconName;
    }
}
