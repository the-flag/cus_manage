package com.crm.dao;

import java.util.List;

import com.crm.pojo.FenYe;
import com.crm.pojo.Module;
import com.crm.pojo.User;

public interface UserMapper {
	
	/**
	 * 测试
	 * @return
	 */
	List<User> selectUser();
	
	/**
	 * 多条件分页查询用户数据
	 * @param fenYe
	 * @return
	 */
	List<User> selectUsersByFenYe(FenYe fenYe);
	
	/**
	 * 多条件查询数据总条数
	 * @param fenYe
	 * @return
	 */
	Integer selectUserCountByFenYe(FenYe fenYe);
	
	
	
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
	
	/**
	 * 	根据账号修改用户
	 * @param user
	 * @return
	 */
	Integer updateUserByAccount(User user);
	
	/**
	  * 重置密码 --- 根据用户id 修改密码
	 * @param user_id
	 * @return
	 */
	Integer updatePasswordByUserId(Integer user_id);
	
	/**
	 * 	根据账号修改用户登陆的错误次数
	 * @param user
	 * @return
	 */
	Integer updateUserWrongNumberByAccount(User user);

	/**
	  * 修改用户是否锁定 --- 根据用户id 修改
	 * @param user_id
	 * @return
	 */
	Integer updateUserIsLockByUserId(User user);
	
	/**
	 * 添加用户
	 * @param user
	 * @return
	 */
	Integer insertUser(User user);
		
	/**
	 * 批量删除
	 * @param list Integer集合 用户id
	 * @return
	 */
	Integer deleteUsers(List<Integer> list);
	
	
}
