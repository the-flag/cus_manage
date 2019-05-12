package com.crm.pojo;

public class Module {
	private Integer module_id;
	private String module_name;
	private String module_url;
	private Integer module_weight;
	private Integer module_parent;
	public Integer getModule_id() {
		return module_id;
	}
	public void setModule_id(Integer module_id) {
		this.module_id = module_id;
	}
	public String getModule_name() {
		return module_name;
	}
	public void setModule_name(String module_name) {
		this.module_name = module_name;
	}
	public String getModule_url() {
		return module_url;
	}
	public void setModule_url(String module_url) {
		this.module_url = module_url;
	}
	public Integer getModule_weight() {
		return module_weight;
	}
	public void setModule_weight(Integer module_weight) {
		this.module_weight = module_weight;
	}
	public Integer getModule_parent() {
		return module_parent;
	}
	public void setModule_parent(Integer module_parent) {
		this.module_parent = module_parent;
	}
	@Override
	public String toString() {
		return "Module [module_id=" + module_id + ", module_name=" + module_name + ", module_url=" + module_url
				+ ", module_weight=" + module_weight + ", module_parent=" + module_parent + "]";
	}
	
	
}
