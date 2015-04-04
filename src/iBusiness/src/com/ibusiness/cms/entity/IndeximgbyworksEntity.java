package com.ibusiness.cms.entity;

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
 * @Description: 作品展示表页面
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_INDEXIMGBYWORKS")
public class IndeximgbyworksEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**scopeid*/
	private java.lang.String scopeid;
	/**id*/
	private java.lang.String id;
	/**imgurl*/
	private java.lang.String imgurl;
	/**imginfo*/
	private java.lang.String imginfo;
	/**showflag*/
	private java.lang.String showflag;
	
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
	 *@return: java.lang.String  imgurl
	 */
	@Column(name ="IMGURL",nullable=true,length=256)
	public java.lang.String getImgurl(){
		return this.imgurl;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  imgurl
	 */
	public void setImgurl(java.lang.String imgurl){
		this.imgurl = imgurl;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  imginfo
	 */
	@Column(name ="IMGINFO",nullable=true,length=128)
	public java.lang.String getImginfo(){
		return this.imginfo;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  imginfo
	 */
	public void setImginfo(java.lang.String imginfo){
		this.imginfo = imginfo;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  showflag
	 */
	@Column(name ="SHOWFLAG",nullable=true,length=8)
	public java.lang.String getShowflag(){
		return this.showflag;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  showflag
	 */
	public void setShowflag(java.lang.String showflag){
		this.showflag = showflag;
	}
}
