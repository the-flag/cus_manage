package com.crm.pojo;

/**
 * 条形图图一
 * @author dell
 *
 */
public class PiechartOne {
	private String name;	//名称
	private Integer value;	//数量
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getValue() {
		return value;
	}
	public void setValue(Integer value) {
		this.value = value;
	}
	@Override
	public String toString() {
		return "PiechartOne [name=" + name + ", value=" + value + "]";
	}
	
	
	
	
	
}
