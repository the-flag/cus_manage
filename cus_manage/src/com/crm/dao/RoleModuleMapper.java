package com.crm.dao;

import com.crm.pojo.RoleModule;

public interface RoleModuleMapper {
	
	/**
	 * 添加角色和模块的关联信息
	 * @param roleModule
	 * @return
	 */
	Integer insertRoleModule(RoleModule roleModule);
}
