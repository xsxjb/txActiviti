package com.codegenerate.personmannager.entity;

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
 * @Description: 合同类型页面
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_CONTRACT_TYPE")
public class Contract_typeEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**typename*/
	private java.lang.String typename;
	/**typedescribe*/
	private java.lang.String typedescribe;
	/**id*/
	private java.lang.String id;
	/**scopeid*/
	private java.lang.String scopeid;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  typename
	 */
	@Column(name ="TYPENAME",nullable=true,length=32)
	public java.lang.String getTypename(){
		return this.typename;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  typename
	 */
	public void setTypename(java.lang.String typename){
		this.typename = typename;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  typedescribe
	 */
	@Column(name ="TYPEDESCRIBE",nullable=true,length=32)
	public java.lang.String getTypedescribe(){
		return this.typedescribe;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  typedescribe
	 */
	public void setTypedescribe(java.lang.String typedescribe){
		this.typedescribe = typedescribe;
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
}
