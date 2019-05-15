package com.crm.service;

import java.util.List;

import com.crm.pojo.RoleModule;

public interface RoleModuleService {
	/**
	 * 添加角色和模块的关联信息
	 * @param roleModule
	 * @return
	 */
	Integer insertRoleModule(List<RoleModule> list) throws Exception;
	
	
	/**
	 * 根据角色id 删除所有对应的角色和模块信息
	 * @param role_id
	 * @return
	 */
	Integer deleteRoleModuleByRoleId(Integer role_id);
	
	
}
