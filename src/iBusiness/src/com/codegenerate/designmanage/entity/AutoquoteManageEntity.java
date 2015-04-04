package com.codegenerate.designmanage.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**   
 * @Title: Entity
 * @Description: 自动报价页面
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_AUTOQUOTE")
public class AutoquoteManageEntity implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	// 吊顶面积
	private Double ceilingarea;
	// 瓷砖面积
	private Double tilearea;
	// 地板面积
	private Double floorarea;
	// 涂料面积
	private Double paintarea;
	// 建筑面积
	private Double totalbuildarea;
	// 使用面积
	private Double totaluserarea;
	// 总金额
	private Double totalamount;
	/**id*/
	private String id;
	/**scopeid*/
	private String scopeid;
	
	// 吊顶单价
	private Double ceilingUPrice;
	// 吊顶金额
	private Double ceilingamount;
	// 瓷砖单价
	private Double tileUPrice;
	// 瓷砖金额
	private Double tileamount;
	// 地板单价
	private Double floorUPrice;
	// 地板金额
	private Double flooramount;
	// 涂料单价
	private Double paintUPrice;
	// 涂料金额
	private Double paintamount;
	// 人工费
	private Double artificialAmount;
	
	/**
	 *方法: 取得Double
	 *@return: Double  ceilingarea
	 */
	@Column(name ="CEILINGAREA",nullable=true,precision=12,scale=2)
	public Double getCeilingarea(){
		return this.ceilingarea;
	}

	/**
	 *方法: 设置Double
	 *@param: Double  ceilingarea
	 */
	public void setCeilingarea(Double ceilingarea){
		this.ceilingarea = ceilingarea;
	}
	/**
	 *方法: 取得Double
	 *@return: Double  tilearea
	 */
	@Column(name ="TILEAREA",nullable=true,precision=12,scale=2)
	public Double getTilearea(){
		return this.tilearea;
	}

	/**
	 *方法: 设置Double
	 *@param: Double  tilearea
	 */
	public void setTilearea(Double tilearea){
		this.tilearea = tilearea;
	}
	/**
	 *方法: 取得Double
	 *@return: Double  floorarea
	 */
	@Column(name ="FLOORAREA",nullable=true,precision=12,scale=2)
	public Double getFloorarea(){
		return this.floorarea;
	}

	/**
	 *方法: 设置Double
	 *@param: Double  floorarea
	 */
	public void setFloorarea(Double floorarea){
		this.floorarea = floorarea;
	}
	/**
	 *方法: 取得Double
	 *@return: Double  paintarea
	 */
	@Column(name ="PAINTAREA",nullable=true,precision=12,scale=2)
	public Double getPaintarea(){
		return this.paintarea;
	}

	/**
	 *方法: 设置Double
	 *@param: Double  paintarea
	 */
	public void setPaintarea(Double paintarea){
		this.paintarea = paintarea;
	}
	/**
	 *方法: 取得Double
	 *@return: Double  totalbuildarea
	 */
	@Column(name ="TOTALBUILDAREA",nullable=true,precision=12,scale=2)
	public Double getTotalbuildarea(){
		return this.totalbuildarea;
	}

	/**
	 *方法: 设置Double
	 *@param: Double  totalbuildarea
	 */
	public void setTotalbuildarea(Double totalbuildarea){
		this.totalbuildarea = totalbuildarea;
	}
	/**
	 *方法: 取得Double
	 *@return: Double  totaluserarea
	 */
	@Column(name ="TOTALUSERAREA",nullable=true,precision=12,scale=2)
	public Double getTotaluserarea(){
		return this.totaluserarea;
	}

	/**
	 *方法: 设置Double
	 *@param: Double  totaluserarea
	 */
	public void setTotaluserarea(Double totaluserarea){
		this.totaluserarea = totaluserarea;
	}
	/**
	 *方法: 取得Double
	 *@return: Double  totalamount
	 */
	@Column(name ="TOTALAMOUNT",nullable=true,precision=15,scale=2)
	public Double getTotalamount(){
		return this.totalamount;
	}

	/**
	 *方法: 设置Double
	 *@param: Double  totalamount
	 */
	public void setTotalamount(Double totalamount){
		this.totalamount = totalamount;
	}
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
	 *@return: String  scopeid
	 */
	@Column(name ="SCOPEID",nullable=true,length=64)
	public String getScopeid(){
		return this.scopeid;
	}

	/**
	 *方法: 设置String
	 *@param: String  scopeid
	 */
	public void setScopeid(String scopeid){
		this.scopeid = scopeid;
	}
	/**
	 *方法: 取得Double
	 *@return: Double  ceilingamount
	 */
	@Column(name ="CEILINGAMOUNT",nullable=true,precision=12,scale=2)
	public Double getCeilingamount(){
		return this.ceilingamount;
	}

	/**
	 *方法: 设置Double
	 *@param: Double  ceilingamount
	 */
	public void setCeilingamount(Double ceilingamount){
		this.ceilingamount = ceilingamount;
	}
	/**
	 *方法: 取得Double
	 *@return: Double  tileamount
	 */
	@Column(name ="TILEAMOUNT",nullable=true,precision=12,scale=2)
	public Double getTileamount(){
		return this.tileamount;
	}

	/**
	 *方法: 设置Double
	 *@param: Double  tileamount
	 */
	public void setTileamount(Double tileamount){
		this.tileamount = tileamount;
	}
	/**
	 *方法: 取得Double
	 *@return: Double  flooramount
	 */
	@Column(name ="FLOORAMOUNT",nullable=true,precision=12,scale=2)
	public Double getFlooramount(){
		return this.flooramount;
	}

	/**
	 *方法: 设置Double
	 *@param: Double  flooramount
	 */
	public void setFlooramount(Double flooramount){
		this.flooramount = flooramount;
	}
	/**
	 *方法: 取得Double
	 *@return: Double  paintamount
	 */
	@Column(name ="PAINTAMOUNT",nullable=true,precision=12,scale=2)
	public Double getPaintamount(){
		return this.paintamount;
	}
	public void setPaintamount(Double paintamount){
		this.paintamount = paintamount;
	}
	/**
	 * @return the ceilingUPrice
	 */
	@Column(name ="CEILINGUPRICE")
	public Double getCeilingUPrice() {
		return ceilingUPrice;
	}
	public void setCeilingUPrice(Double ceilingUPrice) {
		this.ceilingUPrice = ceilingUPrice;
	}
	/**
	 * @return the tileUPrice
	 */
	@Column(name ="TILEUPRICE")
	public Double getTileUPrice() {
		return tileUPrice;
	}
	public void setTileUPrice(Double tileUPrice) {
		this.tileUPrice = tileUPrice;
	}
	/**
	 * @return the floorUPrice
	 */
	@Column(name ="FLOORUPRICE")
	public Double getFloorUPrice() {
		return floorUPrice;
	}
	public void setFloorUPrice(Double floorUPrice) {
		this.floorUPrice = floorUPrice;
	}
	/**
	 * @return the paintUPrice
	 */
	@Column(name ="PAINTUPRICE")
	public Double getPaintUPrice() {
		return paintUPrice;
	}
	public void setPaintUPrice(Double paintUPrice) {
		this.paintUPrice = paintUPrice;
	}
	/**
	 * @return the artificialAmount
	 */
	@Column(name ="ARTIFICIALAMOUNT")
	public Double getArtificialAmount() {
		return artificialAmount;
	}
	public void setArtificialAmount(Double artificialAmount) {
		this.artificialAmount = artificialAmount;
	}
}
