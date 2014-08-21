package com.ibusiness.auth.domain;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

/**
 * 用户状态表
 * 
 * @author JiangBo
 */
@Entity
@Table(name = "AUTH_USER_STATUS")
public class UserStatus implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
    /** 编号. */
    private Long id;
    /** 用户称. */
    private String username;
    /** 密码. */
    private String password;
    /** 状态. */
    private Integer status;
    /** 引用. */
    private String ref;
    /** 角色模板编号. */
    private String userRepoRef;
    /** 范围. */
    private String scopeId;

    /** 角色. */
    private Set<Role> roles = new HashSet<Role>(0);

    public UserStatus() {
    }

    public UserStatus(String username, String password, Integer status,
            String ref, String userRepoRef, String scopeId, Set<Role> roles) {
        this.username = username;
        this.password = password;
        this.status = status;
        this.ref = ref;
        this.userRepoRef = userRepoRef;
        this.scopeId = scopeId;
        this.roles = roles;
    }

    /** @return null. */
    @Id
    @GeneratedValue
    @Column(name = "ID", unique = true, nullable = false)
    public Long getId() {
        return this.id;
    }

    /**
     * @param id
     *            null.
     */
    public void setId(Long id) {
        this.id = id;
    }

    /** @return null. */
    @Column(name = "USERNAME", length = 50)
    public String getUsername() {
        return this.username;
    }

    /**
     * @param username
     *            null.
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /** @return null. */
    @Column(name = "PASSWORD", length = 50)
    public String getPassword() {
        return this.password;
    }

    /**
     * @param password
     *            null.
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /** @return null. */
    @Column(name = "STATUS")
    public Integer getStatus() {
        return this.status;
    }

    /**
     * @param status
     *            null.
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    /** @return null. */
    @Column(name = "REF", length = 200)
    public String getRef() {
        return this.ref;
    }

    /**
     * @param ref
     *            null.
     */
    public void setRef(String ref) {
        this.ref = ref;
    }

    /** @return null. */
    @Column(name = "USER_REPO_REF", length = 50)
    public String getUserRepoRef() {
        return this.userRepoRef;
    }

    /**
     * @param userRepoRef
     *            null.
     */
    public void setUserRepoRef(String userRepoRef) {
        this.userRepoRef = userRepoRef;
    }

    /** @return null. */
    @Column(name = "SCOPE_ID", length = 50)
    public String getScopeId() {
        return this.scopeId;
    }

    /**
     * @param scopeId
     *            null.
     */
    public void setScopeId(String scopeId) {
        this.scopeId = scopeId;
    }

    /** @return . */
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "AUTH_USER_ROLE", joinColumns = { @JoinColumn(name = "USER_STATUS_ID", nullable = false, updatable = false) }, inverseJoinColumns = { @JoinColumn(name = "ROLE_ID", nullable = false, updatable = false) })
    public Set<Role> getRoles() {
        return this.roles;
    }

    /**
     * @param roles
     *            .
     */
    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }
}
