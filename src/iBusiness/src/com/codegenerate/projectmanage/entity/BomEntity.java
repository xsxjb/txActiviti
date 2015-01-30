package com.codegenerate.projectmanage.entity;

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
 * @Description: 原料BOM分解表页面
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_BOM")
public class BomEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**id*/
	private java.lang.String id;
	/**projectno*/
	private java.lang.String projectno;
	/**projectname*/
	private java.lang.String projectname;
	/**audituser*/
	private java.lang.String audituser;
	/**customername*/
	private java.lang.String customername;
	/**designuser*/
	private java.lang.String designuser;
	/**drawbook*/
	private java.lang.String drawbook;
	/**productflowid*/
	private java.lang.String productflowid;
	/**productmodel*/
	private java.lang.String productmodel;
	/**productname*/
	private java.lang.String productname;
	/**productno*/
	private java.lang.String productno;
	/**productnumber*/
	private java.lang.Integer productnumber;
	/**producttype*/
	private java.lang.String producttype;
	/**productunit*/
	private java.lang.String productunit;
	/**unitprice*/
	private java.lang.Double unitprice;
	
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
	 *@return: java.lang.String  projectno
	 */
	@Column(name ="PROJECTNO",nullable=true,length=64)
	public java.lang.String getProjectno(){
		return this.projectno;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  projectno
	 */
	public void setProjectno(java.lang.String projectno){
		this.projectno = projectno;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  projectname
	 */
	@Column(name ="PROJECTNAME",nullable=true,length=128)
	public java.lang.String getProjectname(){
		return this.projectname;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  projectname
	 */
	public void setProjectname(java.lang.String projectname){
		this.projectname = projectname;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  audituser
	 */
	@Column(name ="AUDITUSER",nullable=true,length=64)
	public java.lang.String getAudituser(){
		return this.audituser;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  audituser
	 */
	public void setAudituser(java.lang.String audituser){
		this.audituser = audituser;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  customername
	 */
	@Column(name ="CUSTOMERNAME",nullable=true,length=64)
	public java.lang.String getCustomername(){
		return this.customername;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  customername
	 */
	public void setCustomername(java.lang.String customername){
		this.customername = customername;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  designuser
	 */
	@Column(name ="DESIGNUSER",nullable=true,length=64)
	public java.lang.String getDesignuser(){
		return this.designuser;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  designuser
	 */
	public void setDesignuser(java.lang.String designuser){
		this.designuser = designuser;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  drawbook
	 */
	@Column(name ="DRAWBOOK",nullable=true,length=128)
	public java.lang.String getDrawbook(){
		return this.drawbook;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  drawbook
	 */
	public void setDrawbook(java.lang.String drawbook){
		this.drawbook = drawbook;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  productflowid
	 */
	@Column(name ="PRODUCTFLOWID",nullable=true,length=64)
	public java.lang.String getProductflowid(){
		return this.productflowid;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  productflowid
	 */
	public void setProductflowid(java.lang.String productflowid){
		this.productflowid = productflowid;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  productmodel
	 */
	@Column(name ="PRODUCTMODEL",nullable=true,length=64)
	public java.lang.String getProductmodel(){
		return this.productmodel;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  productmodel
	 */
	public void setProductmodel(java.lang.String productmodel){
		this.productmodel = productmodel;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  productname
	 */
	@Column(name ="PRODUCTNAME",nullable=true,length=128)
	public java.lang.String getProductname(){
		return this.productname;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  productname
	 */
	public void setProductname(java.lang.String productname){
		this.productname = productname;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  productno
	 */
	@Column(name ="PRODUCTNO",nullable=true,length=64)
	public java.lang.String getProductno(){
		return this.productno;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  productno
	 */
	public void setProductno(java.lang.String productno){
		this.productno = productno;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  productnumber
	 */
	@Column(name ="PRODUCTNUMBER",nullable=true,precision=10,scale=0)
	public java.lang.Integer getProductnumber(){
		return this.productnumber;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  productnumber
	 */
	public void setProductnumber(java.lang.Integer productnumber){
		this.productnumber = productnumber;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  producttype
	 */
	@Column(name ="PRODUCTTYPE",nullable=true,length=64)
	public java.lang.String getProducttype(){
		return this.producttype;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  producttype
	 */
	public void setProducttype(java.lang.String producttype){
		this.producttype = producttype;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  productunit
	 */
	@Column(name ="PRODUCTUNIT",nullable=true,length=8)
	public java.lang.String getProductunit(){
		return this.productunit;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  productunit
	 */
	public void setProductunit(java.lang.String productunit){
		this.productunit = productunit;
	}
	/**
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  unitprice
	 */
	@Column(name ="UNITPRICE",nullable=true,precision=12,scale=2)
	public java.lang.Double getUnitprice(){
		return this.unitprice;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  unitprice
	 */
	public void setUnitprice(java.lang.Double unitprice){
		this.unitprice = unitprice;
	}
}
