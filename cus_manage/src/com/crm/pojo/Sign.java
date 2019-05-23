package com.crm.pojo;

public class Sign {
	private Integer sign_id;
	private String user_leave_time;
	private String user_login_time;
	private Integer user_id;
	@Override
	public String toString() {
		return "Sign [sign_id=" + sign_id + ", user_leave_time=" + user_leave_time + ", user_login_time="
				+ user_login_time + ", user_id=" + user_id + "]";
	}
	public Integer getSign_id() {
		return sign_id;
	}
	public void setSign_id(Integer sign_id) {
		this.sign_id = sign_id;
	}
	public String getUser_leave_time() {
		return user_leave_time;
	}
	public void setUser_leave_time(String user_leave_time) {
		this.user_leave_time = user_leave_time;
	}
	public String getUser_login_time() {
		return user_login_time;
	}
	public void setUser_login_time(String user_login_time) {
		this.user_login_time = user_login_time;
	}
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}

}
