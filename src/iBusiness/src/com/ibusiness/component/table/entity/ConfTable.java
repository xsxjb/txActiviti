package com.ibusiness.component.table.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 业务表管理Bean, 对应 ib_conf_table表
 * 
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_CONF_TABLE")
public class ConfTable {
	// UUID
    private String id;
    // 模块包名
    private String packageName;
    // 表名
    private String tableName;
    // 表名含义
    private String tableNameComment;
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
     * 取得tableName
     * @return the tableName
     */
    @Column(name = "TABLENAME")
    public String getTableName() {
        return tableName;
    }
    /**
     * 设置tableName
     * @param tableName the tableName to set
     */
    public void setTableName(String tableName) {
        this.tableName = tableName;
    }
    /**
     * 取得tableNameComment
     * @return the tableNameComment
     */
    @Column(name = "TABLENAMECOMMENT")
    public String getTableNameComment() {
        return tableNameComment;
    }
    /**
     * 设置tableNameComment
     * @param tableNameComment the tableNameComment to set
     */
    public void setTableNameComment(String tableNameComment) {
        this.tableNameComment = tableNameComment;
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
}
