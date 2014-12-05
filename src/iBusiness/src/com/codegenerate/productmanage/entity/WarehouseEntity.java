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
 * @Description: 仓库信息
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_WAREHOUSE")
public class WarehouseEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**id*/
	private java.lang.String id;
	/**warehouseno*/
	private java.lang.String warehouseno;
	/**warehousename*/
	private java.lang.String warehousename;
	/**warehouselocation*/
	private java.lang.String warehouselocation;
	
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
	 *@return: java.lang.String  warehouselocation
	 */
	@Column(name ="WAREHOUSELOCATION",nullable=true,length=128)
	public java.lang.String getWarehouselocation(){
		return this.warehouselocation;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  warehouselocation
	 */
	public void setWarehouselocation(java.lang.String warehouselocation){
		this.warehouselocation = warehouselocation;
	}
}
