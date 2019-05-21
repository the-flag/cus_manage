package com.crm.pojo;

/**
 * 用户和客户中间表
 * @author dell
 *
 */
public class UserCust {
	private Integer user_cust_id;
	private Integer user_id;
	private Integer customer_id;
	public Integer getUser_cust_id() {
		return user_cust_id;
	}
	public void setUser_cust_id(Integer user_cust_id) {
		this.user_cust_id = user_cust_id;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public Integer getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(Integer customer_id) {
		this.customer_id = customer_id;
	}
	@Override
	public String toString() {
		return "UserCust [user_cust_id=" + user_cust_id + ", user_id=" + user_id + ", customer_id=" + customer_id + "]";
	}
	
	
	
}
