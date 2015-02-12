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
 * @Description: 工资录入页面
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_SALARY_ENTER")
public class Salary_enterEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**name*/
	private java.lang.String name;
	/**time*/
	private java.util.Date time;
	/**basicsalary*/
	private java.lang.Integer basicsalary;
	/**postsalary*/
	private java.lang.Integer postsalary;
	/**yearssalary*/
	private java.lang.Integer yearssalary;
	/**performancesalary*/
	private java.lang.Integer performancesalary;
	/**awardsalary*/
	private java.lang.Integer awardsalary;
	/**outworksalary*/
	private java.lang.Integer outworksalary;
	/**countssalary*/
	private java.lang.Integer countssalary;
	/**finalamounts*/
	private java.lang.Integer finalamounts;
	/**deductsalary*/
	private java.lang.Integer deductsalary;
	/**premium*/
	private java.lang.Integer premium;
	/**incometax*/
	private java.lang.Integer incometax;
	/**deductamounts*/
	private java.lang.Integer deductamounts;
	/**actualsalary*/
	private java.lang.Integer actualsalary;
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
	 *@return: java.util.Date  time
	 */
	@Column(name ="TIME",nullable=true)
	public java.util.Date getTime(){
		return this.time;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  time
	 */
	public void setTime(java.util.Date time){
		this.time = time;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  basicsalary
	 */
	@Column(name ="BASICSALARY",nullable=true,precision=10,scale=0)
	public java.lang.Integer getBasicsalary(){
		return this.basicsalary;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  basicsalary
	 */
	public void setBasicsalary(java.lang.Integer basicsalary){
		this.basicsalary = basicsalary;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  postsalary
	 */
	@Column(name ="POSTSALARY",nullable=true,precision=10,scale=0)
	public java.lang.Integer getPostsalary(){
		return this.postsalary;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  postsalary
	 */
	public void setPostsalary(java.lang.Integer postsalary){
		this.postsalary = postsalary;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  yearssalary
	 */
	@Column(name ="YEARSSALARY",nullable=true,precision=10,scale=0)
	public java.lang.Integer getYearssalary(){
		return this.yearssalary;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  yearssalary
	 */
	public void setYearssalary(java.lang.Integer yearssalary){
		this.yearssalary = yearssalary;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  performancesalary
	 */
	@Column(name ="PERFORMANCESALARY",nullable=true,precision=10,scale=0)
	public java.lang.Integer getPerformancesalary(){
		return this.performancesalary;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  performancesalary
	 */
	public void setPerformancesalary(java.lang.Integer performancesalary){
		this.performancesalary = performancesalary;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  awardsalary
	 */
	@Column(name ="AWARDSALARY",nullable=true,precision=10,scale=0)
	public java.lang.Integer getAwardsalary(){
		return this.awardsalary;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  awardsalary
	 */
	public void setAwardsalary(java.lang.Integer awardsalary){
		this.awardsalary = awardsalary;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  outworksalary
	 */
	@Column(name ="OUTWORKSALARY",nullable=true,precision=10,scale=0)
	public java.lang.Integer getOutworksalary(){
		return this.outworksalary;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  outworksalary
	 */
	public void setOutworksalary(java.lang.Integer outworksalary){
		this.outworksalary = outworksalary;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  countssalary
	 */
	@Column(name ="COUNTSSALARY",nullable=true,precision=10,scale=0)
	public java.lang.Integer getCountssalary(){
		return this.countssalary;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  countssalary
	 */
	public void setCountssalary(java.lang.Integer countssalary){
		this.countssalary = countssalary;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  finalamounts
	 */
	@Column(name ="FINALAMOUNTS",nullable=true,precision=10,scale=0)
	public java.lang.Integer getFinalamounts(){
		return this.finalamounts;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  finalamounts
	 */
	public void setFinalamounts(java.lang.Integer finalamounts){
		this.finalamounts = finalamounts;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  deductsalary
	 */
	@Column(name ="DEDUCTSALARY",nullable=true,precision=10,scale=0)
	public java.lang.Integer getDeductsalary(){
		return this.deductsalary;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  deductsalary
	 */
	public void setDeductsalary(java.lang.Integer deductsalary){
		this.deductsalary = deductsalary;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  premium
	 */
	@Column(name ="PREMIUM",nullable=true,precision=10,scale=0)
	public java.lang.Integer getPremium(){
		return this.premium;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  premium
	 */
	public void setPremium(java.lang.Integer premium){
		this.premium = premium;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  incometax
	 */
	@Column(name ="INCOMETAX",nullable=true,precision=10,scale=0)
	public java.lang.Integer getIncometax(){
		return this.incometax;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  incometax
	 */
	public void setIncometax(java.lang.Integer incometax){
		this.incometax = incometax;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  deductamounts
	 */
	@Column(name ="DEDUCTAMOUNTS",nullable=true,precision=10,scale=0)
	public java.lang.Integer getDeductamounts(){
		return this.deductamounts;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  deductamounts
	 */
	public void setDeductamounts(java.lang.Integer deductamounts){
		this.deductamounts = deductamounts;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  actualsalary
	 */
	@Column(name ="ACTUALSALARY",nullable=true,precision=10,scale=0)
	public java.lang.Integer getActualsalary(){
		return this.actualsalary;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  actualsalary
	 */
	public void setActualsalary(java.lang.Integer actualsalary){
		this.actualsalary = actualsalary;
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
