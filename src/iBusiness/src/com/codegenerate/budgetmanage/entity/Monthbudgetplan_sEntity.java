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
 * @Description: 经营预算月计划表流程
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_MONTHBUDGETPLAN_S")
public class Monthbudgetplan_sEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**id*/
	private java.lang.String id;
	/**parentid*/
	private java.lang.String parentid;
	/**planyear*/
	private java.lang.String planyear;
	/**planmonth*/
	private java.lang.String planmonth;
	/**projecttype*/
	private java.lang.String projecttype;
	/**projectname*/
	private java.lang.String projectname;
	/**materialtype*/
	private java.lang.String materialtype;
	/**materialname*/
	private java.lang.String materialname;
	/**materialspec*/
	private java.lang.String materialspec;
	/**materialunit*/
	private java.lang.String materialunit;
	/**materialprice*/
	private java.lang.Double materialprice;
	/**materialnum*/
	private java.lang.Integer materialnum;
	/**yearplanamount*/
	private java.lang.Double yearplanamount;
	/**planamount*/
	private java.lang.Double planamount;
	/**deptname*/
	private java.lang.String deptname;
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
	 *@return: java.lang.String  planyear
	 */
	@Column(name ="PLANYEAR",nullable=true,length=32)
	public java.lang.String getPlanyear(){
		return this.planyear;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  planyear
	 */
	public void setPlanyear(java.lang.String planyear){
		this.planyear = planyear;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  planmonth
	 */
	@Column(name ="PLANMONTH",nullable=true,length=8)
	public java.lang.String getPlanmonth(){
		return this.planmonth;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  planmonth
	 */
	public void setPlanmonth(java.lang.String planmonth){
		this.planmonth = planmonth;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  projecttype
	 */
	@Column(name ="PROJECTTYPE",nullable=true,length=64)
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
	@Column(name ="PROJECTNAME",nullable=true,length=64)
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
	@Column(name ="MATERIALTYPE",nullable=true,length=64)
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
	 *@return: java.lang.String  materialspec
	 */
	@Column(name ="MATERIALSPEC",nullable=true,length=64)
	public java.lang.String getMaterialspec(){
		return this.materialspec;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  materialspec
	 */
	public void setMaterialspec(java.lang.String materialspec){
		this.materialspec = materialspec;
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
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  yearplanamount
	 */
	@Column(name ="YEARPLANAMOUNT",nullable=true,precision=12,scale=2)
	public java.lang.Double getYearplanamount(){
		return this.yearplanamount;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  yearplanamount
	 */
	public void setYearplanamount(java.lang.Double yearplanamount){
		this.yearplanamount = yearplanamount;
	}
	/**
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  planamount
	 */
	@Column(name ="PLANAMOUNT",nullable=true,precision=12,scale=2)
	public java.lang.Double getPlanamount(){
		return this.planamount;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  planamount
	 */
	public void setPlanamount(java.lang.Double planamount){
		this.planamount = planamount;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  deptname
	 */
	@Column(name ="DEPTNAME",nullable=true,length=64)
	public java.lang.String getDeptname(){
		return this.deptname;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  deptname
	 */
	public void setDeptname(java.lang.String deptname){
		this.deptname = deptname;
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
