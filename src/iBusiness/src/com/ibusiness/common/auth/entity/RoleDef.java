package com.ibusiness.common.auth.entity;

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
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * RoleDef 角色模板管理表.
 * 
 * @author JiangBo
 */
@Entity
@Table(name = "AUTH_ROLE_DEF")
public class RoleDef implements java.io.Serializable {
    private static final long serialVersionUID = 0L;

    /** null. */
    private Long id;

    /** null. */
    private String name;

    /** null. */
    private String descn;

    /** null. */
    private String scopeId;

    /** . */
    private Set<Role> roles = new HashSet<Role>(0);

    /** . */
    private Set<Perm> perms = new HashSet<Perm>(0);

    public RoleDef() {
    }

    public RoleDef(String name, String descn, String scopeId, Set<Role> roles,
            Set<Perm> perms) {
        this.name = name;
        this.descn = descn;
        this.scopeId = scopeId;
        this.roles = roles;
        this.perms = perms;
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
    @Column(name = "NAME", length = 50)
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
    @Column(name = "DESCN", length = 200)
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
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "roleDef")
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

    /** @return . */
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "AUTH_PERM_ROLE_DEF", joinColumns = { @JoinColumn(name = "ROLE_DEF_ID", nullable = false, updatable = false) }, inverseJoinColumns = { @JoinColumn(name = "PERM_ID", nullable = false, updatable = false) })
    public Set<Perm> getPerms() {
        return this.perms;
    }

    /**
     * @param perms
     *            .
     */
    public void setPerms(Set<Perm> perms) {
        this.perms = perms;
    }
}
