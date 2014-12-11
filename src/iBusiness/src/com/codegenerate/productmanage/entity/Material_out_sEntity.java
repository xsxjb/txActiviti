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
@Table(name = "IB_MATERIAL_OUT_S")
public class Material_out_sEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**id*/
	private java.lang.String id;
	/**parentid*/
	private java.lang.String parentid;
	/**materialno*/
	private java.lang.String materialno;
	/**materialname*/
	private java.lang.String materialname;
	/**materialmodel*/
	private java.lang.String materialmodel;
	/**materialunit*/
	private java.lang.String materialunit;
	/**materialnum*/
	private java.lang.Integer materialnum;
	/**manufacturename*/
	private java.lang.String manufacturename;
	/**remark*/
	private java.lang.String remark;
	
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
	 *@return: java.lang.String  materialmodel
	 */
	@Column(name ="MATERIALMODEL",nullable=true,length=64)
	public java.lang.String getMaterialmodel(){
		return this.materialmodel;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  materialmodel
	 */
	public void setMaterialmodel(java.lang.String materialmodel){
		this.materialmodel = materialmodel;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  materialunit
	 */
	@Column(name ="MATERIALUNIT",nullable=true,length=16)
	public java.lang.String getMaterialunit(){
		return this.materialunit;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  materialunit
	 */
	public void setMaterialunit(java.lang.String materialunit){
		this.materialunit = materialunit;
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
