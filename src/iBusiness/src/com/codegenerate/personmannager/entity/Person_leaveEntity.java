package com.codegenerate.personmannager.entity;

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
 * @Description: 员工离职页面
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_PERSON_LEAVE")
public class Person_leaveEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**name*/
	private java.lang.String name;
	/**leavesort*/
	private java.lang.String leavesort;
	/**leavestate*/
	private java.lang.String leavestate;
	/**leavesection*/
	private java.lang.String leavesection;
	/**leavejob*/
	private java.lang.String leavejob;
	/**leavedate*/
	private java.util.Date leavedate;
	/**stopdate*/
	private java.util.Date stopdate;
	/**remark*/
	private java.lang.String remark;
	/**id*/
	private java.lang.String id;
	/**scopeid*/
	private java.lang.String scopeid;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  name
	 */
	@Column(name ="NAME",nullable=true,length=32)
	public java.lang.String getName(){
		return this.name;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  name
	 */
	public void setName(java.lang.String name){
		this.name = name;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  leavesort
	 */
	@Column(name ="LEAVESORT",nullable=true,length=32)
	public java.lang.String getLeavesort(){
		return this.leavesort;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  leavesort
	 */
	public void setLeavesort(java.lang.String leavesort){
		this.leavesort = leavesort;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  leavestate
	 */
	@Column(name ="LEAVESTATE",nullable=true,length=32)
	public java.lang.String getLeavestate(){
		return this.leavestate;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  leavestate
	 */
	public void setLeavestate(java.lang.String leavestate){
		this.leavestate = leavestate;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  leavesection
	 */
	@Column(name ="LEAVESECTION",nullable=true,length=32)
	public java.lang.String getLeavesection(){
		return this.leavesection;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  leavesection
	 */
	public void setLeavesection(java.lang.String leavesection){
		this.leavesection = leavesection;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  leavejob
	 */
	@Column(name ="LEAVEJOB",nullable=true,length=32)
	public java.lang.String getLeavejob(){
		return this.leavejob;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  leavejob
	 */
	public void setLeavejob(java.lang.String leavejob){
		this.leavejob = leavejob;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  leavedate
	 */
	@Column(name ="LEAVEDATE",nullable=true)
	public java.util.Date getLeavedate(){
		return this.leavedate;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  leavedate
	 */
	public void setLeavedate(java.util.Date leavedate){
		this.leavedate = leavedate;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  stopdate
	 */
	@Column(name ="STOPDATE",nullable=true)
	public java.util.Date getStopdate(){
		return this.stopdate;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  stopdate
	 */
	public void setStopdate(java.util.Date stopdate){
		this.stopdate = stopdate;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  remark
	 */
	@Column(name ="REMARK",nullable=true,length=32)
	public java.lang.String getRemark(){
		return this.remark;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  remark
	 */
	public void setRemark(java.lang.String remark){
		this.remark = remark;
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
	 *@return: java.lang.String  scopeid
	 */
	@Column(name ="SCOPEID",nullable=true,length=64)
	public java.lang.String getScopeid(){
		return this.scopeid;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  scopeid
	 */
	public void setScopeid(java.lang.String scopeid){
		this.scopeid = scopeid;
	}
}
