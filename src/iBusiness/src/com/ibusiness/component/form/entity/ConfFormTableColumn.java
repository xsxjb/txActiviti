package com.ibusiness.component.form.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * IB_CONF_FORM_TABLE_COLUMS 表单对应字段管理表
 * 
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_CONF_FORM_TABLE_COLUMS")
public class ConfFormTableColumn implements java.io.Serializable {
    /**
     * serialVersionUID
     */
    private static final long serialVersionUID = 1L;
    // 表单名称
    private String formName;
    // 表单字段名
    private String formColumn;
    // 表单名标题
    private String formColumnTitle;
    // 表名
    private String tableName;
    // 表字段名
    private String tableColumn;
    // 模块包名
    private String packageName;

    /**
     * @return the packageName
     */
    @Id
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
     * @return the formName
     */
    @Id
    @Column(name = "FORMNAME", nullable = false)
    public String getFormName() {
        return formName;
    }
    /**
     * @param formName the formName to set
     */
    public void setFormName(String formName) {
        this.formName = formName;
    }
    /**
     * @return the formColumn
     */
    @Id
    @Column(name = "FORMCOLUMN")
    public String getFormColumn() {
        return formColumn;
    }
    /**
     * @param formColumn the formColumn to set
     */
    public void setFormColumn(String formColumn) {
        this.formColumn = formColumn;
    }
    /**
     * @return the id
     */
    @Column(name = "TABLENAME")
    public String getTableName() {
        return tableName;
    }
    /**
     * @param id the id to set
     */
    public void setTableName(String tableName) {
        this.tableName = tableName;
    }
    /**
     * @return the formColumnTitle
     */
    @Column(name = "FORMCOLUMNTITLE")
    public String getFormColumnTitle() {
        return formColumnTitle;
    }
    /**
     * @param formColumnTitle the formColumnTitle to set
     */
    public void setFormColumnTitle(String formColumnTitle) {
        this.formColumnTitle = formColumnTitle;
    }
    /**
     * @return the tableColumn
     */
    @Column(name = "TABLECOLUMN")
    public String getTableColumn() {
        return tableColumn;
    }
    /**
     * @param tableColumn the tableColumn to set
     */
    public void setTableColumn(String tableColumn) {
        this.tableColumn = tableColumn;
    }
}
