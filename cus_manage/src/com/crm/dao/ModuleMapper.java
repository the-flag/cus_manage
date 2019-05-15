package com.crm.dao;

import java.util.List;

import com.crm.pojo.Module;

public interface ModuleMapper {
	/**
	 * 查询所有的模块信息
	 * @return
	 */
	List<Module> selectModules();
	/**
	 * 根据角色id查询所有模块信息
	 * 模块和角色模块中间表联查
	 * @param role_id
	 * @return
	 */
	List<Module> selectModulesByRoleId(Integer role_id);
	
	/**
	 * 根据角色id所有查询模块id
	 * 模块和角色模块中间表联查
	 * @param role_id
	 * @return
	 */
	List<Integer> selectModuleByRoleId(Integer role_id);
}
