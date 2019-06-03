package com.crm.dao;

import java.util.List;
import java.util.Map;

import com.crm.pojo.FenYe;
import com.crm.pojo.Module;
import com.crm.pojo.User;

public interface UserMapper {
	/**
	 * 查询出所有的用户的基本信息
	 * @return
	 */
	List<User> selectUserInfo();
	
	/**
	 * 查询角色为咨询师且当天以签到的用户
	 * @return
	 */
	List<User> selectUser();
	
	/**
	 * 查询已签到的用户
	 * @return
	 */
	List<User> selectUserByUserStatus();
	
	/**
	 * 判断邮箱的重复性
	 * 
	 * @param user_email
	 * @return 返回值类型Integer 0=false=存在相同的 
	 * 							 1=true=不存在
	 */
	Integer selectUserByUserEmail(String user_email);
	
	/**
	 * 根据角色id查询用户的数量
	 * @param role_id
	 * @return
	 */
	Integer selecctUserCountByRoleId(Integer role_id);
	
	
	/**
	 * 全部员工
	 * 查询签到人数
	 * 判断签到时间是今天
	 * @return
	 */
	Integer selectUserByUserLoginTimeAndQiandao();
	/**
	 * 全部员工
	 * 查询迟到人数
	 * 判断当天签到时间小于8点
	 * @return
	 */
	Integer selectUserByUserLoginTimeAndChidao();
	/**
	 * 全部员工
	 * 查询未签到人数
	 * 判断今天没有签到时间
	 * @return
	 */
	Integer selectUserByUserLoginTimeAndWeiqian();
	
	
	/**
	 * 个人
	 * 查询签到人数
	 * 判断签到时间是今天
	 * @return
	 */
	Map<String, Object> selectUserByUserLoginTimeAndQiandaoPersonal(Integer user_id);
	/**
	 * 个人
	 * 查询迟到人数
	 * 判断当天签到时间小于8点
	 * @return
	 */
	Map<String, Object> selectUserByUserLoginTimeAndChidaoPersonal(Integer user_id);
	
	
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
	 * 根据用户的账户、邮箱、手机，三种方式中的一种查询对应的用户信息 ==登陆
	 * @param user
	 * @return
	 */
	
	User selectUserByAccountOrEmailOrPhone(User user);
	
	/**
	 * 根据用户的手机号查询对应的用户信息 ==通过手机验证码重置密码
	 * @param user
	 * @return
	 */
	User selectUserByPhone(String user_phone);
	
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
	  * 重置密码 --- 根据用户id手机号 重置密码
	 * @param user_id
	 * @return
	 */
	
	Integer updatePasswordByUserPhone(String user_phone);
	
	
	
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
