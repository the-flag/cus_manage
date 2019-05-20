package com.crm.pojo;

import java.util.List;

public class CustomerTrackParameters {
  private List<String> s;
  private Integer user_id;
public List<String> getS() {
	return s;
}
public void setS(List<String> s) {
	this.s = s;
}
public Integer getUser_id() {
	return user_id;
}
public void setUser_id(Integer user_id) {
	this.user_id = user_id;
}
@Override
public String toString() {
	return "CustomerTrackParameters [s=" + s + ", user_id=" + user_id + "]";
}

}
