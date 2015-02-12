package com.codegenerate.personmannager.entity;

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
 * @Description: 人员就职页面
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_PERSON_JOB_INFO")
public class Person_job_infoEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**name*/
	private java.lang.String name;
	/**department*/
	private java.lang.String department;
	/**post*/
	private java.lang.String post;
	/**posttitle*/
	private java.lang.String posttitle;
	/**obtaindate*/
	private java.util.Date obtaindate;
	/**identity*/
	private java.lang.String identity;
	/**adminlevel*/
	private java.lang.String adminlevel;
	/**salarystandard*/
	private java.lang.Integer salarystandard;
	/**enterdate*/
	private java.util.Date enterdate;
	/**remark*/
	private java.lang.String remark;
	/**id*/
	private java.lang.String id;
	/**scopeid*/
	private java.lang.String scopeid;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  name
	 */
	@Column(name ="NAME",nullable=true,length=32)
	public java.lang.String getName(){
		return this.name;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  name
	 */
	public void setName(java.lang.String name){
		this.name = name;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  department
	 */
	@Column(name ="DEPARTMENT",nullable=true,length=32)
	public java.lang.String getDepartment(){
		return this.department;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  department
	 */
	public void setDepartment(java.lang.String department){
		this.department = department;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  post
	 */
	@Column(name ="POST",nullable=true,length=32)
	public java.lang.String getPost(){
		return this.post;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  post
	 */
	public void setPost(java.lang.String post){
		this.post = post;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  posttitle
	 */
	@Column(name ="POSTTITLE",nullable=true,length=32)
	public java.lang.String getPosttitle(){
		return this.posttitle;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  posttitle
	 */
	public void setPosttitle(java.lang.String posttitle){
		this.posttitle = posttitle;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  obtaindate
	 */
	@Column(name ="OBTAINDATE",nullable=true)
	public java.util.Date getObtaindate(){
		return this.obtaindate;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  obtaindate
	 */
	public void setObtaindate(java.util.Date obtaindate){
		this.obtaindate = obtaindate;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  identity
	 */
	@Column(name ="IDENTITY",nullable=true,length=32)
	public java.lang.String getIdentity(){
		return this.identity;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  identity
	 */
	public void setIdentity(java.lang.String identity){
		this.identity = identity;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  adminlevel
	 */
	@Column(name ="ADMINLEVEL",nullable=true,length=32)
	public java.lang.String getAdminlevel(){
		return this.adminlevel;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  adminlevel
	 */
	public void setAdminlevel(java.lang.String adminlevel){
		this.adminlevel = adminlevel;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  salarystandard
	 */
	@Column(name ="SALARYSTANDARD",nullable=true,precision=10,scale=0)
	public java.lang.Integer getSalarystandard(){
		return this.salarystandard;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  salarystandard
	 */
	public void setSalarystandard(java.lang.Integer salarystandard){
		this.salarystandard = salarystandard;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  enterdate
	 */
	@Column(name ="ENTERDATE",nullable=true)
	public java.util.Date getEnterdate(){
		return this.enterdate;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  enterdate
	 */
	public void setEnterdate(java.util.Date enterdate){
		this.enterdate = enterdate;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  remark
	 */
	@Column(name ="REMARK",nullable=true,length=32)
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
