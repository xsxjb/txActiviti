package com.codegenerate.test.entity;

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
 * @Description: 测试练习表页面
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_TEST")
public class TestEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**id*/
	private java.lang.String id;
	/**mapip*/
	private java.lang.String mapip;
	/**mapport*/
	private java.lang.String mapport;
	/**mapcity*/
	private java.lang.String mapcity;
	/**mapshowonline*/
	private java.lang.String mapshowonline;
	/**mapgrid*/
	private java.lang.String mapgrid;
	/**mapcenterlongitude*/
	private java.lang.String mapcenterlongitude;
	/**mapcenterlatitude*/
	private java.lang.String mapcenterlatitude;
	
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
	 *@return: java.lang.String  mapip
	 */
	@Column(name ="MAPIP",nullable=true,length=32)
	public java.lang.String getMapip(){
		return this.mapip;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  mapip
	 */
	public void setMapip(java.lang.String mapip){
		this.mapip = mapip;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  mapport
	 */
	@Column(name ="MAPPORT",nullable=true,length=32)
	public java.lang.String getMapport(){
		return this.mapport;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  mapport
	 */
	public void setMapport(java.lang.String mapport){
		this.mapport = mapport;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  mapcity
	 */
	@Column(name ="MAPCITY",nullable=true,length=32)
	public java.lang.String getMapcity(){
		return this.mapcity;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  mapcity
	 */
	public void setMapcity(java.lang.String mapcity){
		this.mapcity = mapcity;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  mapshowonline
	 */
	@Column(name ="MAPSHOWONLINE",nullable=true,length=32)
	public java.lang.String getMapshowonline(){
		return this.mapshowonline;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  mapshowonline
	 */
	public void setMapshowonline(java.lang.String mapshowonline){
		this.mapshowonline = mapshowonline;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  mapgrid
	 */
	@Column(name ="MAPGRID",nullable=true,length=3)
	public java.lang.String getMapgrid(){
		return this.mapgrid;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  mapgrid
	 */
	public void setMapgrid(java.lang.String mapgrid){
		this.mapgrid = mapgrid;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  mapcenterlongitude
	 */
	@Column(name ="MAPCENTERLONGITUDE",nullable=true,length=32)
	public java.lang.String getMapcenterlongitude(){
		return this.mapcenterlongitude;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  mapcenterlongitude
	 */
	public void setMapcenterlongitude(java.lang.String mapcenterlongitude){
		this.mapcenterlongitude = mapcenterlongitude;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  mapcenterlatitude
	 */
	@Column(name ="MAPCENTERLATITUDE",nullable=true,length=32)
	public java.lang.String getMapcenterlatitude(){
		return this.mapcenterlatitude;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  mapcenterlatitude
	 */
	public void setMapcenterlatitude(java.lang.String mapcenterlatitude){
		this.mapcenterlatitude = mapcenterlatitude;
	}
}
