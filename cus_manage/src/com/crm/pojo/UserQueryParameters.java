package com.crm.pojo;

import java.util.Date;
import java.util.List;

public class UserQueryParameters {


    private String user_name;

    private String min_creat_time;
    
    private String max_creat_time;

    private Integer user_is_lock;
    
    private String user_login_time;

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getMin_creat_time() {
		return min_creat_time;
	}

	public void setMin_creat_time(String min_creat_time) {
		this.min_creat_time = min_creat_time;
	}

	public String getMax_creat_time() {
		return max_creat_time;
	}

	public void setMax_creat_time(String max_creat_time) {
		this.max_creat_time = max_creat_time;
	}

	public Integer getUser_is_lock() {
		return user_is_lock;
	}

	public void setUser_is_lock(Integer user_is_lock) {
		this.user_is_lock = user_is_lock;
	}
	

	public String getUser_login_time() {
		return user_login_time;
	}

	public void setUser_login_time(String user_login_time) {
		this.user_login_time = user_login_time;
	}

	@Override
	public String toString() {
		return "UserQueryParameters [user_name=" + user_name + ", min_creat_time=" + min_creat_time
				+ ", max_creat_time=" + max_creat_time + ", user_is_lock=" + user_is_lock + "]";
	}

	

}