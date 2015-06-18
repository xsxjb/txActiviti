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
@Table(name = "IB_TEST_S")
public class Test_sEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**scopeid*/
	private java.lang.String scopeid;
	/**id*/
	private java.lang.String id;
	private java.lang.String parentid;
	/**namea*/
	private java.lang.String namea;
	
	public java.lang.String getParentid() {
        return parentid;
    }

    public void setParentid(java.lang.String parentid) {
        this.parentid = parentid;
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
	 *@return: java.lang.String  namea
	 */
	@Column(name ="NAMEA",nullable=true,length=64)
	public java.lang.String getNamea(){
		return this.namea;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  namea
	 */
	public void setNamea(java.lang.String namea){
		this.namea = namea;
	}
}
