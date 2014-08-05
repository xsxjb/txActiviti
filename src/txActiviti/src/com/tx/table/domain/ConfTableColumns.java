package com.tx.table.domain;

/**
 * 业务表字段结构管理Bean, 对应 tx_conf_table_columns表
 * 
 * @author JiangBo
 *
 */
public class ConfTableColumns {
    // 表名
    private String tableName;
    // 表名含义
    private String tableNameComment;
    // 字段编号
    private int columnNo;
    // 字段名
    private String columnValue;
    // 字段名(修改前的值)
    private String columnValueOld;
    // 字段含义
    private String columnName;
    // 类型
    private String typeKey;
    // 类型值
    private String typeValue;
    // 类型值
    private String typeValueOld;
    // 插入flag
    private int insertFlag;
    /**
     * 取得tableName
     * @return the tableName
     */
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
     * 取得columnNo
     * @return the columnNo
     */
    public int getColumnNo() {
        return columnNo;
    }
    /**
     * 设置columnNo
     * @param columnNo the columnNo to set
     */
    public void setColumnNo(int columnNo) {
        this.columnNo = columnNo;
    }
    /**
     * 取得columnValue
     * @return the columnValue
     */
    public String getColumnValue() {
        return columnValue;
    }
    /**
     * 设置columnValue
     * @param columnValue the columnValue to set
     */
    public void setColumnValue(String columnValue) {
        this.columnValue = columnValue;
    }
    /**
     * 取得typeKey
     * @return the typeKey
     */
    public String getTypeKey() {
        return typeKey;
    }
    /**
     * 设置typeKey
     * @param typeKey the typeKey to set
     */
    public void setTypeKey(String typeKey) {
        this.typeKey = typeKey;
    }
    /**
     * 取得typeValue
     * @return the typeValue
     */
    public String getTypeValue() {
        return typeValue;
    }
    /**
     * 设置typeValue
     * @param typeValue the typeValue to set
     */
    public void setTypeValue(String typeValue) {
        this.typeValue = typeValue;
    }
    /**
     * 取得insertFlag
     * @return the insertFlag
     */
    public int getInsertFlag() {
        return insertFlag;
    }
    /**
     * 设置insertFlag
     * @param insertFlag the insertFlag to set
     */
    public void setInsertFlag(int insertFlag) {
        this.insertFlag = insertFlag;
    }
    /**
     * 取得tableNameComment
     * @return the tableNameComment
     */
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
     * 取得columnName
     * @return the columnName
     */
    public String getColumnName() {
        return columnName;
    }
    /**
     * 设置columnName
     * @param columnName the columnName to set
     */
    public void setColumnName(String columnName) {
        this.columnName = columnName;
    }
    /**
     * 取得columnValueOld
     * @return the columnValueOld
     */
    public String getColumnValueOld() {
        return columnValueOld;
    }
    /**
     * 设置columnValueOld
     * @param columnValueOld the columnValueOld to set
     */
    public void setColumnValueOld(String columnValueOld) {
        this.columnValueOld = columnValueOld;
    }
    /**
     * 取得typeValueOld
     * @return the typeValueOld
     */
    public String getTypeValueOld() {
        return typeValueOld;
    }
    /**
     * 设置typeValueOld
     * @param typeValueOld the typeValueOld to set
     */
    public void setTypeValueOld(String typeValueOld) {
        this.typeValueOld = typeValueOld;
    }
}
