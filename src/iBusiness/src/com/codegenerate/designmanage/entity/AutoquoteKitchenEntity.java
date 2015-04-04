package com.codegenerate.designmanage.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**   
 * 厨房
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_AUTOQUOTE_KITCHEN")
public class AutoquoteKitchenEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**id*/
	private java.lang.String id;
	/**parentid*/
	private java.lang.String parentid;
	// 面积
	private java.lang.Double kitchenarea;
	// 门窗等刨除面积
	private Double doorArea;
	// 长
	private java.lang.Double kitchendepth;
	// 宽
	private java.lang.Double kitchenwidth;
	// 高
	private java.lang.Double kitchenheight;
	
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
	 *@return: java.lang.Double  kitchenarea
	 */
	@Column(name ="KITCHENAREA",nullable=true,precision=12,scale=2)
	public java.lang.Double getKitchenarea(){
		return this.kitchenarea;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  kitchenarea
	 */
	public void setKitchenarea(java.lang.Double kitchenarea){
		this.kitchenarea = kitchenarea;
	}
	/**
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  kitchendepth
	 */
	@Column(name ="KITCHENDEPTH",nullable=true,precision=12,scale=2)
	public java.lang.Double getKitchendepth(){
		return this.kitchendepth;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  kitchendepth
	 */
	public void setKitchendepth(java.lang.Double kitchendepth){
		this.kitchendepth = kitchendepth;
	}
	/**
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  kitchenwidth
	 */
	@Column(name ="KITCHENWIDTH",nullable=true,precision=12,scale=2)
	public java.lang.Double getKitchenwidth(){
		return this.kitchenwidth;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  kitchenwidth
	 */
	public void setKitchenwidth(java.lang.Double kitchenwidth){
		this.kitchenwidth = kitchenwidth;
	}
	/**
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  kitchenheight
	 */
	@Column(name ="KITCHENHEIGHT",nullable=true,precision=12,scale=2)
	public java.lang.Double getKitchenheight(){
		return this.kitchenheight;
	}
	public void setKitchenheight(java.lang.Double kitchenheight){
		this.kitchenheight = kitchenheight;
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
