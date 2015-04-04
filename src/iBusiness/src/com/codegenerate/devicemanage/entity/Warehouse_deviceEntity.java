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
 * @Description: 设备库存管理表页面
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_WAREHOUSE_DEVICE")
public class Warehouse_deviceEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**devicetypeno*/
	private java.lang.String devicetypeno;
	/**deviceno*/
	private java.lang.String deviceno;
	/**devicename*/
	private java.lang.String devicename;
	/**devicemodel*/
	private java.lang.String devicemodel;
	/**deviceprice*/
	private java.lang.Double deviceprice;
	/**deviceunit*/
	private java.lang.String deviceunit;
	/**devicenum*/
	private java.lang.Integer devicenum;
	/**warehouseno*/
	private java.lang.String warehouseno;
	/**warehousename*/
	private java.lang.String warehousename;
	/**id*/
	private java.lang.String id;
	/**scopeid*/
	private java.lang.String scopeid;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  devicetypeno
	 */
	@Column(name ="DEVICETYPENO",nullable=true,length=64)
	public java.lang.String getDevicetypeno(){
		return this.devicetypeno;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  devicetypeno
	 */
	public void setDevicetypeno(java.lang.String devicetypeno){
		this.devicetypeno = devicetypeno;
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
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  deviceprice
	 */
	@Column(name ="DEVICEPRICE",nullable=true,precision=12,scale=2)
	public java.lang.Double getDeviceprice(){
		return this.deviceprice;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  deviceprice
	 */
	public void setDeviceprice(java.lang.Double deviceprice){
		this.deviceprice = deviceprice;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  deviceunit
	 */
	@Column(name ="DEVICEUNIT",nullable=true,length=8)
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
	@Column(name ="WAREHOUSENAME",nullable=true,length=128)
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
