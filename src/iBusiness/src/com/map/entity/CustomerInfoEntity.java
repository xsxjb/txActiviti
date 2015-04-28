package com.map.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**   
 * 客户信息表
 * 
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_CUSTOMER_INFO")
public class CustomerInfoEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**id*/
	private java.lang.String id;
	/**customerno*/
	private java.lang.String customerno;
	/**customerstate*/
	private java.lang.String customerstate;
	/**customername*/
	private java.lang.String customername;
	/**customeraddress*/
	private java.lang.String customeraddress;
	/**phone*/
	private java.lang.String phone;
	/**telephone*/
	private java.lang.String telephone;
	/**salesmanager*/
	private java.lang.String salesmanager;
	/**infosource*/
	private java.lang.String infosource;
	/**province*/
	private java.lang.String province;
	/**city*/
	private java.lang.String city;
	
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
	 *@return: java.lang.String  customerno
	 */
	@Column(name ="CUSTOMERNO",nullable=true,length=64)
	public java.lang.String getCustomerno(){
		return this.customerno;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  customerno
	 */
	public void setCustomerno(java.lang.String customerno){
		this.customerno = customerno;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  customerstate
	 */
	@Column(name ="CUSTOMERSTATE",nullable=true,length=16)
	public java.lang.String getCustomerstate(){
		return this.customerstate;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  customerstate
	 */
	public void setCustomerstate(java.lang.String customerstate){
		this.customerstate = customerstate;
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
	 *@return: java.lang.String  customeraddress
	 */
	@Column(name ="CUSTOMERADDRESS",nullable=true,length=512)
	public java.lang.String getCustomeraddress(){
		return this.customeraddress;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  customeraddress
	 */
	public void setCustomeraddress(java.lang.String customeraddress){
		this.customeraddress = customeraddress;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  phone
	 */
	@Column(name ="PHONE",nullable=true,length=32)
	public java.lang.String getPhone(){
		return this.phone;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  phone
	 */
	public void setPhone(java.lang.String phone){
		this.phone = phone;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  telephone
	 */
	@Column(name ="TELEPHONE",nullable=true,length=32)
	public java.lang.String getTelephone(){
		return this.telephone;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  telephone
	 */
	public void setTelephone(java.lang.String telephone){
		this.telephone = telephone;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  salesmanager
	 */
	@Column(name ="SALESMANAGER",nullable=true,length=32)
	public java.lang.String getSalesmanager(){
		return this.salesmanager;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  salesmanager
	 */
	public void setSalesmanager(java.lang.String salesmanager){
		this.salesmanager = salesmanager;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  infosource
	 */
	@Column(name ="INFOSOURCE",nullable=true,length=16)
	public java.lang.String getInfosource(){
		return this.infosource;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  infosource
	 */
	public void setInfosource(java.lang.String infosource){
		this.infosource = infosource;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  province
	 */
	@Column(name ="PROVINCE",nullable=true,length=16)
	public java.lang.String getProvince(){
		return this.province;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  province
	 */
	public void setProvince(java.lang.String province){
		this.province = province;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  city
	 */
	@Column(name ="CITY",nullable=true,length=16)
	public java.lang.String getCity(){
		return this.city;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  city
	 */
	public void setCity(java.lang.String city){
		this.city = city;
	}
}
