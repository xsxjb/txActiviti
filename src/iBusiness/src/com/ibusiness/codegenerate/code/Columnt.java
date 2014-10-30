package com.ibusiness.codegenerate.code;

/**
 * 表列字段Bean
 * 
 * @author JiangBo
 * 
 */
public class Columnt {
    public static final String OPTION_REQUIRED = "required:true";
    public static final String OPTION_NUMBER_INSEX = "precision:2,groupSeparator:','";
    private String fieldDbName;
    // 字段名小写
    private String fieldName;
    // 字段标题
    private String filedComment = "";
    // 是否为空
    private String isNull = "";
    // 录入宽度
    private String fcWidth = "";
    // 录入高度
    private String fcHeight = "";
    // 是否显示
    private String fcDisplay = "";
    // 是否编辑
    private String fcEdit = "";
    // 组件类型
    private String fcType = "";
    // 数据库字段类别
    private String fieldType = "";
    private String classType = "";
    private String classType_row = "";
    private String optionType = "";
    // 数据库字段长度
    private String charmaxLength = "";
    private String precision;
    private String scale;
    private String nullable;

    public String getNullable() {
        return this.nullable;
    }
    public void setNullable(String paramString) {
        this.nullable = paramString;
    }
    public String getPrecision() {
        return this.precision;
    }
    public String getScale() {
        return this.scale;
    }
    public void setPrecision(String paramString) {
        this.precision = paramString;
    }
    public void setScale(String paramString) {
        this.scale = paramString;
    }
    public String getOptionType() {
        return this.optionType;
    }
    public void setOptionType(String paramString) {
        this.optionType = paramString;
    }
    public String getClassType() {
        return this.classType;
    }
    public void setClassType(String paramString) {
        this.classType = paramString;
    }
    public String getFieldType() {
        return this.fieldType;
    }
    public void setFieldType(String paramString) {
        this.fieldType = paramString;
    }
    public String getFieldName() {
        return this.fieldName;
    }
    public void setFieldName(String paramString) {
        this.fieldName = paramString;
    }
    public String getFiledComment() {
        return this.filedComment;
    }
    public void setFiledComment(String paramString) {
        this.filedComment = paramString;
    }
    public String getClassType_row() {
        if ((this.classType != null) && (this.classType.indexOf("easyui-") >= 0))
            return this.classType.replaceAll("easyui-", "");
        return this.classType_row;
    }
    public void setClassType_row(String paramString) {
        this.classType_row = paramString;
    }
    public String getCharmaxLength() {
        if ((this.charmaxLength == null) || ("0".equals(this.charmaxLength)))
            return "";
        return this.charmaxLength;
    }
    public void setCharmaxLength(String paramString) {
        this.charmaxLength = paramString;
    }
    public String getFieldDbName() {
        return this.fieldDbName;
    }
    public void setFieldDbName(String paramString) {
        this.fieldDbName = paramString;
    }
    /**
     * @return the isNull
     */
    public String getIsNull() {
        return isNull;
    }
    /**
     * @param isNull the isNull to set
     */
    public void setIsNull(String isNull) {
        this.isNull = isNull;
    }
    /**
     * @return the fcWidth
     */
    public String getFcWidth() {
        return fcWidth;
    }
    /**
     * @param fcWidth the fcWidth to set
     */
    public void setFcWidth(String fcWidth) {
        this.fcWidth = fcWidth;
    }
    /**
     * @return the fcHeight
     */
    public String getFcHeight() {
        return fcHeight;
    }
    /**
     * @param fcHeight the fcHeight to set
     */
    public void setFcHeight(String fcHeight) {
        this.fcHeight = fcHeight;
    }
    /**
     * @return the fcDisplay
     */
    public String getFcDisplay() {
        return fcDisplay;
    }
    /**
     * @param fcDisplay the fcDisplay to set
     */
    public void setFcDisplay(String fcDisplay) {
        this.fcDisplay = fcDisplay;
    }
    /**
     * @return the fcEdit
     */
    public String getFcEdit() {
        return fcEdit;
    }
    /**
     * @param fcEdit the fcEdit to set
     */
    public void setFcEdit(String fcEdit) {
        this.fcEdit = fcEdit;
    }
    /**
     * @return the fcType
     */
    public String getFcType() {
        return fcType;
    }
    /**
     * @param fcType the fcType to set
     */
    public void setFcType(String fcType) {
        this.fcType = fcType;
    }
}
