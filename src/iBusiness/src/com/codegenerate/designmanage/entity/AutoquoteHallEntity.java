package com.codegenerate.designmanage.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**   
 * 客厅
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_AUTOQUOTE_HALL")
public class AutoquoteHallEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**id*/
	private java.lang.String id;
	/**parentid*/
	private java.lang.String parentid;
	// 面积
	private java.lang.Double hallarea;
	// 门窗等刨除面积
	private Double doorArea;
	// 长
	private java.lang.Double halldepth;
	// 宽
	private java.lang.Double hallwidth;
	// 高
	private java.lang.Double hallheight;
	
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
	 *@return: java.lang.Double  hallarea
	 */
	@Column(name ="HALLAREA",nullable=true,precision=12,scale=2)
	public java.lang.Double getHallarea(){
		return this.hallarea;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  hallarea
	 */
	public void setHallarea(java.lang.Double hallarea){
		this.hallarea = hallarea;
	}
	/**
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  halldepth
	 */
	@Column(name ="HALLDEPTH",nullable=true,precision=12,scale=2)
	public java.lang.Double getHalldepth(){
		return this.halldepth;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  halldepth
	 */
	public void setHalldepth(java.lang.Double halldepth){
		this.halldepth = halldepth;
	}
	/**
	 *方法: 取得java.lang.Double
	 *@return: java.lang.Double  hallwidth
	 */
	@Column(name ="HALLWIDTH",nullable=true,precision=12,scale=2)
	public java.lang.Double getHallwidth(){
		return this.hallwidth;
	}

	/**
	 *方法: 设置java.lang.Double
	 *@param: java.lang.Double  hallwidth
	 */
	public void setHallwidth(java.lang.Double hallwidth){
		this.hallwidth = hallwidth;
	}
	@Column(name ="HALLHEIGHT",nullable=true,precision=12,scale=2)
	public java.lang.Double getHallheight(){
		return this.hallheight;
	}
	public void setHallheight(java.lang.Double hallheight){
		this.hallheight = hallheight;
	}
	@Column(name ="DOORAREA")
	public Double getDoorArea() {
		return doorArea;
	}
	public void setDoorArea(Double doorArea) {
		this.doorArea = doorArea;
	}
}
