package com.ibusiness.component.form.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * IB_CONF_FORM 表单管理表
 * 
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_CONF_FORM")
public class ConfForm {
    // UUID
    private String id;
    // 模块包名
    private String packageName;
    // 表单名称
    private String formName;
    // 表单名标题
    private String formTitle;
    // 是否可修改
    private Boolean isEdit;
    // 是否可新增
    private Boolean isAdd;
    // 是否可删除
    private Boolean isDelete;
    // 是否可查询
    private Boolean isQuery;
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
     * @return the formName
     */
    @Column(name = "FORMNAME")
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
     * @return the formTitle
     */
    @Column(name = "FORMTITLE")
    public String getFormTitle() {
        return formTitle;
    }
    /**
     * @param formTitle the formTitle to set
     */
    public void setFormTitle(String formTitle) {
        this.formTitle = formTitle;
    }
    /**
     * @return the isEdit
     */
    @Column(name = "ISEDIT")
    public Boolean getIsEdit() {
        return isEdit;
    }
    /**
     * @param isEdit the isEdit to set
     */
    public void setIsEdit(Boolean isEdit) {
        this.isEdit = isEdit;
    }
    /**
     * @return the isAdd
     */
    @Column(name = "ISADD")
    public Boolean getIsAdd() {
        return isAdd;
    }
    /**
     * @param isAdd the isAdd to set
     */
    public void setIsAdd(Boolean isAdd) {
        this.isAdd = isAdd;
    }
    /**
     * @return the isDelete
     */
    @Column(name = "ISDELETE")
    public Boolean getIsDelete() {
        return isDelete;
    }
    /**
     * @param isDelete the isDelete to set
     */
    public void setIsDelete(Boolean isDelete) {
        this.isDelete = isDelete;
    }
    /**
     * @return the isQuery
     */
    @Column(name = "ISQUERY")
    public Boolean getIsQuery() {
        return isQuery;
    }
    /**
     * @param isQuery the isQuery to set
     */
    public void setIsQuery(Boolean isQuery) {
        this.isQuery = isQuery;
    }
}
