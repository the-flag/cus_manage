package com.crm.pojo;

import org.springframework.stereotype.Component;

@Component
public class RoleModule {
    private Integer role_module_id;

    private Integer role_id;

    private Integer module_id;
    
    
    
	public Integer getRole_module_id() {
		return role_module_id;
	}



	public void setRole_module_id(Integer role_module_id) {
		this.role_module_id = role_module_id;
	}



	public Integer getRole_id() {
		return role_id;
	}



	public void setRole_id(Integer role_id) {
		this.role_id = role_id;
	}



	public Integer getModule_id() {
		return module_id;
	}



	public void setModule_id(Integer module_id) {
		this.module_id = module_id;
	}



	@Override
	public String toString() {
		return "RoleModule [role_module_id=" + role_module_id + ", role_id=" + role_id + ", module_id=" + module_id
				+ "]";
	}

   
}