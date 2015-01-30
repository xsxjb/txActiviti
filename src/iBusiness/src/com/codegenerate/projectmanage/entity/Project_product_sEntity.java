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
 * @Description: 项目立项表流程
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_PROJECT_PRODUCT_S")
public class Project_product_sEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**id*/
	private java.lang.String id;
	/**parentid*/
	private java.lang.String parentid;
	/**productno*/
	private java.lang.String productno;
	/**productname*/
	private java.lang.String productname;
	/**productmodel*/
	private java.lang.String productmodel;
	/**productnumber*/
	private java.lang.Integer productnumber;
	/**productunit*/
	private java.lang.String productunit;
	/**unitprice*/
	private java.lang.Double unitprice;
	/**amount*/
	private java.lang.Double amount;
	/**producttype*/
	private java.lang.String producttype;
	/**productflowid*/
	private java.lang.String productflowid;
	
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
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  productname
	 */
	@Column(name ="PRODUCTNAME",nullable=true,length=64)
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
	 *@return: java.lang.String  productmodel
	 */
	@Column(name ="PRODUCTMODEL",nullable=true,length=63)
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
	 *@return: java.lang.String  productunit
	 */
	@Column(name ="PRODUCTUNIT",nullable=true,length=12)
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
	/**
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  amount
	 */
	@Column(name ="AMOUNT",nullable=true,precision=12,scale=2)
	public java.lang.Double getAmount(){
		return this.amount;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  amount
	 */
	public void setAmount(java.lang.Double amount){
		this.amount = amount;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  producttype
	 */
	@Column(name ="PRODUCTTYPE",nullable=true,length=32)
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
	 *@return: java.lang.String  productflowid
	 */
	@Column(name ="PRODUCTFLOWID",nullable=true,length=32)
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
}
