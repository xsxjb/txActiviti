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
 * @Description: 经营预算年度数据表页面
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_OPERATBUDGETYEAR")
public class OperatbudgetyearEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**planyear*/
	private java.lang.String planyear;
	/**projecttype*/
	private java.lang.String projecttype;
	/**projectname*/
	private java.lang.String projectname;
	/**changeplanam*/
	private java.lang.Double changeplanam;
	/**addplanamount*/
	private java.lang.Double addplanamount;
	/**planamount*/
	private java.lang.Double planamount;
	/**yearplanbalance*/
	private java.lang.Double yearplanbalance;
	/**amount*/
	private java.lang.Double amount;
	/**dept*/
	private java.lang.String dept;
	/**id*/
	private java.lang.String id;
	
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
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  changeplanam
	 */
	@Column(name ="CHANGEPLANAM",nullable=true,precision=12,scale=2)
	public java.lang.Double getChangeplanam(){
		return this.changeplanam;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  changeplanam
	 */
	public void setChangeplanam(java.lang.Double changeplanam){
		this.changeplanam = changeplanam;
	}
	/**
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  addplanamount
	 */
	@Column(name ="ADDPLANAMOUNT",nullable=true,precision=12,scale=2)
	public java.lang.Double getAddplanamount(){
		return this.addplanamount;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  addplanamount
	 */
	public void setAddplanamount(java.lang.Double addplanamount){
		this.addplanamount = addplanamount;
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
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  yearplanbalance
	 */
	@Column(name ="YEARPLANBALANCE",nullable=true,precision=12,scale=2)
	public java.lang.Double getYearplanbalance(){
		return this.yearplanbalance;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  yearplanbalance
	 */
	public void setYearplanbalance(java.lang.Double yearplanbalance){
		this.yearplanbalance = yearplanbalance;
	}
	/**
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  amount
	 */
	@Column(name ="AMOUNT",nullable=true,precision=12,scale=2)
	public java.lang.Double getAmount(){
		return this.amount;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  amount
	 */
	public void setAmount(java.lang.Double amount){
		this.amount = amount;
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
}
