package com.codegenerate.productmanage.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;
import javax.persistence.SequenceGenerator;

/**   
 * @Title: Entity
 * @Description: 产品分类表页面
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_PRODUCTTYPE")
public class ProducttypeEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**id*/
	private java.lang.String id;
	/**typeno*/
	private java.lang.String typeno;
	/**typename*/
	private java.lang.String typename;
	/**parentid*/
	private java.lang.String parentid;
	/**isleaf*/
	private java.lang.String isleaf;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  id
	 */
	
	@Id
	@Column(name ="ID",nullable=false,length=64)
	public java.lang.String getId(){
		return this.id;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  id
	 */
	public void setId(java.lang.String id){
		this.id = id;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  typeno
	 */
	@Column(name ="TYPENO",nullable=true,length=64)
	public java.lang.String getTypeno(){
		return this.typeno;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  typeno
	 */
	public void setTypeno(java.lang.String typeno){
		this.typeno = typeno;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  typename
	 */
	@Column(name ="TYPENAME",nullable=true,length=128)
	public java.lang.String getTypename(){
		return this.typename;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  typename
	 */
	public void setTypename(java.lang.String typename){
		this.typename = typename;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  parentid
	 */
	@Column(name ="PARENTID",nullable=true,length=64)
	public java.lang.String getParentid(){
		return this.parentid;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  parentid
	 */
	public void setParentid(java.lang.String parentid){
		this.parentid = parentid;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  isleaf
	 */
	@Column(name ="ISLEAF",nullable=true,length=8)
	public java.lang.String getIsleaf(){
		return this.isleaf;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  isleaf
	 */
	public void setIsleaf(java.lang.String isleaf){
		this.isleaf = isleaf;
	}
}
