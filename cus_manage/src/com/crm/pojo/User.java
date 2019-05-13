package com.crm.pojo;

import java.util.Date;
import java.util.List;

public class User {
    private Integer user_id;

    private String user_account;

    private String user_password;

    private String user_name;

    private Integer user_sex;

    private Date user_creat_time;

    private Date user_login_time;

    private Integer user_isLock;

    private Integer user_wrong_number;

    private String user_email;

    private String user_phone;
    
    private Integer user_weight;
    
    private String user_uuid;
    //引用角色
    private List<Role> roles;
    
    
    
	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
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

	public Date getUser_creat_time() {
		return user_creat_time;
	}

	public void setUser_creat_time(Date user_creat_time) {
		this.user_creat_time = user_creat_time;
	}

	public Date getUser_login_time() {
		return user_login_time;
	}

	public void setUser_login_time(Date user_login_time) {
		this.user_login_time = user_login_time;
	}

	public Integer getUser_isLock() {
		return user_isLock;
	}

	public void setUser_isLock(Integer user_isLock) {
		this.user_isLock = user_isLock;
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
	

	public String getUser_uuid() {
		return user_uuid;
	}

	public void setUser_uuid(String user_uuid) {
		this.user_uuid = user_uuid;
	}

	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", user_account=" + user_account + ", user_password=" + user_password
				+ ", user_name=" + user_name + ", user_sex=" + user_sex + ", user_creat_time=" + user_creat_time
				+ ", user_login_time=" + user_login_time + ", user_isLock=" + user_isLock + ", user_wrong_number="
				+ user_wrong_number + ", user_email=" + user_email + ", user_phone=" + user_phone + ", user_weight="
				+ user_weight + ", user_uuid=" + user_uuid + ", roles=" + roles + "]";
	}

	


}