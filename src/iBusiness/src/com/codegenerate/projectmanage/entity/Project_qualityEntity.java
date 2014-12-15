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
 * @Description: 产品质监任务表
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_PROJECT_QUALITY")
public class Project_qualityEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**projectno*/
	private java.lang.String projectno;
	/**batchno*/
	private java.lang.String batchno;
	/**producttype*/
	private java.lang.String producttype;
	/**productflowid*/
	private java.lang.String productflowid;
	/**productno*/
	private java.lang.String productno;
	/**productname*/
	private java.lang.String productname;
	/**productmodel*/
	private java.lang.String productmodel;
	/**materialnum*/
	private java.lang.Integer materialnum;
	/**qualitydate*/
	private java.util.Date qualitydate;
	/**qualityresult*/
	private java.lang.String qualityresult;
	/**qualityuser*/
	private java.lang.String qualityuser;
	/**qualityreport*/
	private java.lang.String qualityreport;
	/**id*/
	private java.lang.String id;
	
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
	 *@return: java.lang.String  batchno
	 */
	@Column(name ="BATCHNO",nullable=true,length=64)
	public java.lang.String getBatchno(){
		return this.batchno;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  batchno
	 */
	public void setBatchno(java.lang.String batchno){
		this.batchno = batchno;
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
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  materialnum
	 */
	@Column(name ="MATERIALNUM",nullable=true,precision=10,scale=0)
	public java.lang.Integer getMaterialnum(){
		return this.materialnum;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  materialnum
	 */
	public void setMaterialnum(java.lang.Integer materialnum){
		this.materialnum = materialnum;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  qualitydate
	 */
	@Column(name ="QUALITYDATE",nullable=true)
	public java.util.Date getQualitydate(){
		return this.qualitydate;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  qualitydate
	 */
	public void setQualitydate(java.util.Date qualitydate){
		this.qualitydate = qualitydate;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  qualityresult
	 */
	@Column(name ="QUALITYRESULT",nullable=true,length=16)
	public java.lang.String getQualityresult(){
		return this.qualityresult;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  qualityresult
	 */
	public void setQualityresult(java.lang.String qualityresult){
		this.qualityresult = qualityresult;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  qualityuser
	 */
	@Column(name ="QUALITYUSER",nullable=true,length=64)
	public java.lang.String getQualityuser(){
		return this.qualityuser;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  qualityuser
	 */
	public void setQualityuser(java.lang.String qualityuser){
		this.qualityuser = qualityuser;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  qualityreport
	 */
	@Column(name ="QUALITYREPORT",nullable=true,length=512)
	public java.lang.String getQualityreport(){
		return this.qualityreport;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  qualityreport
	 */
	public void setQualityreport(java.lang.String qualityreport){
		this.qualityreport = qualityreport;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  id
	 */
	
	@Id
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")
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
}
