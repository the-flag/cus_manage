package com.crm.service;

import java.util.List;

import com.crm.pojo.Role;

public interface RoleService {
	/**
	 * 查询所有的角色信息
	 * @return
	 */
	List<Role> selectRole(); 
}
