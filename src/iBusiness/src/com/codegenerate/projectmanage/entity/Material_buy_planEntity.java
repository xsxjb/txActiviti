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
 * @Description: 材料采购计划申请表
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_MATERIAL_BUY_PLAN")
public class Material_buy_planEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**materialno*/
	private java.lang.String materialno;
	/**materialname*/
	private java.lang.String materialname;
	/**model*/
	private java.lang.String model;
	/**materialnum*/
	private java.lang.String materialnum;
	/**deliverydate*/
	private java.util.Date deliverydate;
	/**id*/
	private java.lang.String id;
	/**parentid*/
	private java.lang.String parentid;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  materialno
	 */
	@Column(name ="MATERIALNO",nullable=true,length=64)
	public java.lang.String getMaterialno(){
		return this.materialno;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  materialno
	 */
	public void setMaterialno(java.lang.String materialno){
		this.materialno = materialno;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  materialname
	 */
	@Column(name ="MATERIALNAME",nullable=true,length=128)
	public java.lang.String getMaterialname(){
		return this.materialname;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  materialname
	 */
	public void setMaterialname(java.lang.String materialname){
		this.materialname = materialname;
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
	 *@return: java.lang.String  materialnum
	 */
	@Column(name ="MATERIALNUM",nullable=true,length=10)
	public java.lang.String getMaterialnum(){
		return this.materialnum;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  materialnum
	 */
	public void setMaterialnum(java.lang.String materialnum){
		this.materialnum = materialnum;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  deliverydate
	 */
	@Column(name ="DELIVERYDATE",nullable=true)
	public java.util.Date getDeliverydate(){
		return this.deliverydate;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  deliverydate
	 */
	public void setDeliverydate(java.util.Date deliverydate){
		this.deliverydate = deliverydate;
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
}
