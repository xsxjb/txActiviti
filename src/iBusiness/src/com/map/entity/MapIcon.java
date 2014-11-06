package com.map.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * IB_MAP_ICON-图标名称表
 * 
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_MAP_ICON")
public class MapIcon {
    // 图标ID
    private String id;
    // 图标名称
    private String iconName;
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
