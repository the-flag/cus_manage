package com.crm.service;

import java.util.List;

import com.crm.pojo.FenYe;
import com.crm.pojo.Role;

public interface RoleService {
	/**
	 * 查询所有的角色信息
	 * @return
	 */
	List<Role> selectRole(); 
	
	/**
	 * 多条件分页查询数据，和多条件查询数据总条数
	 * @param fenYe
	 * @return
	 */
	FenYe selectRolesAndTotal(FenYe fenYe);
	
	
	/**
	 * 关联添加 添加角色获取自增id 
	 * 在模块角色中间表里 为新角色关联模块信息
	 * @param role
	 * @return
	 */
	Integer insertRole(Role role,String module_ids) throws Exception;
	
	
	/**
	 * 根据角色名称查询数据
	 * @param role_name
	 * @return
	 */
	Integer selectRoleByRoleName(String role_name);
}
