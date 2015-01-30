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
 * @Description: PLC弹出页面控件对象配置表页面
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_POP_CONF_CTRLOBJ")
public class Pop_conf_ctrlobjEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**objname*/
	private java.lang.String objname;
	/**objtitle*/
	private java.lang.String objtitle;
	/**objtype*/
	private java.lang.String objtype;
	/**objimg*/
	private java.lang.String objimg;
	/**objimg2*/
	private java.lang.String objimg2;
	/**objimg3*/
	private java.lang.String objimg3;
	/**objimg4*/
	private java.lang.String objimg4;
	/**id*/
	private java.lang.String id;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  objname
	 */
	@Column(name ="OBJNAME",nullable=true,length=64)
	public java.lang.String getObjname(){
		return this.objname;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  objname
	 */
	public void setObjname(java.lang.String objname){
		this.objname = objname;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  objtitle
	 */
	@Column(name ="OBJTITLE",nullable=true,length=64)
	public java.lang.String getObjtitle(){
		return this.objtitle;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  objtitle
	 */
	public void setObjtitle(java.lang.String objtitle){
		this.objtitle = objtitle;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  objtype
	 */
	@Column(name ="OBJTYPE",nullable=true,length=16)
	public java.lang.String getObjtype(){
		return this.objtype;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  objtype
	 */
	public void setObjtype(java.lang.String objtype){
		this.objtype = objtype;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  objimg
	 */
	@Column(name ="OBJIMG",nullable=true,length=128)
	public java.lang.String getObjimg(){
		return this.objimg;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  objimg
	 */
	public void setObjimg(java.lang.String objimg){
		this.objimg = objimg;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  objimg2
	 */
	@Column(name ="OBJIMG2",nullable=true,length=128)
	public java.lang.String getObjimg2(){
		return this.objimg2;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  objimg2
	 */
	public void setObjimg2(java.lang.String objimg2){
		this.objimg2 = objimg2;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  objimg3
	 */
	@Column(name ="OBJIMG3",nullable=true,length=128)
	public java.lang.String getObjimg3(){
		return this.objimg3;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  objimg3
	 */
	public void setObjimg3(java.lang.String objimg3){
		this.objimg3 = objimg3;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  objimg4
	 */
	@Column(name ="OBJIMG4",nullable=true,length=128)
	public java.lang.String getObjimg4(){
		return this.objimg4;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  objimg4
	 */
	public void setObjimg4(java.lang.String objimg4){
		this.objimg4 = objimg4;
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
}
