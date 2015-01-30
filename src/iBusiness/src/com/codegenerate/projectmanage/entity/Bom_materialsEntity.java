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
 * @Description: 原料BOM分解表页面
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_BOM_MATERIALS")
public class Bom_materialsEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**comments*/
	private java.lang.String comments;
	/**id*/
	private java.lang.String id;
	/**materialname*/
	private java.lang.String materialname;
	/**materialno*/
	private java.lang.String materialno;
	/**materialnum*/
	private java.lang.String materialnum;
	/**materialprice*/
	private java.lang.Double materialprice;
	/**materialtypeno*/
	private java.lang.String materialtypeno;
	/**materialunit*/
	private java.lang.String materialunit;
	/**model*/
	private java.lang.String model;
	/**parentid*/
	private java.lang.String parentid;
	/**stocktype*/
	private java.lang.String stocktype;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  comments
	 */
	@Column(name ="COMMENTS",nullable=true,length=512)
	public java.lang.String getComments(){
		return this.comments;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  comments
	 */
	public void setComments(java.lang.String comments){
		this.comments = comments;
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
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  materialprice
	 */
	@Column(name ="MATERIALPRICE",nullable=true,precision=12,scale=2)
	public java.lang.Double getMaterialprice(){
		return this.materialprice;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  materialprice
	 */
	public void setMaterialprice(java.lang.Double materialprice){
		this.materialprice = materialprice;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  materialtypeno
	 */
	@Column(name ="MATERIALTYPENO",nullable=true,length=64)
	public java.lang.String getMaterialtypeno(){
		return this.materialtypeno;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  materialtypeno
	 */
	public void setMaterialtypeno(java.lang.String materialtypeno){
		this.materialtypeno = materialtypeno;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  materialunit
	 */
	@Column(name ="MATERIALUNIT",nullable=true,length=8)
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
	 *@return: java.lang.String  stocktype
	 */
	@Column(name ="STOCKTYPE",nullable=true,length=16)
	public java.lang.String getStocktype(){
		return this.stocktype;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  stocktype
	 */
	public void setStocktype(java.lang.String stocktype){
		this.stocktype = stocktype;
	}
}
