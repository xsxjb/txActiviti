package com.codegenerate.productmanage.entity;

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
 * @Description: 项目出库表流程
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_PROJECT_OUT")
public class Project_outEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**amountcapital*/
	private java.lang.String amountcapital;
	/**amountlowercase*/
	private java.lang.Double amountlowercase;
	/**applicantuser*/
	private java.lang.String applicantuser;
	/**assigneeuser*/
	private java.lang.String assigneeuser;
	/**cardoor*/
	private java.lang.String cardoor;
	/**comments*/
	private java.lang.String comments;
	/**consignee*/
	private java.lang.String consignee;
	/**consigneephone*/
	private java.lang.String consigneephone;
	/**createdatebpm*/
	private java.util.Date createdatebpm;
	/**customername*/
	private java.lang.String customername;
	/**deliveryaddress*/
	private java.lang.String deliveryaddress;
	/**detailedinfo*/
	private java.lang.String detailedinfo;
	/**doneflag*/
	private java.lang.Integer doneflag;
	/**eventdate*/
	private java.util.Date eventdate;
	/**executionid*/
	private java.lang.String executionid;
	/**financialappr*/
	private java.lang.String financialappr;
	/**id*/
	private java.lang.String id;
	/**isexecutpact*/
	private java.lang.String isexecutpact;
	/**nodename*/
	private java.lang.String nodename;
	/**otherinfo*/
	private java.lang.String otherinfo;
	/**outdoor*/
	private java.lang.String outdoor;
	/**packagetype*/
	private java.lang.String packagetype;
	/**pactno*/
	private java.lang.String pactno;
	/**paymentinfo*/
	private java.lang.String paymentinfo;
	/**paymentno*/
	private java.lang.String paymentno;
	/**planner*/
	private java.lang.String planner;
	/**pmanagerappr*/
	private java.lang.String pmanagerappr;
	/**projectmanager*/
	private java.lang.String projectmanager;
	/**projectname*/
	private java.lang.String projectname;
	/**projectno*/
	private java.lang.String projectno;
	/**salesdept*/
	private java.lang.String salesdept;
	/**salesdeptmanaappr*/
	private java.lang.String salesdeptmanaappr;
	/**salesdirectorappr*/
	private java.lang.String salesdirectorappr;
	/**salesuser*/
	private java.lang.String salesuser;
	/**tasktitle*/
	private java.lang.String tasktitle;
	/**transportmode*/
	private java.lang.String transportmode;
	/**type*/
	private java.lang.String type;
	/**username*/
	private java.lang.String username;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  amountcapital
	 */
	@Column(name ="AMOUNTCAPITAL",nullable=true,length=64)
	public java.lang.String getAmountcapital(){
		return this.amountcapital;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  amountcapital
	 */
	public void setAmountcapital(java.lang.String amountcapital){
		this.amountcapital = amountcapital;
	}
	/**
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  amountlowercase
	 */
	@Column(name ="AMOUNTLOWERCASE",nullable=true,precision=12,scale=2)
	public java.lang.Double getAmountlowercase(){
		return this.amountlowercase;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  amountlowercase
	 */
	public void setAmountlowercase(java.lang.Double amountlowercase){
		this.amountlowercase = amountlowercase;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  applicantuser
	 */
	@Column(name ="APPLICANTUSER",nullable=true,length=32)
	public java.lang.String getApplicantuser(){
		return this.applicantuser;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  applicantuser
	 */
	public void setApplicantuser(java.lang.String applicantuser){
		this.applicantuser = applicantuser;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  assigneeuser
	 */
	@Column(name ="ASSIGNEEUSER",nullable=true,length=64)
	public java.lang.String getAssigneeuser(){
		return this.assigneeuser;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  assigneeuser
	 */
	public void setAssigneeuser(java.lang.String assigneeuser){
		this.assigneeuser = assigneeuser;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  cardoor
	 */
	@Column(name ="CARDOOR",nullable=true,length=2)
	public java.lang.String getCardoor(){
		return this.cardoor;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  cardoor
	 */
	public void setCardoor(java.lang.String cardoor){
		this.cardoor = cardoor;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  comments
	 */
	@Column(name ="COMMENTS",nullable=true,length=128)
	public java.lang.String getComments(){
		return this.comments;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  comments
	 */
	public void setComments(java.lang.String comments){
		this.comments = comments;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  consignee
	 */
	@Column(name ="CONSIGNEE",nullable=true,length=32)
	public java.lang.String getConsignee(){
		return this.consignee;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  consignee
	 */
	public void setConsignee(java.lang.String consignee){
		this.consignee = consignee;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  consigneephone
	 */
	@Column(name ="CONSIGNEEPHONE",nullable=true,length=128)
	public java.lang.String getConsigneephone(){
		return this.consigneephone;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  consigneephone
	 */
	public void setConsigneephone(java.lang.String consigneephone){
		this.consigneephone = consigneephone;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  createdatebpm
	 */
	@Column(name ="CREATEDATEBPM",nullable=true)
	public java.util.Date getCreatedatebpm(){
		return this.createdatebpm;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  createdatebpm
	 */
	public void setCreatedatebpm(java.util.Date createdatebpm){
		this.createdatebpm = createdatebpm;
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
	 *@return: java.lang.String  deliveryaddress
	 */
	@Column(name ="DELIVERYADDRESS",nullable=true,length=128)
	public java.lang.String getDeliveryaddress(){
		return this.deliveryaddress;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  deliveryaddress
	 */
	public void setDeliveryaddress(java.lang.String deliveryaddress){
		this.deliveryaddress = deliveryaddress;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  detailedinfo
	 */
	@Column(name ="DETAILEDINFO",nullable=true,length=512)
	public java.lang.String getDetailedinfo(){
		return this.detailedinfo;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  detailedinfo
	 */
	public void setDetailedinfo(java.lang.String detailedinfo){
		this.detailedinfo = detailedinfo;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  doneflag
	 */
	@Column(name ="DONEFLAG",nullable=true,precision=10,scale=0)
	public java.lang.Integer getDoneflag(){
		return this.doneflag;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  doneflag
	 */
	public void setDoneflag(java.lang.Integer doneflag){
		this.doneflag = doneflag;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  eventdate
	 */
	@Column(name ="EVENTDATE",nullable=true)
	public java.util.Date getEventdate(){
		return this.eventdate;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  eventdate
	 */
	public void setEventdate(java.util.Date eventdate){
		this.eventdate = eventdate;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  executionid
	 */
	@Column(name ="EXECUTIONID",nullable=true,length=64)
	public java.lang.String getExecutionid(){
		return this.executionid;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  executionid
	 */
	public void setExecutionid(java.lang.String executionid){
		this.executionid = executionid;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  financialappr
	 */
	@Column(name ="FINANCIALAPPR",nullable=true,length=128)
	public java.lang.String getFinancialappr(){
		return this.financialappr;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  financialappr
	 */
	public void setFinancialappr(java.lang.String financialappr){
		this.financialappr = financialappr;
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
	 *@return: java.lang.String  isexecutpact
	 */
	@Column(name ="ISEXECUTPACT",nullable=true,length=2)
	public java.lang.String getIsexecutpact(){
		return this.isexecutpact;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  isexecutpact
	 */
	public void setIsexecutpact(java.lang.String isexecutpact){
		this.isexecutpact = isexecutpact;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  nodename
	 */
	@Column(name ="NODENAME",nullable=true,length=128)
	public java.lang.String getNodename(){
		return this.nodename;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  nodename
	 */
	public void setNodename(java.lang.String nodename){
		this.nodename = nodename;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  otherinfo
	 */
	@Column(name ="OTHERINFO",nullable=true,length=256)
	public java.lang.String getOtherinfo(){
		return this.otherinfo;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  otherinfo
	 */
	public void setOtherinfo(java.lang.String otherinfo){
		this.otherinfo = otherinfo;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  outdoor
	 */
	@Column(name ="OUTDOOR",nullable=true,length=2)
	public java.lang.String getOutdoor(){
		return this.outdoor;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  outdoor
	 */
	public void setOutdoor(java.lang.String outdoor){
		this.outdoor = outdoor;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  packagetype
	 */
	@Column(name ="PACKAGETYPE",nullable=true,length=16)
	public java.lang.String getPackagetype(){
		return this.packagetype;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  packagetype
	 */
	public void setPackagetype(java.lang.String packagetype){
		this.packagetype = packagetype;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  pactno
	 */
	@Column(name ="PACTNO",nullable=true,length=32)
	public java.lang.String getPactno(){
		return this.pactno;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  pactno
	 */
	public void setPactno(java.lang.String pactno){
		this.pactno = pactno;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  paymentinfo
	 */
	@Column(name ="PAYMENTINFO",nullable=true,length=128)
	public java.lang.String getPaymentinfo(){
		return this.paymentinfo;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  paymentinfo
	 */
	public void setPaymentinfo(java.lang.String paymentinfo){
		this.paymentinfo = paymentinfo;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  paymentno
	 */
	@Column(name ="PAYMENTNO",nullable=true,length=32)
	public java.lang.String getPaymentno(){
		return this.paymentno;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  paymentno
	 */
	public void setPaymentno(java.lang.String paymentno){
		this.paymentno = paymentno;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  planner
	 */
	@Column(name ="PLANNER",nullable=true,length=32)
	public java.lang.String getPlanner(){
		return this.planner;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  planner
	 */
	public void setPlanner(java.lang.String planner){
		this.planner = planner;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  pmanagerappr
	 */
	@Column(name ="PMANAGERAPPR",nullable=true,length=128)
	public java.lang.String getPmanagerappr(){
		return this.pmanagerappr;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  pmanagerappr
	 */
	public void setPmanagerappr(java.lang.String pmanagerappr){
		this.pmanagerappr = pmanagerappr;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  projectmanager
	 */
	@Column(name ="PROJECTMANAGER",nullable=true,length=32)
	public java.lang.String getProjectmanager(){
		return this.projectmanager;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  projectmanager
	 */
	public void setProjectmanager(java.lang.String projectmanager){
		this.projectmanager = projectmanager;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  projectname
	 */
	@Column(name ="PROJECTNAME",nullable=true,length=128)
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
	 *@return: java.lang.String  projectno
	 */
	@Column(name ="PROJECTNO",nullable=true,length=128)
	public java.lang.String getProjectno(){
		return this.projectno;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  projectno
	 */
	public void setProjectno(java.lang.String projectno){
		this.projectno = projectno;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  salesdept
	 */
	@Column(name ="SALESDEPT",nullable=true,length=32)
	public java.lang.String getSalesdept(){
		return this.salesdept;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  salesdept
	 */
	public void setSalesdept(java.lang.String salesdept){
		this.salesdept = salesdept;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  salesdeptmanaappr
	 */
	@Column(name ="SALESDEPTMANAAPPR",nullable=true,length=128)
	public java.lang.String getSalesdeptmanaappr(){
		return this.salesdeptmanaappr;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  salesdeptmanaappr
	 */
	public void setSalesdeptmanaappr(java.lang.String salesdeptmanaappr){
		this.salesdeptmanaappr = salesdeptmanaappr;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  salesdirectorappr
	 */
	@Column(name ="SALESDIRECTORAPPR",nullable=true,length=128)
	public java.lang.String getSalesdirectorappr(){
		return this.salesdirectorappr;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  salesdirectorappr
	 */
	public void setSalesdirectorappr(java.lang.String salesdirectorappr){
		this.salesdirectorappr = salesdirectorappr;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  salesuser
	 */
	@Column(name ="SALESUSER",nullable=true,length=32)
	public java.lang.String getSalesuser(){
		return this.salesuser;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  salesuser
	 */
	public void setSalesuser(java.lang.String salesuser){
		this.salesuser = salesuser;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  tasktitle
	 */
	@Column(name ="TASKTITLE",nullable=true,length=256)
	public java.lang.String getTasktitle(){
		return this.tasktitle;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  tasktitle
	 */
	public void setTasktitle(java.lang.String tasktitle){
		this.tasktitle = tasktitle;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  transportmode
	 */
	@Column(name ="TRANSPORTMODE",nullable=true,length=32)
	public java.lang.String getTransportmode(){
		return this.transportmode;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  transportmode
	 */
	public void setTransportmode(java.lang.String transportmode){
		this.transportmode = transportmode;
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
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  username
	 */
	@Column(name ="USERNAME",nullable=true,length=128)
	public java.lang.String getUsername(){
		return this.username;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  username
	 */
	public void setUsername(java.lang.String username){
		this.username = username;
	}
}
