package com.map.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**   
 * @Title: Entity
 * @Description: 客户表
 * @author JiangBo
 *
 */
@Entity
@Table(name = "IB_CUSTOMER_INFO")
public class CustomerInfo implements java.io.Serializable {
    private static final long serialVersionUID = 0L;
	/**id*/
	private String id;
	/**address*/
	private String address;
	/**phone*/
	private String phone;
	/**telephone*/
	private String telephone;
	/**customerno*/
	private String customerNo;
	/**customername*/
	private String customerName;
	/**customerstate*/
	private String customerState;
	/**customertype*/
	private String customerType;
    /**
     * @return the id
     */
	@Id
    @Column(name = "ID", nullable = false)
    public String getId() {
        return id;
    }
    /**
     * @param id the id to set
     */
    public void setId(String id) {
        this.id = id;
    }
    /**
     * @return the address
     */
    @Column(name = "ADDRESS")
    public String getAddress() {
        return address;
    }
    /**
     * @param address the address to set
     */
    public void setAddress(String address) {
        this.address = address;
    }
    /**
     * @return the phone
     */
    @Column(name = "PHONE")
    public String getPhone() {
        return phone;
    }
    /**
     * @param phone the phone to set
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }
    /**
     * @return the telephone
     */
    @Column(name = "TELEPHONE")
    public String getTelephone() {
        return telephone;
    }
    /**
     * @param telephone the telephone to set
     */
    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }
    /**
     * @return the customerNo
     */
    @Column(name = "CUSTOMERNO")
    public String getCustomerNo() {
        return customerNo;
    }
    /**
     * @param customerNo the customerNo to set
     */
    public void setCustomerNo(String customerNo) {
        this.customerNo = customerNo;
    }
    /**
     * @return the customerName
     */
    @Column(name = "CUSTOMERNAME")
    public String getCustomerName() {
        return customerName;
    }
    /**
     * @param customerName the customerName to set
     */
    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }
    /**
     * @return the customerState
     */
    @Column(name = "CUSTOMERSTATE")
    public String getCustomerState() {
        return customerState;
    }
    /**
     * @param customerState the customerState to set
     */
    public void setCustomerState(String customerState) {
        this.customerState = customerState;
    }
    /**
     * @return the customerType
     */
    @Column(name = "CUSTOMERTYPE")
    public String getCustomerType() {
        return customerType;
    }
    /**
     * @param customerType the customerType to set
     */
    public void setCustomerType(String customerType) {
        this.customerType = customerType;
    }
}
