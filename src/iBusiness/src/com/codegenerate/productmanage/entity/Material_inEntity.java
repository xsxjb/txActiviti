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
 * @Description: 原料入库表
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_MATERIAL_IN")
public class Material_inEntity implements java.io.Serializable {
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
	/**suppliersname*/
	private java.lang.String suppliersname;
	/**warehouseno*/
	private java.lang.String warehouseno;
	/**warehousename*/
	private java.lang.String warehousename;
	/**totalnum*/
	private java.lang.Integer totalnum;
	/**amount*/
	private java.lang.Double amount;
	/**amountbig*/
	private java.lang.String amountbig;
	/**remark*/
	private java.lang.String remark;
	
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
	 *@return: java.lang.String  suppliersname
	 */
	@Column(name ="SUPPLIERSNAME",nullable=true,length=64)
	public java.lang.String getSuppliersname(){
		return this.suppliersname;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  suppliersname
	 */
	public void setSuppliersname(java.lang.String suppliersname){
		this.suppliersname = suppliersname;
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
	 *@return: java.lang.String  warehousename
	 */
	@Column(name ="WAREHOUSENAME",nullable=true,length=64)
	public java.lang.String getWarehousename(){
		return this.warehousename;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  warehousename
	 */
	public void setWarehousename(java.lang.String warehousename){
		this.warehousename = warehousename;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  totalnum
	 */
	@Column(name ="TOTALNUM",nullable=true,precision=10,scale=0)
	public java.lang.Integer getTotalnum(){
		return this.totalnum;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  totalnum
	 */
	public void setTotalnum(java.lang.Integer totalnum){
		this.totalnum = totalnum;
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
	 *@return: java.lang.String  amountbig
	 */
	@Column(name ="AMOUNTBIG",nullable=true,length=64)
	public java.lang.String getAmountbig(){
		return this.amountbig;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  amountbig
	 */
	public void setAmountbig(java.lang.String amountbig){
		this.amountbig = amountbig;
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
}
