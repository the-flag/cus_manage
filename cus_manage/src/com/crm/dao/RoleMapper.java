package com.crm.dao;

import java.util.List;

import com.crm.pojo.FenYe;
import com.crm.pojo.Module;
import com.crm.pojo.Role;
import com.crm.pojo.User;

public interface RoleMapper {
	
	/**
	 * 根据用户id查询
	 * @param user_id
	 * @return
	 */
	List<Role> selectRoleByUserId(Integer user_id);
	
	/**
	 * 查询所有角色信息
	 * @return
	 */
	List<Role> selectRole();
	
}
