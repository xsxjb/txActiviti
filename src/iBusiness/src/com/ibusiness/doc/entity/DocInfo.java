package com.ibusiness.doc.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * DocInfo 文档.
 * 
 * @author JiangBo
 */
@Entity
@Table(name = "IB_DOC_INFO")
public class DocInfo implements java.io.Serializable {
    private static final long serialVersionUID = 0L;

    /** null. */
    private String id;

    /** null. */
    private String name;

    /** null. */
    private String path;

    /** null. */
    private Integer docType;

    /** null. */
    private Date createTime;

    /** null. */
    private String userId;

    /** null. */
    private String descn;

    /** @return null. */
    @Id
    @Column(name = "ID", unique = true, nullable = false)
    public String getId() {
        return this.id;
    }

    /**
     * @param id
     *            null.
     */
    public void setId(String id) {
        this.id = id;
    }

    /** @return null. */
    @Column(name = "NAME", length = 200)
    public String getName() {
        return this.name;
    }

    /**
     * @param name
     *            null.
     */
    public void setName(String name) {
        this.name = name;
    }

    /** @return null. */
    @Column(name = "PATH", length = 200)
    public String getPath() {
        return this.path;
    }

    /**
     * @param path
     *            null.
     */
    public void setPath(String path) {
        this.path = path;
    }

    /** @return null. */
    @Column(name = "DOCTYPE")
    public Integer getDocType() {
        return this.docType;
    }

    /**
     * @param type
     *            null.
     */
    public void setDocType(Integer docType) {
        this.docType = docType;
    }

    /** @return null. */
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "CREATE_TIME", length = 26)
    public Date getCreateTime() {
        return this.createTime;
    }

    /**
     * @param createTime
     *            null.
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    /** @return null. */
    @Column(name = "USER_ID")
    public String getUserId() {
        return this.userId;
    }

    /**
     * @param userId
     *            null.
     */
    public void setUserId(String userId) {
        this.userId = userId;
    }

    /** @return null. */
    @Column(name = "DESCN")
    public String getDescn() {
        return this.descn;
    }

    /**
     * @param descn
     *            null.
     */
    public void setDescn(String descn) {
        this.descn = descn;
    }
}
