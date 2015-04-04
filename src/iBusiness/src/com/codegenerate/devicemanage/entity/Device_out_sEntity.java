package com.codegenerate.devicemanage.entity;

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
 * @Description: 设备出库表流程
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_DEVICE_OUT_S")
public class Device_out_sEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**id*/
	private java.lang.String id;
	/**parentid*/
	private java.lang.String parentid;
	/**deviceno*/
	private java.lang.String deviceno;
	/**devicename*/
	private java.lang.String devicename;
	/**devicemodel*/
	private java.lang.String devicemodel;
	/**deviceunit*/
	private java.lang.String deviceunit;
	/**devicenum*/
	private java.lang.Integer devicenum;
	/**manufacturename*/
	private java.lang.String manufacturename;
	/**remark*/
	private java.lang.String remark;
	
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
	 *@return: java.lang.String  parentid
	 */
	@Column(name ="PARENTID",nullable=true,length=64)
	public java.lang.String getParentid(){
		return this.parentid;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  parentid
	 */
	public void setParentid(java.lang.String parentid){
		this.parentid = parentid;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  deviceno
	 */
	@Column(name ="DEVICENO",nullable=true,length=64)
	public java.lang.String getDeviceno(){
		return this.deviceno;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  deviceno
	 */
	public void setDeviceno(java.lang.String deviceno){
		this.deviceno = deviceno;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  devicename
	 */
	@Column(name ="DEVICENAME",nullable=true,length=128)
	public java.lang.String getDevicename(){
		return this.devicename;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  devicename
	 */
	public void setDevicename(java.lang.String devicename){
		this.devicename = devicename;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  devicemodel
	 */
	@Column(name ="DEVICEMODEL",nullable=true,length=64)
	public java.lang.String getDevicemodel(){
		return this.devicemodel;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  devicemodel
	 */
	public void setDevicemodel(java.lang.String devicemodel){
		this.devicemodel = devicemodel;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  deviceunit
	 */
	@Column(name ="DEVICEUNIT",nullable=true,length=16)
	public java.lang.String getDeviceunit(){
		return this.deviceunit;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  deviceunit
	 */
	public void setDeviceunit(java.lang.String deviceunit){
		this.deviceunit = deviceunit;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  devicenum
	 */
	@Column(name ="DEVICENUM",nullable=true,precision=10,scale=0)
	public java.lang.Integer getDevicenum(){
		return this.devicenum;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  devicenum
	 */
	public void setDevicenum(java.lang.Integer devicenum){
		this.devicenum = devicenum;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  manufacturename
	 */
	@Column(name ="MANUFACTURENAME",nullable=true,length=64)
	public java.lang.String getManufacturename(){
		return this.manufacturename;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  manufacturename
	 */
	public void setManufacturename(java.lang.String manufacturename){
		this.manufacturename = manufacturename;
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
