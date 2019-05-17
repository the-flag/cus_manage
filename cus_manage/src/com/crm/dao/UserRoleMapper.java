package com.crm.dao;

import java.util.List;

import com.crm.pojo.UserRole;

public interface UserRoleMapper {
	
	/**
	 * 为用户添加角色
	 * @param userRole
	 * @return
	 */
	Integer insertUserRoles(List<UserRole> userRole);
	
	/**为用户添加角色
	 * 单条添加
	 * 
	 */
	Integer insertUserRole(UserRole userRole);
	/**
	 * 根据用户id 删除用户和角色的关联信息
	 * @param user_ids
	 * @return
	 */
	Integer deleteUserRoles(List<Integer> list);
	
	/**
	 * 根据用id和角色id删除对应的信息
	 * @param userRole
	 * @return
	 */
	Integer deleteUserRoleByUserIdAndRoleId(UserRole userRole);
}
