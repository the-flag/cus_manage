package com.crm.dao;

import java.util.List;

import com.crm.pojo.UserRole;

public interface UserRoleMapper {
	
	/**
	 * 为用户添加角色
	 * @param userRole
	 * @return
	 */
	Integer insertUserRole(List<UserRole> userRole);
	
	/**
	 * 根据用户id 删除用户和角色的关联信息
	 * @param user_ids
	 * @return
	 */
	Integer deleteUserRoles(String user_ids);
}
