package com.crm.dao;

import java.util.List;

import com.crm.pojo.Module;
import com.crm.pojo.User;

public interface UserMapper {
	
	List<User> selectUser();
	
	/**
	 * 根据用户id查询，所具有的权限
	 * @param user_id
	 * @return
	 */
	List<Module> selectUserPermById(Integer user_id);
	
	/**
	 * 根据用户的账户、密码查询对应的用户 ==登陆
	 * @param user
	 * @return
	 */
	User selectUserByAccount(User user);
	
	/**
	 * 根据免登陆凭证uuid查找用户
	 * @param uuid
	 * @return
	 */
	User selectUserByUuid(String uuid);
	/**
	 * 	修改用户
	 * @param user
	 * @return
	 */
	Integer updateUser(User user);
		
	
}
