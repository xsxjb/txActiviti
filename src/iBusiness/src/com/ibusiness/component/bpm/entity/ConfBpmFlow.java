package com.ibusiness.component.bpm.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * IB_CONF_FORM BPM流程管理表
 * 
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_CONF_BPM_FLOW")
public class ConfBpmFlow {
    // UUID
    private String id;
    // 模块包名
    private String packageName;
    // 流程名称
    private String flowName;
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
     * @return the packageName
     */
    @Column(name = "PACKAGENAME")
    public String getPackageName() {
        return packageName;
    }
    /**
     * @param packageName the packageName to set
     */
    public void setPackageName(String packageName) {
        this.packageName = packageName;
    }
    /**
     * @return the flowName
     */
    @Column(name = "FLOWNAME")
    public String getFlowName() {
        return flowName;
    }
    /**
     * @param flowName the flowName to set
     */
    public void setFlowName(String flowName) {
        this.flowName = flowName;
    }
}
