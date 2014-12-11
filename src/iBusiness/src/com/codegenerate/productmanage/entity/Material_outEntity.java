package com.codegenerate.productmanage.entity;

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
 * @Description: (领料)原料出库表
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_MATERIAL_OUT")
public class Material_outEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**executionid*/
	private java.lang.String executionid;
	/**assigneeuser*/
	private java.lang.String assigneeuser;
	/**doneflag*/
	private java.lang.Integer doneflag;
	/**id*/
	private java.lang.String id;
	/**username*/
	private java.lang.String username;
	/**tasktitle*/
	private java.lang.String tasktitle;
	/**nodename*/
	private java.lang.String nodename;
	/**createdatebpm*/
	private java.util.Date createdatebpm;
	/**eventdate*/
	private java.util.Date eventdate;
	/**batchno*/
	private java.lang.String batchno;
	/**warehouseno*/
	private java.lang.String warehouseno;
	/**productno*/
	private java.lang.String productno;
	/**productname*/
	private java.lang.String productname;
	/**materialnum*/
	private java.lang.Integer materialnum;
	
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
	 *@return: java.lang.String  batchno
	 */
	@Column(name ="BATCHNO",nullable=true,length=8)
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
	 *@return: java.lang.String  warehouseno
	 */
	@Column(name ="WAREHOUSENO",nullable=true,length=64)
	public java.lang.String getWarehouseno(){
		return this.warehouseno;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  warehouseno
	 */
	public void setWarehouseno(java.lang.String warehouseno){
		this.warehouseno = warehouseno;
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
	@Column(name ="PRODUCTNAME",nullable=true,length=256)
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
}
