package com.crm.pojo;

/**
 * 条形图图一
 * @author dell
 *
 */
public class PiechartOneSelect {
	private String name;	//名称
	private Boolean value;	//数量
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Boolean getValue() {
		return value;
	}
	public void setValue(Boolean value) {
		this.value = value;
	}
	@Override
	public String toString() {
		return "PiechartOne [name=" + name + ", value=" + value + "]";
	}
	
	
	
	
}
