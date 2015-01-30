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
@Table(name = "IB_PROJECT_APPROVAL")
public class Project_approvalEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**id*/
	private java.lang.String id;
	/**username*/
	private java.lang.String username;
	/**tasktitle*/
	private java.lang.String tasktitle;
	/**nodename*/
	private java.lang.String nodename;
	/**executionid*/
	private java.lang.String executionid;
	/**assigneeuser*/
	private java.lang.String assigneeuser;
	/**doneflag*/
	private java.lang.Integer doneflag;
	/**createdatebpm*/
	private java.util.Date createdatebpm;
	/**eventdate*/
	private java.lang.String eventdate;
	/**pactno*/
	private java.lang.String pactno;
	/**customername*/
	private java.lang.String customername;
	/**projectno*/
	private java.lang.String projectno;
	/**projectname*/
	private java.lang.String projectname;
	/**projecttype*/
	private java.lang.String projecttype;
	/**salesuser*/
	private java.lang.String salesuser;
	/**projectmanager*/
	private java.lang.String projectmanager;
	/**planner*/
	private java.lang.String planner;
	/**buyer*/
	private java.lang.String buyer;
	/**productmanage*/
	private java.lang.String productmanage;
	
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
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  assigneeuser
	 */
	@Column(name ="ASSIGNEEUSER",nullable=true,length=128)
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
	 *@return: java.lang.String  eventdate
	 */
	@Column(name ="EVENTDATE",nullable=true,length=24)
	public java.lang.String getEventdate(){
		return this.eventdate;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  eventdate
	 */
	public void setEventdate(java.lang.String eventdate){
		this.eventdate = eventdate;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  pactno
	 */
	@Column(name ="PACTNO",nullable=true,length=64)
	public java.lang.String getPactno(){
		return this.pactno;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  pactno
	 */
	public void setPactno(java.lang.String pactno){
		this.pactno = pactno;
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
	 *@return: java.lang.String  salesuser
	 */
	@Column(name ="SALESUSER",nullable=true,length=64)
	public java.lang.String getSalesuser(){
		return this.salesuser;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  salesuser
	 */
	public void setSalesuser(java.lang.String salesuser){
		this.salesuser = salesuser;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  projectmanager
	 */
	@Column(name ="PROJECTMANAGER",nullable=true,length=32)
	public java.lang.String getProjectmanager(){
		return this.projectmanager;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  projectmanager
	 */
	public void setProjectmanager(java.lang.String projectmanager){
		this.projectmanager = projectmanager;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  planner
	 */
	@Column(name ="PLANNER",nullable=true,length=32)
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
	 *@return: java.lang.String  buyer
	 */
	@Column(name ="BUYER",nullable=true,length=32)
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
	 *@return: java.lang.String  productmanage
	 */
	@Column(name ="PRODUCTMANAGE",nullable=true,length=32)
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
}
