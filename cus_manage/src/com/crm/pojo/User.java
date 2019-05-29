package com.crm.pojo;

import java.util.Date;
import java.util.List;

public class User {
    private Integer user_id;

    private String user_account;

    private String user_password;
    private Integer user_age;
    
	private String user_name;

    private Integer user_sex;

    private String user_creat_time;

   
	private Integer user_is_lock;

    private Integer user_wrong_number;

    private String user_email;

    private String user_phone;
    
    private Integer user_weight;
    private String user_login_time;//签到时间
	private String user_end_time;//签退时间
	private Integer user_status;//签到状态
    private String user_uuid;
    private Integer customer_num;//客户数量
    //引用角色
    private List<Role> roles;
    
    
    
    
    
	public Integer getCustomer_num() {
		return customer_num;
	}
	public void setCustomer_num(Integer customer_num) {
		this.customer_num = customer_num;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public String getUser_account() {
		return user_account;
	}
	public void setUser_account(String user_account) {
		this.user_account = user_account;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public Integer getUser_age() {
		return user_age;
	}
	public void setUser_age(Integer user_age) {
		this.user_age = user_age;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public Integer getUser_sex() {
		return user_sex;
	}
	public void setUser_sex(Integer user_sex) {
		this.user_sex = user_sex;
	}
	public String getUser_creat_time() {
		return user_creat_time;
	}
	public void setUser_creat_time(String user_creat_time) {
		this.user_creat_time = user_creat_time;
	}
	public Integer getUser_is_lock() {
		return user_is_lock;
	}
	public void setUser_is_lock(Integer user_is_lock) {
		this.user_is_lock = user_is_lock;
	}
	public Integer getUser_wrong_number() {
		return user_wrong_number;
	}
	public void setUser_wrong_number(Integer user_wrong_number) {
		this.user_wrong_number = user_wrong_number;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public Integer getUser_weight() {
		return user_weight;
	}
	public void setUser_weight(Integer user_weight) {
		this.user_weight = user_weight;
	}
	public String getUser_login_time() {
		return user_login_time;
	}
	public void setUser_login_time(String user_login_time) {
		this.user_login_time = user_login_time;
	}
	public String getUser_end_time() {
		return user_end_time;
	}
	public void setUser_end_time(String user_end_time) {
		this.user_end_time = user_end_time;
	}
	public Integer getUser_status() {
		return user_status;
	}
	public void setUser_status(Integer user_status) {
		this.user_status = user_status;
	}
	public String getUser_uuid() {
		return user_uuid;
	}
	public void setUser_uuid(String user_uuid) {
		this.user_uuid = user_uuid;
	}
	public List<Role> getRoles() {
		return roles;
	}
	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}
	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", user_account=" + user_account + ", user_password=" + user_password
				+ ", user_age=" + user_age + ", user_name=" + user_name + ", user_sex=" + user_sex
				+ ", user_creat_time=" + user_creat_time + ", user_is_lock=" + user_is_lock + ", user_wrong_number="
				+ user_wrong_number + ", user_email=" + user_email + ", user_phone=" + user_phone + ", user_weight="
				+ user_weight + ", user_login_time=" + user_login_time + ", user_end_time=" + user_end_time
				+ ", user_status=" + user_status + ", user_uuid=" + user_uuid + ", roles=" + roles + "]";
	}
    
    
   
    
    


}