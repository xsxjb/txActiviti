package com.codegenerate.designmanage.entity;

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
 * @Description: 合同管理页面
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_CONTRACT_MANAGE")
public class Contract_manageEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**contractname*/
	private java.lang.String contractname;
	/**customername*/
	private java.lang.String customername;
	/**projectname*/
	private java.lang.String projectname;
	/**contracturl*/
	private java.lang.String contracturl;
	/**address*/
	private java.lang.String address;
	/**customerphone*/
	private java.lang.String customerphone;
	/**remark*/
	private java.lang.String remark;
	/**id*/
	private java.lang.String id;
	/**scopeid*/
	private java.lang.String scopeid;
	/**typeflag*/
	private java.lang.String typeflag;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  contractname
	 */
	@Column(name ="CONTRACTNAME",nullable=true,length=64)
	public java.lang.String getContractname(){
		return this.contractname;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  contractname
	 */
	public void setContractname(java.lang.String contractname){
		this.contractname = contractname;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  customername
	 */
	@Column(name ="CUSTOMERNAME",nullable=true,length=64)
	public java.lang.String getCustomername(){
		return this.customername;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  customername
	 */
	public void setCustomername(java.lang.String customername){
		this.customername = customername;
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
	 *@return: java.lang.String  contracturl
	 */
	@Column(name ="CONTRACTURL",nullable=true,length=256)
	public java.lang.String getContracturl(){
		return this.contracturl;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  contracturl
	 */
	public void setContracturl(java.lang.String contracturl){
		this.contracturl = contracturl;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  address
	 */
	@Column(name ="ADDRESS",nullable=true,length=128)
	public java.lang.String getAddress(){
		return this.address;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  address
	 */
	public void setAddress(java.lang.String address){
		this.address = address;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  customerphone
	 */
	@Column(name ="CUSTOMERPHONE",nullable=true,length=16)
	public java.lang.String getCustomerphone(){
		return this.customerphone;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  customerphone
	 */
	public void setCustomerphone(java.lang.String customerphone){
		this.customerphone = customerphone;
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
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  typeflag
	 */
	@Column(name ="TYPEFLAG",nullable=true,length=8)
	public java.lang.String getTypeflag(){
		return this.typeflag;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  typeflag
	 */
	public void setTypeflag(java.lang.String typeflag){
		this.typeflag = typeflag;
	}
}
