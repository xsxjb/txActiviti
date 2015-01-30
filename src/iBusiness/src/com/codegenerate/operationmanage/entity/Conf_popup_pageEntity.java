package com.codegenerate.operationmanage.entity;

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
 * @Description: PLC弹出页面页面
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_CONF_POPUP_PAGE")
public class Conf_popup_pageEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**pagename*/
	private java.lang.String pagename;
	/**pagetitle*/
	private java.lang.String pagetitle;
	/**popuptype*/
	private java.lang.String popuptype;
	/**pageurl*/
	private java.lang.String pageurl;
	/**pagetype*/
	private java.lang.String pagetype;
	/**mainpageid*/
	private java.lang.String mainpageid;
	/**pagehight*/
	private java.lang.String pagehight;
	/**pagewidth*/
	private java.lang.String pagewidth;
	/**id*/
	private java.lang.String id;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  pagename
	 */
	@Column(name ="PAGENAME",nullable=true,length=64)
	public java.lang.String getPagename(){
		return this.pagename;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  pagename
	 */
	public void setPagename(java.lang.String pagename){
		this.pagename = pagename;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  pagetitle
	 */
	@Column(name ="PAGETITLE",nullable=true,length=128)
	public java.lang.String getPagetitle(){
		return this.pagetitle;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  pagetitle
	 */
	public void setPagetitle(java.lang.String pagetitle){
		this.pagetitle = pagetitle;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  popuptype
	 */
	@Column(name ="POPUPTYPE",nullable=true,length=16)
	public java.lang.String getPopuptype(){
		return this.popuptype;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  popuptype
	 */
	public void setPopuptype(java.lang.String popuptype){
		this.popuptype = popuptype;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  pageurl
	 */
	@Column(name ="PAGEURL",nullable=true,length=256)
	public java.lang.String getPageurl(){
		return this.pageurl;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  pageurl
	 */
	public void setPageurl(java.lang.String pageurl){
		this.pageurl = pageurl;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  pagetype
	 */
	@Column(name ="PAGETYPE",nullable=true,length=16)
	public java.lang.String getPagetype(){
		return this.pagetype;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  pagetype
	 */
	public void setPagetype(java.lang.String pagetype){
		this.pagetype = pagetype;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  mainpageid
	 */
	@Column(name ="MAINPAGEID",nullable=true,length=64)
	public java.lang.String getMainpageid(){
		return this.mainpageid;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  mainpageid
	 */
	public void setMainpageid(java.lang.String mainpageid){
		this.mainpageid = mainpageid;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  pagehight
	 */
	@Column(name ="PAGEHIGHT",nullable=true,length=8)
	public java.lang.String getPagehight(){
		return this.pagehight;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  pagehight
	 */
	public void setPagehight(java.lang.String pagehight){
		this.pagehight = pagehight;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  pagewidth
	 */
	@Column(name ="PAGEWIDTH",nullable=true,length=8)
	public java.lang.String getPagewidth(){
		return this.pagewidth;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  pagewidth
	 */
	public void setPagewidth(java.lang.String pagewidth){
		this.pagewidth = pagewidth;
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
