package com.codegenerate.test.entity;

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
 * @Description: 审批权限流程表
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_PERMISSION")
public class PermissionEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**id*/
	private java.lang.String id;
	/**executionid*/
	private java.lang.String executionid;
	/**createdatebpm*/
	private java.util.Date createdatebpm;
	/**nodename*/
	private java.lang.String nodename;
	/**assigneeuser*/
	private java.lang.String assigneeuser;
	/**tasktitle*/
	private java.lang.String tasktitle;
	/**remark*/
	private java.lang.String remark;
	/**doneflag*/
	private java.lang.Integer doneflag;
	
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
	 *@return: java.lang.String  remark
	 */
	@Column(name ="REMARK",nullable=true,length=512)
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
}
