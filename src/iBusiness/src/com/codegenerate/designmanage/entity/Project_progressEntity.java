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
 * @Description: 装饰进度管理表页面
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_PROJECT_PROGRESS")
public class Project_progressEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**pactno*/
	private java.lang.String pactno;
	/**customername*/
	private java.lang.String customername;
	/**projectname*/
	private java.lang.String projectname;
	/**designname*/
	private java.lang.String designname;
	/**worksmanage*/
	private java.lang.String worksmanage;
	/**currentprogress*/
	private java.lang.String currentprogress;
	/**id*/
	private java.lang.String id;
	/**scopeid*/
	private java.lang.String scopeid;
	/**metalflag*/
	private java.lang.String metalflag;
	/**surfaceflag*/
	private java.lang.String surfaceflag;
	/**designflag*/
	private java.lang.String designflag;
	/**demolitionflag*/
	private java.lang.String demolitionflag;
	/**waterflag*/
	private java.lang.String waterflag;
	/**tileflag*/
	private java.lang.String tileflag;
	/**wallflag*/
	private java.lang.String wallflag;
	/**floorflag*/
	private java.lang.String floorflag;
	/**doneflag*/
	private java.lang.String doneflag;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  pactno
	 */
	@Column(name ="PACTNO",nullable=true,length=64)
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
	 *@return: java.lang.String  designname
	 */
	@Column(name ="DESIGNNAME",nullable=true,length=64)
	public java.lang.String getDesignname(){
		return this.designname;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  designname
	 */
	public void setDesignname(java.lang.String designname){
		this.designname = designname;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  worksmanage
	 */
	@Column(name ="WORKSMANAGE",nullable=true,length=64)
	public java.lang.String getWorksmanage(){
		return this.worksmanage;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  worksmanage
	 */
	public void setWorksmanage(java.lang.String worksmanage){
		this.worksmanage = worksmanage;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  currentprogress
	 */
	@Column(name ="CURRENTPROGRESS",nullable=true,length=16)
	public java.lang.String getCurrentprogress(){
		return this.currentprogress;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  currentprogress
	 */
	public void setCurrentprogress(java.lang.String currentprogress){
		this.currentprogress = currentprogress;
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
	 *@return: java.lang.String  metalflag
	 */
	@Column(name ="METALFLAG",nullable=true,length=8)
	public java.lang.String getMetalflag(){
		return this.metalflag;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  metalflag
	 */
	public void setMetalflag(java.lang.String metalflag){
		this.metalflag = metalflag;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  surfaceflag
	 */
	@Column(name ="SURFACEFLAG",nullable=true,length=8)
	public java.lang.String getSurfaceflag(){
		return this.surfaceflag;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  surfaceflag
	 */
	public void setSurfaceflag(java.lang.String surfaceflag){
		this.surfaceflag = surfaceflag;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  designflag
	 */
	@Column(name ="DESIGNFLAG",nullable=true,length=8)
	public java.lang.String getDesignflag(){
		return this.designflag;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  designflag
	 */
	public void setDesignflag(java.lang.String designflag){
		this.designflag = designflag;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  demolitionflag
	 */
	@Column(name ="DEMOLITIONFLAG",nullable=true,length=8)
	public java.lang.String getDemolitionflag(){
		return this.demolitionflag;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  demolitionflag
	 */
	public void setDemolitionflag(java.lang.String demolitionflag){
		this.demolitionflag = demolitionflag;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  waterflag
	 */
	@Column(name ="WATERFLAG",nullable=true,length=8)
	public java.lang.String getWaterflag(){
		return this.waterflag;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  waterflag
	 */
	public void setWaterflag(java.lang.String waterflag){
		this.waterflag = waterflag;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  tileflag
	 */
	@Column(name ="TILEFLAG",nullable=true,length=8)
	public java.lang.String getTileflag(){
		return this.tileflag;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  tileflag
	 */
	public void setTileflag(java.lang.String tileflag){
		this.tileflag = tileflag;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  wallflag
	 */
	@Column(name ="WALLFLAG",nullable=true,length=8)
	public java.lang.String getWallflag(){
		return this.wallflag;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  wallflag
	 */
	public void setWallflag(java.lang.String wallflag){
		this.wallflag = wallflag;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  floorflag
	 */
	@Column(name ="FLOORFLAG",nullable=true,length=8)
	public java.lang.String getFloorflag(){
		return this.floorflag;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  floorflag
	 */
	public void setFloorflag(java.lang.String floorflag){
		this.floorflag = floorflag;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  doneflag
	 */
	@Column(name ="DONEFLAG",nullable=true,length=8)
	public java.lang.String getDoneflag(){
		return this.doneflag;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  doneflag
	 */
	public void setDoneflag(java.lang.String doneflag){
		this.doneflag = doneflag;
	}
}
