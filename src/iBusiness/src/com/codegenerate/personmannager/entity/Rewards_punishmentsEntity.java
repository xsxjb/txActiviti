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
 * @Description: 奖惩记录页面
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_REWARDS_PUNISHMENTS")
public class Rewards_punishmentsEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**name*/
	private java.lang.String name;
	/**date*/
	private java.util.Date date;
	/**type*/
	private java.lang.String type;
	/**num*/
	private java.lang.Integer num;
	/**salary*/
	private java.lang.Integer salary;
	/**assess*/
	private java.lang.Integer assess;
	/**motionman*/
	private java.lang.String motionman;
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
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  date
	 */
	@Column(name ="DATE",nullable=true)
	public java.util.Date getDate(){
		return this.date;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  date
	 */
	public void setDate(java.util.Date date){
		this.date = date;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  type
	 */
	@Column(name ="TYPE",nullable=true,length=32)
	public java.lang.String getType(){
		return this.type;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  type
	 */
	public void setType(java.lang.String type){
		this.type = type;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  num
	 */
	@Column(name ="NUM",nullable=true,precision=10,scale=0)
	public java.lang.Integer getNum(){
		return this.num;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  num
	 */
	public void setNum(java.lang.Integer num){
		this.num = num;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  salary
	 */
	@Column(name ="SALARY",nullable=true,precision=10,scale=0)
	public java.lang.Integer getSalary(){
		return this.salary;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  salary
	 */
	public void setSalary(java.lang.Integer salary){
		this.salary = salary;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  assess
	 */
	@Column(name ="ASSESS",nullable=true,precision=10,scale=0)
	public java.lang.Integer getAssess(){
		return this.assess;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  assess
	 */
	public void setAssess(java.lang.Integer assess){
		this.assess = assess;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  motionman
	 */
	@Column(name ="MOTIONMAN",nullable=true,length=32)
	public java.lang.String getMotionman(){
		return this.motionman;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  motionman
	 */
	public void setMotionman(java.lang.String motionman){
		this.motionman = motionman;
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
