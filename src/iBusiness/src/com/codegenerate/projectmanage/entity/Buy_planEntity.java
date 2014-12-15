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
 * @Description: 材料采购计划申请表
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_BUY_PLAN")
public class Buy_planEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**projectno*/
	private java.lang.String projectno;
	/**batchno*/
	private java.lang.String batchno;
	/**projectname*/
	private java.lang.String projectname;
	/**customername*/
	private java.lang.String customername;
	/**productmanage*/
	private java.lang.String productmanage;
	/**eventdate*/
	private java.util.Date eventdate;
	/**buyer*/
	private java.lang.String buyer;
	/**applicant*/
	private java.lang.String applicant;
	/**directflag*/
	private java.lang.String directflag;
	/**receiptuser*/
	private java.lang.String receiptuser;
	/**receiptaddress*/
	private java.lang.String receiptaddress;
	/**stocktype*/
	private java.lang.String stocktype;
	/**documenttype*/
	private java.lang.String documenttype;
	/**planner*/
	private java.lang.String planner;
	/**id*/
	private java.lang.String id;
	/**executionid*/
	private java.lang.String executionid;
	/**createdatebpm*/
	private java.util.Date createdatebpm;
	/**nodename*/
	private java.lang.String nodename;
	/**username*/
	private java.lang.String username;
	/**assigneeuser*/
	private java.lang.String assigneeuser;
	/**doneflag*/
	private java.lang.Integer doneflag;
	/**tasktitle*/
	private java.lang.String tasktitle;
	
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
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  eventdate
	 */
	@Column(name ="EVENTDATE",nullable=true)
	public java.util.Date getEventdate(){
		return this.eventdate;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  eventdate
	 */
	public void setEventdate(java.util.Date eventdate){
		this.eventdate = eventdate;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  buyer
	 */
	@Column(name ="BUYER",nullable=true,length=64)
	public java.lang.String getBuyer(){
		return this.buyer;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  buyer
	 */
	public void setBuyer(java.lang.String buyer){
		this.buyer = buyer;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  applicant
	 */
	@Column(name ="APPLICANT",nullable=true,length=64)
	public java.lang.String getApplicant(){
		return this.applicant;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  applicant
	 */
	public void setApplicant(java.lang.String applicant){
		this.applicant = applicant;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  directflag
	 */
	@Column(name ="DIRECTFLAG",nullable=true,length=64)
	public java.lang.String getDirectflag(){
		return this.directflag;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  directflag
	 */
	public void setDirectflag(java.lang.String directflag){
		this.directflag = directflag;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  receiptuser
	 */
	@Column(name ="RECEIPTUSER",nullable=true,length=128)
	public java.lang.String getReceiptuser(){
		return this.receiptuser;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  receiptuser
	 */
	public void setReceiptuser(java.lang.String receiptuser){
		this.receiptuser = receiptuser;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  receiptaddress
	 */
	@Column(name ="RECEIPTADDRESS",nullable=true,length=512)
	public java.lang.String getReceiptaddress(){
		return this.receiptaddress;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  receiptaddress
	 */
	public void setReceiptaddress(java.lang.String receiptaddress){
		this.receiptaddress = receiptaddress;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  stocktype
	 */
	@Column(name ="STOCKTYPE",nullable=true,length=8)
	public java.lang.String getStocktype(){
		return this.stocktype;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  stocktype
	 */
	public void setStocktype(java.lang.String stocktype){
		this.stocktype = stocktype;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  documenttype
	 */
	@Column(name ="DOCUMENTTYPE",nullable=true,length=16)
	public java.lang.String getDocumenttype(){
		return this.documenttype;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  documenttype
	 */
	public void setDocumenttype(java.lang.String documenttype){
		this.documenttype = documenttype;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  planner
	 */
	@Column(name ="PLANNER",nullable=true,length=64)
	public java.lang.String getPlanner(){
		return this.planner;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  planner
	 */
	public void setPlanner(java.lang.String planner){
		this.planner = planner;
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
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  executionid
	 */
	@Column(name ="EXECUTIONID",nullable=true,length=64)
	public java.lang.String getExecutionid(){
		return this.executionid;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  executionid
	 */
	public void setExecutionid(java.lang.String executionid){
		this.executionid = executionid;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  createdatebpm
	 */
	@Column(name ="CREATEDATEBPM",nullable=true)
	public java.util.Date getCreatedatebpm(){
		return this.createdatebpm;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  createdatebpm
	 */
	public void setCreatedatebpm(java.util.Date createdatebpm){
		this.createdatebpm = createdatebpm;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  nodename
	 */
	@Column(name ="NODENAME",nullable=true,length=128)
	public java.lang.String getNodename(){
		return this.nodename;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  nodename
	 */
	public void setNodename(java.lang.String nodename){
		this.nodename = nodename;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  username
	 */
	@Column(name ="USERNAME",nullable=true,length=128)
	public java.lang.String getUsername(){
		return this.username;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  username
	 */
	public void setUsername(java.lang.String username){
		this.username = username;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  assigneeuser
	 */
	@Column(name ="ASSIGNEEUSER",nullable=true,length=64)
	public java.lang.String getAssigneeuser(){
		return this.assigneeuser;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  assigneeuser
	 */
	public void setAssigneeuser(java.lang.String assigneeuser){
		this.assigneeuser = assigneeuser;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  doneflag
	 */
	@Column(name ="DONEFLAG",nullable=true,precision=10,scale=0)
	public java.lang.Integer getDoneflag(){
		return this.doneflag;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  doneflag
	 */
	public void setDoneflag(java.lang.Integer doneflag){
		this.doneflag = doneflag;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  tasktitle
	 */
	@Column(name ="TASKTITLE",nullable=true,length=256)
	public java.lang.String getTasktitle(){
		return this.tasktitle;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  tasktitle
	 */
	public void setTasktitle(java.lang.String tasktitle){
		this.tasktitle = tasktitle;
	}
}
