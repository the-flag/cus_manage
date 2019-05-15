package com.crm.service;

import com.crm.pojo.RoleModule;

public interface RoleModuleService {
	/**
	 * 添加角色和模块的关联信息
	 * @param roleModule
	 * @return
	 */
	Integer insertRoleModule(RoleModule roleModule) throws Exception;
}
