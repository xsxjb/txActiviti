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
 * @Description: 考核记录页面
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_ASSESS_RECORD")
public class Assess_recordEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**name*/
	private java.lang.String name;
	/**checktime*/
	private java.util.Date checktime;
	/**job*/
	private java.lang.String job;
	/**checkproject*/
	private java.lang.String checkproject;
	/**checkrank*/
	private java.lang.String checkrank;
	/**checkscore*/
	private java.lang.Integer checkscore;
	/**checkassess*/
	private java.lang.String checkassess;
	/**checker*/
	private java.lang.String checker;
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
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  checktime
	 */
	@Column(name ="CHECKTIME",nullable=true)
	public java.util.Date getChecktime(){
		return this.checktime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  checktime
	 */
	public void setChecktime(java.util.Date checktime){
		this.checktime = checktime;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  job
	 */
	@Column(name ="JOB",nullable=true,length=32)
	public java.lang.String getJob(){
		return this.job;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  job
	 */
	public void setJob(java.lang.String job){
		this.job = job;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  checkproject
	 */
	@Column(name ="CHECKPROJECT",nullable=true,length=32)
	public java.lang.String getCheckproject(){
		return this.checkproject;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  checkproject
	 */
	public void setCheckproject(java.lang.String checkproject){
		this.checkproject = checkproject;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  checkrank
	 */
	@Column(name ="CHECKRANK",nullable=true,length=32)
	public java.lang.String getCheckrank(){
		return this.checkrank;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  checkrank
	 */
	public void setCheckrank(java.lang.String checkrank){
		this.checkrank = checkrank;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  checkscore
	 */
	@Column(name ="CHECKSCORE",nullable=true,precision=10,scale=0)
	public java.lang.Integer getCheckscore(){
		return this.checkscore;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  checkscore
	 */
	public void setCheckscore(java.lang.Integer checkscore){
		this.checkscore = checkscore;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  checkassess
	 */
	@Column(name ="CHECKASSESS",nullable=true,length=32)
	public java.lang.String getCheckassess(){
		return this.checkassess;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  checkassess
	 */
	public void setCheckassess(java.lang.String checkassess){
		this.checkassess = checkassess;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  checker
	 */
	@Column(name ="CHECKER",nullable=true,length=32)
	public java.lang.String getChecker(){
		return this.checker;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  checker
	 */
	public void setChecker(java.lang.String checker){
		this.checker = checker;
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
