package com.crm.service;

import java.util.List;

import com.crm.pojo.FenYe;
import com.crm.pojo.Module;
import com.crm.pojo.User;
import com.crm.pojo.UserQueryParameters;

public interface UserService {
	
	List<User> selectUser();
	
	FenYe selectUsersByFenYe(FenYe fenYe);
	
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
	 * 根据用户id修改用户信息
	 * @param user
	 * @return
	 */
	Integer updateUser(User user);
	
	/**
	  * 重置密码 --- 根据用户id 修改密码
	 * @param user_id
	 * @return
	 */
	Integer updatePasswordByUserId(Integer user_id);
	
	/**
	  * 修改用户是否锁定 --- 根据用户id 修改
	 * @param user_id
	 * @return
	 */
	Integer updateUserIsLockByUserId(User user);
	
	/**
	 * 	根据账号修改用户
	 * @param user
	 * @return
	 */
	Integer updateUserByAccount(User user);
	
	
	/**
	 * 	根据账号修改用户登陆的错误次数
	 * @param user
	 * @return
	 */
	Integer updateUserWrongNumberByAccount(User user);
	
	
	/**
	 * 根据用户的id查询出其所有的权限
	 * @param user_id
	 * @return
	 */
	List<Module> selectUserPermById(Integer user_id);
	
	/**
	  *  关联增加 --增加用户时增加角色
	  * 在用户和角色的中间表 关联用户id和角色id
	 * @param user
	 * @param roleids
	 * @return
	 */
	Integer insertUserAndRole(User user,String roleids);
	
	
	/**
	 * 批量删除
	 * @param user_ids
	 * @return
	 */
	Integer deleteUsers(String user_ids)throws Exception;
	
}
