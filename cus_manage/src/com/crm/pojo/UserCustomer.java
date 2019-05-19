package com.crm.pojo;

public class UserCustomer {
	private Integer id;
	private Integer userID;
	private String CusId;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUserID() {
		return userID;
	}
	public void setUserID(Integer userID) {
		this.userID = userID;
	}
	public String getCusId() {
		return CusId;
	}
	public void setCusId(String cusId) {
		CusId = cusId;
	}
	@Override
	public String toString() {
		return "CusUser [id=" + id + ", userID=" + userID + ", CusId=" + CusId + "]";
	}
}
