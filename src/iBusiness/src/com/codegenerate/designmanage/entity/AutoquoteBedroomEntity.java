package com.codegenerate.designmanage.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 卧室
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_AUTOQUOTE_BEDROOM")
public class AutoquoteBedroomEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**id*/
	private java.lang.String id;
	/**parentid*/
	private java.lang.String parentid;
	// 面积
	private java.lang.Double bedroomarea;
	// 门窗等刨除面积
	private Double doorArea;
	// 长
	private java.lang.Double bedroomdepth;
	// 宽
	private java.lang.Double bedroomwidth;
	// 高
	private java.lang.Double bedroomheight;
	
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
	 *@return: java.lang.Double  bedroomarea
	 */
	@Column(name ="BEDROOMAREA",nullable=true,precision=12,scale=2)
	public java.lang.Double getBedroomarea(){
		return this.bedroomarea;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  bedroomarea
	 */
	public void setBedroomarea(java.lang.Double bedroomarea){
		this.bedroomarea = bedroomarea;
	}
	/**
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  bedroomdepth
	 */
	@Column(name ="BEDROOMDEPTH",nullable=true,precision=12,scale=2)
	public java.lang.Double getBedroomdepth(){
		return this.bedroomdepth;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  bedroomdepth
	 */
	public void setBedroomdepth(java.lang.Double bedroomdepth){
		this.bedroomdepth = bedroomdepth;
	}
	/**
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  bedroomwidth
	 */
	@Column(name ="BEDROOMWIDTH",nullable=true,precision=12,scale=2)
	public java.lang.Double getBedroomwidth(){
		return this.bedroomwidth;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  bedroomwidth
	 */
	public void setBedroomwidth(java.lang.Double bedroomwidth){
		this.bedroomwidth = bedroomwidth;
	}
	@Column(name ="BEDROOMHEIGHT",nullable=true,precision=12,scale=2)
	public java.lang.Double getBedroomheight(){
		return this.bedroomheight;
	}
	public void setBedroomheight(java.lang.Double bedroomheight){
		this.bedroomheight = bedroomheight;
	}
	@Column(name ="DOORAREA")
	public Double getDoorArea() {
		return doorArea;
	}
	public void setDoorArea(Double doorArea) {
		this.doorArea = doorArea;
	}
}
