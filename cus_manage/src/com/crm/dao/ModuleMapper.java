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
	 * 根据模块id查询对应的模块信息
	 * @param module_id
	 * @return
	 */
	Module selectModuleByModuleId(Integer module_id);
	
	/**
	 * 根据角色id所有查询模块id
	 * 模块和角色模块中间表联查
	 * @param role_id
	 * @return
	 */
	List<Integer> selectModuleByRoleId(Integer role_id);
	
	/**
	 * 根据模块名称,模块父id查询，
	 * 判断在同一个父节点下是否该名称重复
	 * @param module_name
	 * @return
	 */
	Module selectModuleByModuleName(Module module);
	
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
	 * 根据模块id删除模块信息,
	 * 删除时判断当前是否时父节点，
	 * 		不是父节点
	 * 			判断是否有角色引用
	 * 		是父节点
	 * 			判断所有的字节的是否有角色引用
	 * 被角色引用时不删除
	 * @param module
	 * @return
	 */
	Integer deleteModule(Integer module_id);
	
	/**
	 * 根据模块父id删除模块信息
	 * @param module
	 * @return
	 */
	Integer deleteModulesByModuleParentId(Integer module_parent_id);
	

}
