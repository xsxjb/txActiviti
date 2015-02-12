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
 * @Description: 人员调动页面
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_PERSON_MOVE")
public class Person_moveEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**name*/
	private java.lang.String name;
	/**category*/
	private java.lang.String category;
	/**beforesection*/
	private java.lang.String beforesection;
	/**nowsection*/
	private java.lang.String nowsection;
	/**beforejob*/
	private java.lang.String beforejob;
	/**nowjob*/
	private java.lang.String nowjob;
	/**oldstandard*/
	private java.lang.Integer oldstandard;
	/**newstandard*/
	private java.lang.Integer newstandard;
	/**movedate*/
	private java.util.Date movedate;
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
	 *@return: java.lang.String  category
	 */
	@Column(name ="CATEGORY",nullable=true,length=32)
	public java.lang.String getCategory(){
		return this.category;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  category
	 */
	public void setCategory(java.lang.String category){
		this.category = category;
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
	 *@return: java.lang.String  nowsection
	 */
	@Column(name ="NOWSECTION",nullable=true,length=32)
	public java.lang.String getNowsection(){
		return this.nowsection;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  nowsection
	 */
	public void setNowsection(java.lang.String nowsection){
		this.nowsection = nowsection;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  beforejob
	 */
	@Column(name ="BEFOREJOB",nullable=true,length=32)
	public java.lang.String getBeforejob(){
		return this.beforejob;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  beforejob
	 */
	public void setBeforejob(java.lang.String beforejob){
		this.beforejob = beforejob;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  nowjob
	 */
	@Column(name ="NOWJOB",nullable=true,length=32)
	public java.lang.String getNowjob(){
		return this.nowjob;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  nowjob
	 */
	public void setNowjob(java.lang.String nowjob){
		this.nowjob = nowjob;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  oldstandard
	 */
	@Column(name ="OLDSTANDARD",nullable=true,precision=10,scale=0)
	public java.lang.Integer getOldstandard(){
		return this.oldstandard;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  oldstandard
	 */
	public void setOldstandard(java.lang.Integer oldstandard){
		this.oldstandard = oldstandard;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  newstandard
	 */
	@Column(name ="NEWSTANDARD",nullable=true,precision=10,scale=0)
	public java.lang.Integer getNewstandard(){
		return this.newstandard;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  newstandard
	 */
	public void setNewstandard(java.lang.Integer newstandard){
		this.newstandard = newstandard;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  movedate
	 */
	@Column(name ="MOVEDATE",nullable=true)
	public java.util.Date getMovedate(){
		return this.movedate;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  movedate
	 */
	public void setMovedate(java.util.Date movedate){
		this.movedate = movedate;
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
