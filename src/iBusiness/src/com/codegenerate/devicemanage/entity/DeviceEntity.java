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
 * @Description: 设备表页面
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_DEVICE")
public class DeviceEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**deviceno*/
	private java.lang.String deviceno;
	/**devicename*/
	private java.lang.String devicename;
	/**deviceprice*/
	private java.lang.Double deviceprice;
	/**devicetypeno*/
	private java.lang.String devicetypeno;
	/**deviceunit*/
	private java.lang.String deviceunit;
	/**model*/
	private java.lang.String model;
	/**id*/
	private java.lang.String id;
	/**scopeid*/
	private java.lang.String scopeid;
	
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
	@Column(name ="DEVICENAME",nullable=true,length=64)
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
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  model
	 */
	@Column(name ="MODEL",nullable=true,length=64)
	public java.lang.String getModel(){
		return this.model;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  model
	 */
	public void setModel(java.lang.String model){
		this.model = model;
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
