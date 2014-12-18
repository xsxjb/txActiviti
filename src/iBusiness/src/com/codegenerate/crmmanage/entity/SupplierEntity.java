package com.codegenerate.crmmanage.entity;

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
 * @Description: 原材料供应商维护页面
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_SUPPLIER")
public class SupplierEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**information*/
	private java.lang.String information;
	/**suppliernumber*/
	private java.lang.String suppliernumber;
	/**category*/
	private java.lang.String category;
	/**unitname*/
	private java.lang.String unitname;
	/**useraddress*/
	private java.lang.String useraddress;
	/**unitcharacter*/
	private java.lang.String unitcharacter;
	/**registered*/
	private java.lang.String registered;
	/**enrolltime*/
	private java.lang.String enrolltime;
	/**url*/
	private java.lang.String url;
	/**companyphone*/
	private java.lang.String companyphone;
	/**companyfax*/
	private java.lang.String companyfax;
	/**product*/
	private java.lang.String product;
	/**userperson*/
	private java.lang.String userperson;
	/**userphone*/
	private java.lang.String userphone;
	/**usermobilephone*/
	private java.lang.String usermobilephone;
	/**userfax*/
	private java.lang.String userfax;
	/**businesscontacts*/
	private java.lang.String businesscontacts;
	/**contacttelephone*/
	private java.lang.String contacttelephone;
	/**contactmobilephone*/
	private java.lang.String contactmobilephone;
	/**contactfax*/
	private java.lang.String contactfax;
	/**financialcontacts*/
	private java.lang.String financialcontacts;
	/**financialcall*/
	private java.lang.String financialcall;
	/**financialphone*/
	private java.lang.String financialphone;
	/**financialfax*/
	private java.lang.String financialfax;
	/**remittancename*/
	private java.lang.String remittancename;
	/**beneficiary*/
	private java.lang.String beneficiary;
	/**taxno*/
	private java.lang.String taxno;
	/**accountno*/
	private java.lang.String accountno;
	/**yourcompany*/
	private java.lang.String yourcompany;
	/**youraddress*/
	private java.lang.String youraddress;
	/**yourname*/
	private java.lang.String yourname;
	/**yourphone*/
	private java.lang.String yourphone;
	/**telephone*/
	private java.lang.String telephone;
	/**estinationcity*/
	private java.lang.String estinationcity;
	/**updatas*/
	private java.lang.String updatas;
	/**id*/
	private java.lang.String id;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  information
	 */
	@Column(name ="INFORMATION",nullable=true,length=32)
	public java.lang.String getInformation(){
		return this.information;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  information
	 */
	public void setInformation(java.lang.String information){
		this.information = information;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  suppliernumber
	 */
	@Column(name ="SUPPLIERNUMBER",nullable=true,length=32)
	public java.lang.String getSuppliernumber(){
		return this.suppliernumber;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  suppliernumber
	 */
	public void setSuppliernumber(java.lang.String suppliernumber){
		this.suppliernumber = suppliernumber;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  category
	 */
	@Column(name ="CATEGORY",nullable=true,length=8)
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
	 *@return: java.lang.String  unitname
	 */
	@Column(name ="UNITNAME",nullable=true,length=128)
	public java.lang.String getUnitname(){
		return this.unitname;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  unitname
	 */
	public void setUnitname(java.lang.String unitname){
		this.unitname = unitname;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  useraddress
	 */
	@Column(name ="USERADDRESS",nullable=true,length=128)
	public java.lang.String getUseraddress(){
		return this.useraddress;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  useraddress
	 */
	public void setUseraddress(java.lang.String useraddress){
		this.useraddress = useraddress;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  unitcharacter
	 */
	@Column(name ="UNITCHARACTER",nullable=true,length=16)
	public java.lang.String getUnitcharacter(){
		return this.unitcharacter;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  unitcharacter
	 */
	public void setUnitcharacter(java.lang.String unitcharacter){
		this.unitcharacter = unitcharacter;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  registered
	 */
	@Column(name ="REGISTERED",nullable=true,length=16)
	public java.lang.String getRegistered(){
		return this.registered;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  registered
	 */
	public void setRegistered(java.lang.String registered){
		this.registered = registered;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  enrolltime
	 */
	@Column(name ="ENROLLTIME",nullable=true,length=16)
	public java.lang.String getEnrolltime(){
		return this.enrolltime;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  enrolltime
	 */
	public void setEnrolltime(java.lang.String enrolltime){
		this.enrolltime = enrolltime;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  url
	 */
	@Column(name ="URL",nullable=true,length=32)
	public java.lang.String getUrl(){
		return this.url;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  url
	 */
	public void setUrl(java.lang.String url){
		this.url = url;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  companyphone
	 */
	@Column(name ="COMPANYPHONE",nullable=true,length=16)
	public java.lang.String getCompanyphone(){
		return this.companyphone;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  companyphone
	 */
	public void setCompanyphone(java.lang.String companyphone){
		this.companyphone = companyphone;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  companyfax
	 */
	@Column(name ="COMPANYFAX",nullable=true,length=16)
	public java.lang.String getCompanyfax(){
		return this.companyfax;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  companyfax
	 */
	public void setCompanyfax(java.lang.String companyfax){
		this.companyfax = companyfax;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  product
	 */
	@Column(name ="PRODUCT",nullable=true,length=32)
	public java.lang.String getProduct(){
		return this.product;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  product
	 */
	public void setProduct(java.lang.String product){
		this.product = product;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  userperson
	 */
	@Column(name ="USERPERSON",nullable=true,length=16)
	public java.lang.String getUserperson(){
		return this.userperson;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  userperson
	 */
	public void setUserperson(java.lang.String userperson){
		this.userperson = userperson;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  userphone
	 */
	@Column(name ="USERPHONE",nullable=true,length=16)
	public java.lang.String getUserphone(){
		return this.userphone;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  userphone
	 */
	public void setUserphone(java.lang.String userphone){
		this.userphone = userphone;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  usermobilephone
	 */
	@Column(name ="USERMOBILEPHONE",nullable=true,length=16)
	public java.lang.String getUsermobilephone(){
		return this.usermobilephone;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  usermobilephone
	 */
	public void setUsermobilephone(java.lang.String usermobilephone){
		this.usermobilephone = usermobilephone;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  userfax
	 */
	@Column(name ="USERFAX",nullable=true,length=16)
	public java.lang.String getUserfax(){
		return this.userfax;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  userfax
	 */
	public void setUserfax(java.lang.String userfax){
		this.userfax = userfax;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  businesscontacts
	 */
	@Column(name ="BUSINESSCONTACTS",nullable=true,length=16)
	public java.lang.String getBusinesscontacts(){
		return this.businesscontacts;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  businesscontacts
	 */
	public void setBusinesscontacts(java.lang.String businesscontacts){
		this.businesscontacts = businesscontacts;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  contacttelephone
	 */
	@Column(name ="CONTACTTELEPHONE",nullable=true,length=16)
	public java.lang.String getContacttelephone(){
		return this.contacttelephone;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  contacttelephone
	 */
	public void setContacttelephone(java.lang.String contacttelephone){
		this.contacttelephone = contacttelephone;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  contactmobilephone
	 */
	@Column(name ="CONTACTMOBILEPHONE",nullable=true,length=16)
	public java.lang.String getContactmobilephone(){
		return this.contactmobilephone;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  contactmobilephone
	 */
	public void setContactmobilephone(java.lang.String contactmobilephone){
		this.contactmobilephone = contactmobilephone;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  contactfax
	 */
	@Column(name ="CONTACTFAX",nullable=true,length=16)
	public java.lang.String getContactfax(){
		return this.contactfax;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  contactfax
	 */
	public void setContactfax(java.lang.String contactfax){
		this.contactfax = contactfax;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  financialcontacts
	 */
	@Column(name ="FINANCIALCONTACTS",nullable=true,length=16)
	public java.lang.String getFinancialcontacts(){
		return this.financialcontacts;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  financialcontacts
	 */
	public void setFinancialcontacts(java.lang.String financialcontacts){
		this.financialcontacts = financialcontacts;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  financialcall
	 */
	@Column(name ="FINANCIALCALL",nullable=true,length=16)
	public java.lang.String getFinancialcall(){
		return this.financialcall;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  financialcall
	 */
	public void setFinancialcall(java.lang.String financialcall){
		this.financialcall = financialcall;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  financialphone
	 */
	@Column(name ="FINANCIALPHONE",nullable=true,length=16)
	public java.lang.String getFinancialphone(){
		return this.financialphone;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  financialphone
	 */
	public void setFinancialphone(java.lang.String financialphone){
		this.financialphone = financialphone;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  financialfax
	 */
	@Column(name ="FINANCIALFAX",nullable=true,length=16)
	public java.lang.String getFinancialfax(){
		return this.financialfax;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  financialfax
	 */
	public void setFinancialfax(java.lang.String financialfax){
		this.financialfax = financialfax;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  remittancename
	 */
	@Column(name ="REMITTANCENAME",nullable=true,length=128)
	public java.lang.String getRemittancename(){
		return this.remittancename;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  remittancename
	 */
	public void setRemittancename(java.lang.String remittancename){
		this.remittancename = remittancename;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  beneficiary
	 */
	@Column(name ="BENEFICIARY",nullable=true,length=128)
	public java.lang.String getBeneficiary(){
		return this.beneficiary;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  beneficiary
	 */
	public void setBeneficiary(java.lang.String beneficiary){
		this.beneficiary = beneficiary;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  taxno
	 */
	@Column(name ="TAXNO",nullable=true,length=32)
	public java.lang.String getTaxno(){
		return this.taxno;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  taxno
	 */
	public void setTaxno(java.lang.String taxno){
		this.taxno = taxno;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  accountno
	 */
	@Column(name ="ACCOUNTNO",nullable=true,length=32)
	public java.lang.String getAccountno(){
		return this.accountno;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  accountno
	 */
	public void setAccountno(java.lang.String accountno){
		this.accountno = accountno;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  yourcompany
	 */
	@Column(name ="YOURCOMPANY",nullable=true,length=128)
	public java.lang.String getYourcompany(){
		return this.yourcompany;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  yourcompany
	 */
	public void setYourcompany(java.lang.String yourcompany){
		this.yourcompany = yourcompany;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  youraddress
	 */
	@Column(name ="YOURADDRESS",nullable=true,length=128)
	public java.lang.String getYouraddress(){
		return this.youraddress;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  youraddress
	 */
	public void setYouraddress(java.lang.String youraddress){
		this.youraddress = youraddress;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  yourname
	 */
	@Column(name ="YOURNAME",nullable=true,length=32)
	public java.lang.String getYourname(){
		return this.yourname;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  yourname
	 */
	public void setYourname(java.lang.String yourname){
		this.yourname = yourname;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  yourphone
	 */
	@Column(name ="YOURPHONE",nullable=true,length=16)
	public java.lang.String getYourphone(){
		return this.yourphone;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  yourphone
	 */
	public void setYourphone(java.lang.String yourphone){
		this.yourphone = yourphone;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  telephone
	 */
	@Column(name ="TELEPHONE",nullable=true,length=16)
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
	 *@return: java.lang.String  estinationcity
	 */
	@Column(name ="ESTINATIONCITY",nullable=true,length=128)
	public java.lang.String getEstinationcity(){
		return this.estinationcity;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  estinationcity
	 */
	public void setEstinationcity(java.lang.String estinationcity){
		this.estinationcity = estinationcity;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  updatas
	 */
	@Column(name ="UPDATAS",nullable=true,length=256)
	public java.lang.String getUpdatas(){
		return this.updatas;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  updatas
	 */
	public void setUpdatas(java.lang.String updatas){
		this.updatas = updatas;
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
