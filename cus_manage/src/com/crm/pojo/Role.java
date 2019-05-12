package com.crm.pojo;

public class Role {
	private Integer role_id;
	private String role_name;
	private Integer role_usetotal;
	public Integer getRole_id() {
		return role_id;
	}
	public void setRole_id(Integer role_id) {
		this.role_id = role_id;
	}
	public String getRole_name() {
		return role_name;
	}
	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}
	public Integer getRole_usetotal() {
		return role_usetotal;
	}
	public void setRole_usetotal(Integer role_usetotal) {
		this.role_usetotal = role_usetotal;
	}
	@Override
	public String toString() {
		return "Role [role_id=" + role_id + ", role_name=" + role_name + ", role_usetotal=" + role_usetotal + "]";
	}
	
	
}
