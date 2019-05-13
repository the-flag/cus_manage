package com.crm.pojo;

public class Module {
    private Integer module_id;

    private String module_name;

    private String module_path;

    private Integer module_weight;

    private Integer module_parent_id;

    private Role role;
    
    
    
    
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

	public String getModule_path() {
		return module_path;
	}

	public void setModule_path(String module_path) {
		this.module_path = module_path;
	}

	public Integer getModule_weight() {
		return module_weight;
	}

	public void setModule_weight(Integer module_weight) {
		this.module_weight = module_weight;
	}

	public Integer getModule_parent_id() {
		return module_parent_id;
	}

	public void setModule_parent_id(Integer module_parent_id) {
		this.module_parent_id = module_parent_id;
	}
	
	
	
	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "Module [module_id=" + module_id + ", module_name=" + module_name + ", module_path=" + module_path
				+ ", module_weight=" + module_weight + ", module_parent_id=" + module_parent_id + ", role=" + role
				+ "]";
	}

	

	
    
}