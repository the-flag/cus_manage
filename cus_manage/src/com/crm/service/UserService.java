package com.crm.service;

import java.util.List;

import com.crm.pojo.User;

public interface UserService {
	List<User> selectUser();
	
	/**
	  * 根据用户账号查询用户信息
	 * @param user
	 * @return
	 */
	User selectUserByAccount(User user);
	
	/**
	 * 根据免登陆凭证查询用户信息
	 * @param user
	 * @return
	 */
	User selectUserByUuid(String uuid);
	
	/**
	 * 修改用户信息
	 * @param user
	 * @return
	 */
	Integer updateUser(User user);
	
}
