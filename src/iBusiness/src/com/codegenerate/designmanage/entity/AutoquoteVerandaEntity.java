package com.codegenerate.designmanage.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**   
 * 阳台
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_AUTOQUOTE_VERANDA")
public class AutoquoteVerandaEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**id*/
	private java.lang.String id;
	/**parentid*/
	private java.lang.String parentid;
	// 面积
	private java.lang.Double verandaarea;
	// 门窗等刨除面积
	private Double doorArea;
	// 长
	private java.lang.Double verandadepth;
	// 宽
	private java.lang.Double verandawidth;
	// 高
	private java.lang.Double verandaheight;
	
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
	 *@return: java.lang.String  parentid
	 */
	@Column(name ="PARENTID",nullable=true,length=64)
	public java.lang.String getParentid(){
		return this.parentid;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  parentid
	 */
	public void setParentid(java.lang.String parentid){
		this.parentid = parentid;
	}
	/**
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  verandaarea
	 */
	@Column(name ="VERANDAAREA",nullable=true,precision=12,scale=2)
	public java.lang.Double getVerandaarea(){
		return this.verandaarea;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  verandaarea
	 */
	public void setVerandaarea(java.lang.Double verandaarea){
		this.verandaarea = verandaarea;
	}
	/**
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  verandadepth
	 */
	@Column(name ="VERANDADEPTH",nullable=true,precision=12,scale=2)
	public java.lang.Double getVerandadepth(){
		return this.verandadepth;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  verandadepth
	 */
	public void setVerandadepth(java.lang.Double verandadepth){
		this.verandadepth = verandadepth;
	}
	/**
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  verandawidth
	 */
	@Column(name ="VERANDAWIDTH",nullable=true,precision=12,scale=2)
	public java.lang.Double getVerandawidth(){
		return this.verandawidth;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  verandawidth
	 */
	public void setVerandawidth(java.lang.Double verandawidth){
		this.verandawidth = verandawidth;
	}
	/**
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  verandaheight
	 */
	@Column(name ="VERANDAHEIGHT",nullable=true,precision=12,scale=2)
	public java.lang.Double getVerandaheight(){
		return this.verandaheight;
	}
	public void setVerandaheight(java.lang.Double verandaheight){
		this.verandaheight = verandaheight;
	}
	/**
	 * @return the doorArea
	 */
	@Column(name ="DOORAREA")
	public Double getDoorArea() {
		return doorArea;
	}
	/**
	 * @param doorArea the doorArea to set
	 */
	public void setDoorArea(Double doorArea) {
		this.doorArea = doorArea;
	}
}
