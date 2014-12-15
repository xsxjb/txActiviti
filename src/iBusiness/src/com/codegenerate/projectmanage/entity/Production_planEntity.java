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
 * @Description: 项目生产计划表
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_PRODUCTION_PLAN")
public class Production_planEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**projectno*/
	private java.lang.String projectno;
	/**projectname*/
	private java.lang.String projectname;
	/**projecttype*/
	private java.lang.String projecttype;
	/**customername*/
	private java.lang.String customername;
	/**productmanage*/
	private java.lang.String productmanage;
	/**batchno*/
	private java.lang.String batchno;
	/**productiontype*/
	private java.lang.String productiontype;
	/**productionmode*/
	private java.lang.String productionmode;
	/**productionaddress*/
	private java.lang.String productionaddress;
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
	/**workingday*/
	private java.lang.Integer workingday;
	/**starttime*/
	private java.util.Date starttime;
	/**endtime*/
	private java.util.Date endtime;
	/**buystarttime*/
	private java.util.Date buystarttime;
	/**buyendtime*/
	private java.util.Date buyendtime;
	/**prodstarttime*/
	private java.util.Date prodstarttime;
	/**prodendtime*/
	private java.util.Date prodendtime;
	/**prodoutstarttime*/
	private java.util.Date prodoutstarttime;
	/**prodoutendtime*/
	private java.util.Date prodoutendtime;
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
	 *@return: java.lang.String  projectname
	 */
	@Column(name ="PROJECTNAME",nullable=true,length=64)
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
	 *@return: java.lang.String  projecttype
	 */
	@Column(name ="PROJECTTYPE",nullable=true,length=16)
	public java.lang.String getProjecttype(){
		return this.projecttype;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  projecttype
	 */
	public void setProjecttype(java.lang.String projecttype){
		this.projecttype = projecttype;
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
	 *@return: java.lang.String  productmanage
	 */
	@Column(name ="PRODUCTMANAGE",nullable=true,length=64)
	public java.lang.String getProductmanage(){
		return this.productmanage;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  productmanage
	 */
	public void setProductmanage(java.lang.String productmanage){
		this.productmanage = productmanage;
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
	 *@return: java.lang.String  productiontype
	 */
	@Column(name ="PRODUCTIONTYPE",nullable=true,length=64)
	public java.lang.String getProductiontype(){
		return this.productiontype;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  productiontype
	 */
	public void setProductiontype(java.lang.String productiontype){
		this.productiontype = productiontype;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  productionmode
	 */
	@Column(name ="PRODUCTIONMODE",nullable=true,length=64)
	public java.lang.String getProductionmode(){
		return this.productionmode;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  productionmode
	 */
	public void setProductionmode(java.lang.String productionmode){
		this.productionmode = productionmode;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  productionaddress
	 */
	@Column(name ="PRODUCTIONADDRESS",nullable=true,length=64)
	public java.lang.String getProductionaddress(){
		return this.productionaddress;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  productionaddress
	 */
	public void setProductionaddress(java.lang.String productionaddress){
		this.productionaddress = productionaddress;
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
	 *@return: java.lang.Integer  workingday
	 */
	@Column(name ="WORKINGDAY",nullable=true,precision=10,scale=0)
	public java.lang.Integer getWorkingday(){
		return this.workingday;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  workingday
	 */
	public void setWorkingday(java.lang.Integer workingday){
		this.workingday = workingday;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  starttime
	 */
	@Column(name ="STARTTIME",nullable=true)
	public java.util.Date getStarttime(){
		return this.starttime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  starttime
	 */
	public void setStarttime(java.util.Date starttime){
		this.starttime = starttime;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  endtime
	 */
	@Column(name ="ENDTIME",nullable=true)
	public java.util.Date getEndtime(){
		return this.endtime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  endtime
	 */
	public void setEndtime(java.util.Date endtime){
		this.endtime = endtime;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  buystarttime
	 */
	@Column(name ="BUYSTARTTIME",nullable=true)
	public java.util.Date getBuystarttime(){
		return this.buystarttime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  buystarttime
	 */
	public void setBuystarttime(java.util.Date buystarttime){
		this.buystarttime = buystarttime;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  buyendtime
	 */
	@Column(name ="BUYENDTIME",nullable=true)
	public java.util.Date getBuyendtime(){
		return this.buyendtime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  buyendtime
	 */
	public void setBuyendtime(java.util.Date buyendtime){
		this.buyendtime = buyendtime;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  prodstarttime
	 */
	@Column(name ="PRODSTARTTIME",nullable=true)
	public java.util.Date getProdstarttime(){
		return this.prodstarttime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  prodstarttime
	 */
	public void setProdstarttime(java.util.Date prodstarttime){
		this.prodstarttime = prodstarttime;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  prodendtime
	 */
	@Column(name ="PRODENDTIME",nullable=true)
	public java.util.Date getProdendtime(){
		return this.prodendtime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  prodendtime
	 */
	public void setProdendtime(java.util.Date prodendtime){
		this.prodendtime = prodendtime;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  prodoutstarttime
	 */
	@Column(name ="PRODOUTSTARTTIME",nullable=true)
	public java.util.Date getProdoutstarttime(){
		return this.prodoutstarttime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  prodoutstarttime
	 */
	public void setProdoutstarttime(java.util.Date prodoutstarttime){
		this.prodoutstarttime = prodoutstarttime;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  prodoutendtime
	 */
	@Column(name ="PRODOUTENDTIME",nullable=true)
	public java.util.Date getProdoutendtime(){
		return this.prodoutendtime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  prodoutendtime
	 */
	public void setProdoutendtime(java.util.Date prodoutendtime){
		this.prodoutendtime = prodoutendtime;
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
