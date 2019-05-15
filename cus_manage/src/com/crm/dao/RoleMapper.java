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
	/**
	 * 多条件分页查询
	 * @param fenYe
	 * @return
	 */
	List<Role> selectRolesByFenYe(FenYe fenYe);
	
	/**
	 * 多条件查询数据总条数
	 */
	Integer selectRoleCountByFenYe(FenYe fenYe);
	
	/**
	 * 关联添加 添加角色获取自增id 
	 * 在模块角色中间表里 为新角色关联模块信息
	 * @param role
	 * @return
	 */
	Integer insertRole(Role role);
	
	/**
	 * 根据角色名称查询数据
	 * @param role_name
	 * @return
	 */
	Integer selectRoleByRoleName(String role_name);
	
	/**
	 * 修改角色信息
	 * @param role
	 * @return
	 */
	Integer updateRole(Role role);
	
	/**
	 * 删除角色信息
	 * @param role
	 * @return
	 */
	Integer deteleRole(Integer role_id);
	
	
}
