package com.codegenerate.budgetmanage.entity;

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
 * @Description: 经营预算年度计划申报表流程
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_OPERATBUDGETPLAN")
public class OperatbudgetplanEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**planyear*/
	private java.lang.String planyear;
	/**planname*/
	private java.lang.String planname;
	/**dept*/
	private java.lang.String dept;
	/**eventtime*/
	private java.util.Date eventtime;
	/**no*/
	private java.lang.String no;
	/**planamount*/
	private java.lang.Double planamount;
	/**deptleader*/
	private java.lang.String deptleader;
	/**directormanager*/
	private java.lang.String directormanager;
	/**generalmanager*/
	private java.lang.String generalmanager;
	/**planner*/
	private java.lang.String planner;
	/**projecttypesum*/
	private java.lang.Double projecttypesum;
	/**projectnamesum*/
	private java.lang.Double projectnamesum;
	/**isgm*/
	private java.lang.String isgm;
	/**isdm*/
	private java.lang.String isdm;
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
	 *@return: java.lang.String  planyear
	 */
	@Column(name ="PLANYEAR",nullable=true,length=32)
	public java.lang.String getPlanyear(){
		return this.planyear;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  planyear
	 */
	public void setPlanyear(java.lang.String planyear){
		this.planyear = planyear;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  planname
	 */
	@Column(name ="PLANNAME",nullable=true,length=256)
	public java.lang.String getPlanname(){
		return this.planname;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  planname
	 */
	public void setPlanname(java.lang.String planname){
		this.planname = planname;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  dept
	 */
	@Column(name ="DEPT",nullable=true,length=128)
	public java.lang.String getDept(){
		return this.dept;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  dept
	 */
	public void setDept(java.lang.String dept){
		this.dept = dept;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  eventtime
	 */
	@Column(name ="EVENTTIME",nullable=true)
	public java.util.Date getEventtime(){
		return this.eventtime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  eventtime
	 */
	public void setEventtime(java.util.Date eventtime){
		this.eventtime = eventtime;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  no
	 */
	@Column(name ="NO",nullable=true,length=64)
	public java.lang.String getNo(){
		return this.no;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  no
	 */
	public void setNo(java.lang.String no){
		this.no = no;
	}
	/**
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  planamount
	 */
	@Column(name ="PLANAMOUNT",nullable=true,precision=12,scale=2)
	public java.lang.Double getPlanamount(){
		return this.planamount;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  planamount
	 */
	public void setPlanamount(java.lang.Double planamount){
		this.planamount = planamount;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  deptleader
	 */
	@Column(name ="DEPTLEADER",nullable=true,length=512)
	public java.lang.String getDeptleader(){
		return this.deptleader;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  deptleader
	 */
	public void setDeptleader(java.lang.String deptleader){
		this.deptleader = deptleader;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  directormanager
	 */
	@Column(name ="DIRECTORMANAGER",nullable=true,length=512)
	public java.lang.String getDirectormanager(){
		return this.directormanager;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  directormanager
	 */
	public void setDirectormanager(java.lang.String directormanager){
		this.directormanager = directormanager;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  generalmanager
	 */
	@Column(name ="GENERALMANAGER",nullable=true,length=512)
	public java.lang.String getGeneralmanager(){
		return this.generalmanager;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  generalmanager
	 */
	public void setGeneralmanager(java.lang.String generalmanager){
		this.generalmanager = generalmanager;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  planner
	 */
	@Column(name ="PLANNER",nullable=true,length=512)
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
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  projecttypesum
	 */
	@Column(name ="PROJECTTYPESUM",nullable=true,precision=12,scale=2)
	public java.lang.Double getProjecttypesum(){
		return this.projecttypesum;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  projecttypesum
	 */
	public void setProjecttypesum(java.lang.Double projecttypesum){
		this.projecttypesum = projecttypesum;
	}
	/**
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  projectnamesum
	 */
	@Column(name ="PROJECTNAMESUM",nullable=true,precision=12,scale=2)
	public java.lang.Double getProjectnamesum(){
		return this.projectnamesum;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  projectnamesum
	 */
	public void setProjectnamesum(java.lang.Double projectnamesum){
		this.projectnamesum = projectnamesum;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  isgm
	 */
	@Column(name ="ISGM",nullable=true,length=16)
	public java.lang.String getIsgm(){
		return this.isgm;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  isgm
	 */
	public void setIsgm(java.lang.String isgm){
		this.isgm = isgm;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  isdm
	 */
	@Column(name ="ISDM",nullable=true,length=16)
	public java.lang.String getIsdm(){
		return this.isdm;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  isdm
	 */
	public void setIsdm(java.lang.String isdm){
		this.isdm = isdm;
	}
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
