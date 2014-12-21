package com.codegenerate.budgetmanage.entity;

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
 * @Description: 经营预算年度计划申报表流程
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_OPERATBUDGETPLAN_S")
public class Operatbudgetplan_sEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**projecttype*/
	private java.lang.String projecttype;
	/**projectname*/
	private java.lang.String projectname;
	/**materialtype*/
	private java.lang.String materialtype;
	/**materialname*/
	private java.lang.String materialname;
	/**spec*/
	private java.lang.String spec;
	/**unit*/
	private java.lang.String unit;
	/**price*/
	private java.lang.Double price;
	/**numb*/
	private java.lang.Integer numb;
	/**planamounts*/
	private java.lang.Double planamounts;
	/**reason*/
	private java.lang.String reason;
	/**info*/
	private java.lang.String info;
	/**dept*/
	private java.lang.String dept;
	/**remark*/
	private java.lang.String remark;
	/**id*/
	private java.lang.String id;
	/**parentid*/
	private java.lang.String parentid;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  projecttype
	 */
	@Column(name ="PROJECTTYPE",nullable=true,length=128)
	public java.lang.String getProjecttype(){
		return this.projecttype;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  projecttype
	 */
	public void setProjecttype(java.lang.String projecttype){
		this.projecttype = projecttype;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  projectname
	 */
	@Column(name ="PROJECTNAME",nullable=true,length=256)
	public java.lang.String getProjectname(){
		return this.projectname;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  projectname
	 */
	public void setProjectname(java.lang.String projectname){
		this.projectname = projectname;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  materialtype
	 */
	@Column(name ="MATERIALTYPE",nullable=true,length=128)
	public java.lang.String getMaterialtype(){
		return this.materialtype;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  materialtype
	 */
	public void setMaterialtype(java.lang.String materialtype){
		this.materialtype = materialtype;
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
	 *@return: java.lang.String  spec
	 */
	@Column(name ="SPEC",nullable=true,length=64)
	public java.lang.String getSpec(){
		return this.spec;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  spec
	 */
	public void setSpec(java.lang.String spec){
		this.spec = spec;
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
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  price
	 */
	@Column(name ="PRICE",nullable=true,precision=12,scale=2)
	public java.lang.Double getPrice(){
		return this.price;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  price
	 */
	public void setPrice(java.lang.Double price){
		this.price = price;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  numb
	 */
	@Column(name ="NUMB",nullable=true,precision=10,scale=0)
	public java.lang.Integer getNumb(){
		return this.numb;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  numb
	 */
	public void setNumb(java.lang.Integer numb){
		this.numb = numb;
	}
	/**
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  planamounts
	 */
	@Column(name ="PLANAMOUNTS",nullable=true,precision=12,scale=2)
	public java.lang.Double getPlanamounts(){
		return this.planamounts;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  planamounts
	 */
	public void setPlanamounts(java.lang.Double planamounts){
		this.planamounts = planamounts;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  reason
	 */
	@Column(name ="REASON",nullable=true,length=128)
	public java.lang.String getReason(){
		return this.reason;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  reason
	 */
	public void setReason(java.lang.String reason){
		this.reason = reason;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  info
	 */
	@Column(name ="INFO",nullable=true,length=512)
	public java.lang.String getInfo(){
		return this.info;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  info
	 */
	public void setInfo(java.lang.String info){
		this.info = info;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  dept
	 */
	@Column(name ="DEPT",nullable=true,length=128)
	public java.lang.String getDept(){
		return this.dept;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  dept
	 */
	public void setDept(java.lang.String dept){
		this.dept = dept;
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
}
