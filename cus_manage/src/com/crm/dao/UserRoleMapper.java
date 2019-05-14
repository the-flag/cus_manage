package com.crm.dao;

import com.crm.pojo.UserRole;

public interface UserRoleMapper {
	
	/**
	 * 为用户添加角色
	 * @param userRole
	 * @return
	 */
	Integer insertUserRole(UserRole userRole);
	
	/**
	 * 根据用户id 删除用户和角色的关联信息
	 * @param user_ids
	 * @return
	 */
	Integer deleteUserRoles(String user_ids);
}
