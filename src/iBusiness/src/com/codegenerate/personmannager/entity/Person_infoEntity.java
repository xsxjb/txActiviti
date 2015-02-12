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
 * @Description: 人事档案管理页面
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_PERSON_INFO")
public class Person_infoEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**jobnum*/
	private java.lang.String jobnum;
	/**name*/
	private java.lang.String name;
	/**gender*/
	private java.lang.String gender;
	/**birth*/
	private java.util.Date birth;
	/**birthplace*/
	private java.lang.String birthplace;
	/**politicsstatus*/
	private java.lang.String politicsstatus;
	/**idcard*/
	private java.lang.String idcard;
	/**maritalstatus*/
	private java.lang.String maritalstatus;
	/**culturestandard*/
	private java.lang.String culturestandard;
	/**graduateschool*/
	private java.lang.String graduateschool;
	/**major*/
	private java.lang.String major;
	/**graduatedate*/
	private java.util.Date graduatedate;
	/**phone*/
	private java.lang.String phone;
	/**address*/
	private java.lang.String address;
	/**tel*/
	private java.lang.String tel;
	/**hkadr*/
	private java.lang.String hkadr;
	/**zipcode*/
	private java.lang.Integer zipcode;
	/**origanizationcode*/
	private java.lang.String origanizationcode;
	/**post*/
	private java.lang.String post;
	/**posttitle*/
	private java.lang.String posttitle;
	/**enterdate*/
	private java.util.Date enterdate;
	/**fulldate*/
	private java.util.Date fulldate;
	/**leavedate*/
	private java.util.Date leavedate;
	/**contracttype*/
	private java.lang.String contracttype;
	/**treatment*/
	private java.lang.Integer treatment;
	/**originalworkunit*/
	private java.lang.String originalworkunit;
	/**bondsman*/
	private java.lang.String bondsman;
	/**resume*/
	private java.lang.String resume;
	/**remark*/
	private java.lang.String remark;
	/**id*/
	private java.lang.String id;
	/**scopeid*/
	private java.lang.String scopeid;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  jobnum
	 */
	@Column(name ="JOBNUM",nullable=true,length=32)
	public java.lang.String getJobnum(){
		return this.jobnum;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  jobnum
	 */
	public void setJobnum(java.lang.String jobnum){
		this.jobnum = jobnum;
	}
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
	 *@return: java.lang.String  gender
	 */
	@Column(name ="GENDER",nullable=true,length=8)
	public java.lang.String getGender(){
		return this.gender;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  gender
	 */
	public void setGender(java.lang.String gender){
		this.gender = gender;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  birth
	 */
	@Column(name ="BIRTH",nullable=true)
	public java.util.Date getBirth(){
		return this.birth;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  birth
	 */
	public void setBirth(java.util.Date birth){
		this.birth = birth;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  birthplace
	 */
	@Column(name ="BIRTHPLACE",nullable=true,length=32)
	public java.lang.String getBirthplace(){
		return this.birthplace;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  birthplace
	 */
	public void setBirthplace(java.lang.String birthplace){
		this.birthplace = birthplace;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  politicsstatus
	 */
	@Column(name ="POLITICSSTATUS",nullable=true,length=32)
	public java.lang.String getPoliticsstatus(){
		return this.politicsstatus;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  politicsstatus
	 */
	public void setPoliticsstatus(java.lang.String politicsstatus){
		this.politicsstatus = politicsstatus;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  idcard
	 */
	@Column(name ="IDCARD",nullable=true,length=18)
	public java.lang.String getIdcard(){
		return this.idcard;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  idcard
	 */
	public void setIdcard(java.lang.String idcard){
		this.idcard = idcard;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  maritalstatus
	 */
	@Column(name ="MARITALSTATUS",nullable=true,length=32)
	public java.lang.String getMaritalstatus(){
		return this.maritalstatus;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  maritalstatus
	 */
	public void setMaritalstatus(java.lang.String maritalstatus){
		this.maritalstatus = maritalstatus;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  culturestandard
	 */
	@Column(name ="CULTURESTANDARD",nullable=true,length=32)
	public java.lang.String getCulturestandard(){
		return this.culturestandard;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  culturestandard
	 */
	public void setCulturestandard(java.lang.String culturestandard){
		this.culturestandard = culturestandard;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  graduateschool
	 */
	@Column(name ="GRADUATESCHOOL",nullable=true,length=32)
	public java.lang.String getGraduateschool(){
		return this.graduateschool;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  graduateschool
	 */
	public void setGraduateschool(java.lang.String graduateschool){
		this.graduateschool = graduateschool;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  major
	 */
	@Column(name ="MAJOR",nullable=true,length=32)
	public java.lang.String getMajor(){
		return this.major;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  major
	 */
	public void setMajor(java.lang.String major){
		this.major = major;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  graduatedate
	 */
	@Column(name ="GRADUATEDATE",nullable=true)
	public java.util.Date getGraduatedate(){
		return this.graduatedate;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  graduatedate
	 */
	public void setGraduatedate(java.util.Date graduatedate){
		this.graduatedate = graduatedate;
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
	 *@return: java.lang.String  address
	 */
	@Column(name ="ADDRESS",nullable=true,length=32)
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
	 *@return: java.lang.String  tel
	 */
	@Column(name ="TEL",nullable=true,length=32)
	public java.lang.String getTel(){
		return this.tel;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  tel
	 */
	public void setTel(java.lang.String tel){
		this.tel = tel;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  hkadr
	 */
	@Column(name ="HKADR",nullable=true,length=32)
	public java.lang.String getHkadr(){
		return this.hkadr;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  hkadr
	 */
	public void setHkadr(java.lang.String hkadr){
		this.hkadr = hkadr;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  zipcode
	 */
	@Column(name ="ZIPCODE",nullable=true,precision=10,scale=0)
	public java.lang.Integer getZipcode(){
		return this.zipcode;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  zipcode
	 */
	public void setZipcode(java.lang.Integer zipcode){
		this.zipcode = zipcode;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  origanizationcode
	 */
	@Column(name ="ORIGANIZATIONCODE",nullable=true,length=32)
	public java.lang.String getOriganizationcode(){
		return this.origanizationcode;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  origanizationcode
	 */
	public void setOriganizationcode(java.lang.String origanizationcode){
		this.origanizationcode = origanizationcode;
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
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  fulldate
	 */
	@Column(name ="FULLDATE",nullable=true)
	public java.util.Date getFulldate(){
		return this.fulldate;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  fulldate
	 */
	public void setFulldate(java.util.Date fulldate){
		this.fulldate = fulldate;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  leavedate
	 */
	@Column(name ="LEAVEDATE",nullable=true)
	public java.util.Date getLeavedate(){
		return this.leavedate;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  leavedate
	 */
	public void setLeavedate(java.util.Date leavedate){
		this.leavedate = leavedate;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  contracttype
	 */
	@Column(name ="CONTRACTTYPE",nullable=true,length=32)
	public java.lang.String getContracttype(){
		return this.contracttype;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  contracttype
	 */
	public void setContracttype(java.lang.String contracttype){
		this.contracttype = contracttype;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  treatment
	 */
	@Column(name ="TREATMENT",nullable=true,precision=10,scale=0)
	public java.lang.Integer getTreatment(){
		return this.treatment;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  treatment
	 */
	public void setTreatment(java.lang.Integer treatment){
		this.treatment = treatment;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  originalworkunit
	 */
	@Column(name ="ORIGINALWORKUNIT",nullable=true,length=32)
	public java.lang.String getOriginalworkunit(){
		return this.originalworkunit;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  originalworkunit
	 */
	public void setOriginalworkunit(java.lang.String originalworkunit){
		this.originalworkunit = originalworkunit;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  bondsman
	 */
	@Column(name ="BONDSMAN",nullable=true,length=32)
	public java.lang.String getBondsman(){
		return this.bondsman;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  bondsman
	 */
	public void setBondsman(java.lang.String bondsman){
		this.bondsman = bondsman;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  resume
	 */
	@Column(name ="RESUME",nullable=true,length=32)
	public java.lang.String getResume(){
		return this.resume;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  resume
	 */
	public void setResume(java.lang.String resume){
		this.resume = resume;
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
