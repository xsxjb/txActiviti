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
