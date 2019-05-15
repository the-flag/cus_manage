package com.crm.service;

import java.util.List;

import com.crm.pojo.UserRole;

public interface UserRoleService {
	/**
	  * 关联用户和角色
	 * @param userRole
	 * @return
	 */
	Integer insertUserRole(List<UserRole> list) throws Exception;
	
	/**
	 * 根据用户id 删除用户和角色的关联信息
	 * @param user_ids
	 * @return
	 */
	Integer deleteUserRoles(String user_ids) throws Exception;
}
