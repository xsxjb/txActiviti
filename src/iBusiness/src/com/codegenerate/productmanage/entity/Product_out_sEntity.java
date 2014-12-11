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
 * @Description:  项目出库申请表
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_PRODUCT_OUT_S")
public class Product_out_sEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**id*/
	private java.lang.String id;
	/**parentid*/
	private java.lang.String parentid;
	/**batchno*/
	private java.lang.String batchno;
	/**stationname*/
	private java.lang.String stationname;
	/**productflowid*/
	private java.lang.String productflowid;
	/**productno*/
	private java.lang.String productno;
	/**productname*/
	private java.lang.String productname;
	/**modeltype*/
	private java.lang.String modeltype;
	/**unit*/
	private java.lang.String unit;
	/**sizes*/
	private java.lang.String sizes;
	/**deliverydate*/
	private java.util.Date deliverydate;
	/**materialnum*/
	private java.lang.Integer materialnum;
	/**unitprice*/
	private java.util.Date unitprice;
	/**price*/
	private java.util.Date price;
	/**outtype*/
	private java.lang.String outtype;
	/**goodsaddress*/
	private java.lang.String goodsaddress;
	
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
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  batchno
	 */
	@Column(name ="BATCHNO",nullable=true,length=32)
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
	 *@return: java.lang.String  stationname
	 */
	@Column(name ="STATIONNAME",nullable=true,length=128)
	public java.lang.String getStationname(){
		return this.stationname;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  stationname
	 */
	public void setStationname(java.lang.String stationname){
		this.stationname = stationname;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  productflowid
	 */
	@Column(name ="PRODUCTFLOWID",nullable=true,length=64)
	public java.lang.String getProductflowid(){
		return this.productflowid;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  productflowid
	 */
	public void setProductflowid(java.lang.String productflowid){
		this.productflowid = productflowid;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  productno
	 */
	@Column(name ="PRODUCTNO",nullable=true,length=32)
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
	@Column(name ="PRODUCTNAME",nullable=true,length=64)
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
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  modeltype
	 */
	@Column(name ="MODELTYPE",nullable=true,length=128)
	public java.lang.String getModeltype(){
		return this.modeltype;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  modeltype
	 */
	public void setModeltype(java.lang.String modeltype){
		this.modeltype = modeltype;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  unit
	 */
	@Column(name ="UNIT",nullable=true,length=64)
	public java.lang.String getUnit(){
		return this.unit;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  unit
	 */
	public void setUnit(java.lang.String unit){
		this.unit = unit;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  sizes
	 */
	@Column(name ="SIZES",nullable=true,length=64)
	public java.lang.String getSizes(){
		return this.sizes;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  sizes
	 */
	public void setSizes(java.lang.String sizes){
		this.sizes = sizes;
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
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  unitprice
	 */
	@Column(name ="UNITPRICE",nullable=true)
	public java.util.Date getUnitprice(){
		return this.unitprice;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  unitprice
	 */
	public void setUnitprice(java.util.Date unitprice){
		this.unitprice = unitprice;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  price
	 */
	@Column(name ="PRICE",nullable=true)
	public java.util.Date getPrice(){
		return this.price;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  price
	 */
	public void setPrice(java.util.Date price){
		this.price = price;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  outtype
	 */
	@Column(name ="OUTTYPE",nullable=true,length=32)
	public java.lang.String getOuttype(){
		return this.outtype;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  outtype
	 */
	public void setOuttype(java.lang.String outtype){
		this.outtype = outtype;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  goodsaddress
	 */
	@Column(name ="GOODSADDRESS",nullable=true,length=64)
	public java.lang.String getGoodsaddress(){
		return this.goodsaddress;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  goodsaddress
	 */
	public void setGoodsaddress(java.lang.String goodsaddress){
		this.goodsaddress = goodsaddress;
	}
}
