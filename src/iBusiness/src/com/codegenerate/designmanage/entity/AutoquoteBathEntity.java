package com.codegenerate.designmanage.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**   
 * 浴室/洗手间
 * 
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_AUTOQUOTE_BATH")
public class AutoquoteBathEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**id*/
	private String id;
	/**parentid*/
	private String parentid;
	// 面积
	private Double bathArea;
	// 门窗等刨除面积
	private Double doorArea;
	// 长
	private Double bathDepth;
	// 宽
	private Double bathWidth;
	// 高
	private Double bathHeight;
	
	/**
	 *方法: 取得String
	 *@return: String  id
	 */
	@Id
	@Column(name ="ID",nullable=false,length=64)
	public String getId(){
		return this.id;
	}

	/**
	 *方法: 设置String
	 *@param: String  id
	 */
	public void setId(String id){
		this.id = id;
	}
	/**
	 *方法: 取得String
	 *@return: String  parentid
	 */
	@Column(name ="PARENTID",nullable=true,length=64)
	public String getParentid(){
		return this.parentid;
	}

	/**
	 *方法: 设置String
	 *@param: String  parentid
	 */
	public void setParentid(String parentid){
		this.parentid = parentid;
	}
	/**
	 *方法: 取得Double
	 *@return: Double  bathArea
	 */
	@Column(name ="BathArea",nullable=true,precision=12,scale=2)
	public Double getBathArea(){
		return this.bathArea;
	}

	/**
	 *方法: 设置Double
	 *@param: Double  bathArea
	 */
	public void setBathArea(Double bathArea){
		this.bathArea = bathArea;
	}
	/**
	 *方法: 取得Double
	 *@return: Double  bathDepth
	 */
	@Column(name ="BathDepth",nullable=true,precision=12,scale=2)
	public Double getBathDepth(){
		return this.bathDepth;
	}

	/**
	 *方法: 设置Double
	 *@param: Double  bathDepth
	 */
	public void setBathDepth(Double bathDepth){
		this.bathDepth = bathDepth;
	}
	/**
	 *方法: 取得Double
	 *@return: Double  bathWidth
	 */
	@Column(name ="BathWidth",nullable=true,precision=12,scale=2)
	public Double getBathWidth(){
		return this.bathWidth;
	}

	/**
	 *方法: 设置Double
	 *@param: Double  bathWidth
	 */
	public void setBathWidth(Double bathWidth){
		this.bathWidth = bathWidth;
	}
	/**
	 *方法: 取得Double
	 *@return: Double  bathHeight
	 */
	@Column(name ="BathHeight",nullable=true,precision=12,scale=2)
	public Double getBathHeight(){
		return this.bathHeight;
	}

	/**
	 *方法: 设置Double
	 *@param: Double  bathHeight
	 */
	public void setBathHeight(Double bathHeight){
		this.bathHeight = bathHeight;
	}
	@Column(name ="DOORAREA")
	public Double getDoorArea() {
		return doorArea;
	}
	public void setDoorArea(Double doorArea) {
		this.doorArea = doorArea;
	}
}
