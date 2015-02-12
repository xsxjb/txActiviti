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
 * @Description: 复职登记页面
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_PERSON_REMOVE")
public class Person_removeEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**name*/
	private java.lang.String name;
	/**beforesection*/
	private java.lang.String beforesection;
	/**beforjob*/
	private java.lang.String beforjob;
	/**resumedate*/
	private java.util.Date resumedate;
	/**salarystandard*/
	private java.lang.Integer salarystandard;
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
	 *@return: java.lang.String  beforesection
	 */
	@Column(name ="BEFORESECTION",nullable=true,length=32)
	public java.lang.String getBeforesection(){
		return this.beforesection;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  beforesection
	 */
	public void setBeforesection(java.lang.String beforesection){
		this.beforesection = beforesection;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  beforjob
	 */
	@Column(name ="BEFORJOB",nullable=true,length=32)
	public java.lang.String getBeforjob(){
		return this.beforjob;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  beforjob
	 */
	public void setBeforjob(java.lang.String beforjob){
		this.beforjob = beforjob;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  resumedate
	 */
	@Column(name ="RESUMEDATE",nullable=true)
	public java.util.Date getResumedate(){
		return this.resumedate;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  resumedate
	 */
	public void setResumedate(java.util.Date resumedate){
		this.resumedate = resumedate;
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
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  remark
	 */
	@Column(name ="REMARK",nullable=true,length=128)
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
