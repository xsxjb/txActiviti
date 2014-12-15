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
 * @Description: 作废产品原料清单
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_MATERIAL_WASTE")
public class Material_wasteEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**materialno*/
	private java.lang.String materialno;
	/**materialname*/
	private java.lang.String materialname;
	/**model*/
	private java.lang.String model;
	/**materialnum*/
	private java.lang.Integer materialnum;
	/**currentstatus*/
	private java.lang.String currentstatus;
	/**processingresults*/
	private java.lang.String processingresults;
	/**id*/
	private java.lang.String id;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  materialno
	 */
	@Column(name ="MATERIALNO",nullable=true,length=32)
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
	@Column(name ="MATERIALNAME",nullable=true,length=64)
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
	@Column(name ="MODEL",nullable=true,length=32)
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
	 *@return: java.lang.String  currentstatus
	 */
	@Column(name ="CURRENTSTATUS",nullable=true,length=10)
	public java.lang.String getCurrentstatus(){
		return this.currentstatus;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  currentstatus
	 */
	public void setCurrentstatus(java.lang.String currentstatus){
		this.currentstatus = currentstatus;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  processingresults
	 */
	@Column(name ="PROCESSINGRESULTS",nullable=true,length=512)
	public java.lang.String getProcessingresults(){
		return this.processingresults;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  processingresults
	 */
	public void setProcessingresults(java.lang.String processingresults){
		this.processingresults = processingresults;
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
}
