package com.crm.pojo;

import java.util.Date;
import java.util.List;

public class UserQueryParameters {


    private String user_name;

    private String min_creat_time;
    
    private String max_creat_time;

    private Integer user_isLock;

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

	public Integer getUser_isLock() {
		return user_isLock;
	}

	public void setUser_isLock(Integer user_isLock) {
		this.user_isLock = user_isLock;
	}

	@Override
	public String toString() {
		return "UserQueryParameters [user_name=" + user_name + ", min_creat_time=" + min_creat_time
				+ ", max_creat_time=" + max_creat_time + ", user_isLock=" + user_isLock + "]";
	}

}