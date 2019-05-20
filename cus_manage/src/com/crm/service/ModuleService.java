package com.crm.service;

import java.util.List;

import com.crm.pojo.Module;

public interface ModuleService {
	/**
	 * 查询所有的模块信息
	 * @return
	 */
	List<Module> selectModules();
	
	
	/**
	 * 根据角色id
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
	
	
	/**
	 * 根据模块名称查询，是否该模块已存在
	 * @param module_name
	 * @return
	 */
	Module selectModuleByModuleName(String module_name);
	
	/**
	 * 添加模块信息
	 * @param module
	 * @return
	 */
	Integer insertModule(Module module);
	
	/**
	 * 修改模块信息
	 * @param module
	 * @return
	 */
	Integer updateModule(Module module);
	
	/**
	 * 删除模块信息
	 * @param module
	 * @return
	 */
	Integer deleteModule(Integer module_id);
	
}
