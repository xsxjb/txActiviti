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
 * @Description: 空调控制记录
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_AIRCONDITIONLOG")
public class AirconditionlogEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**id*/
	private java.lang.String id;
	/**eventtime*/
	private java.util.Date eventtime;
	/**controlinfo*/
	private java.lang.String controlinfo;
	/**controluser*/
	private java.lang.String controluser;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  id
	 */
	
	@Id
	@GeneratedValue(generator = "paymentableGenerator")
	@GenericGenerator(name = "paymentableGenerator", strategy = "uuid")
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
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  eventtime
	 */
	@Column(name ="EVENTTIME",nullable=true)
	public java.util.Date getEventtime(){
		return this.eventtime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  eventtime
	 */
	public void setEventtime(java.util.Date eventtime){
		this.eventtime = eventtime;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  controlinfo
	 */
	@Column(name ="CONTROLINFO",nullable=true,length=512)
	public java.lang.String getControlinfo(){
		return this.controlinfo;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  controlinfo
	 */
	public void setControlinfo(java.lang.String controlinfo){
		this.controlinfo = controlinfo;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  controluser
	 */
	@Column(name ="CONTROLUSER",nullable=true,length=64)
	public java.lang.String getControluser(){
		return this.controluser;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  controluser
	 */
	public void setControluser(java.lang.String controluser){
		this.controluser = controluser;
	}
}
