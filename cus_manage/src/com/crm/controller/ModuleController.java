package com.crm.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.pojo.Module;
import com.crm.service.ModuleService;
import com.crm.util.EasyUITreeJson;
import com.crm.util.ModuleTreeExcludeUrl;
import com.crm.util.ModuleTreeUtil;


@Controller
public class ModuleController {
	@Autowired
	private ModuleService moduleService;
	@Autowired 
	private ModuleTreeUtil treeUtil;
	@Autowired
	private ModuleTreeExcludeUrl moduleTreeExcludeUrl;
	
	
	@RequestMapping(value="/getModulePage",method=RequestMethod.GET)
	public String getModulePage() {
		return "module";
		
	}
	/**
	 * 查询所有的模块  
	 * @return
	 */
	@RequestMapping(value="/getModuleTree",method=RequestMethod.POST)
	@ResponseBody
	public List<EasyUITreeJson> getModuleTree() {
		List<Module> selectUserPermById = moduleService.selectModules();
		List<EasyUITreeJson> listGetStree = treeUtil.listGetStree(selectUserPermById,null);
		List<EasyUITreeJson> listToTree = treeUtil.listToTree(listGetStree);
		return listToTree;
		
	}
	
	
	/**
	 * 模块下拉框
	 * @return
	 */
	@RequestMapping(value="/getModuleCombotree",method=RequestMethod.POST)
	@ResponseBody
	public List<EasyUITreeJson> getModuleCombotree() {
		List<Module> selectUserPermById = moduleService.selectModules();
		List<EasyUITreeJson> listGetStree = moduleTreeExcludeUrl.listGetStree(selectUserPermById);
		List<EasyUITreeJson> listToTree = moduleTreeExcludeUrl.listToTree(listGetStree);
		return listToTree;
		
	}
	
	/**
	 * 根据角色id查询对应模块
	 * 当前角色的模块设置为选中状态
	 * @param role_id
	 * @return
	 */
	@RequestMapping(value="/getModuleTreeByRoleId",method=RequestMethod.POST)
	@ResponseBody
	public List<EasyUITreeJson> getModuleTreeByRoleId(Integer role_id) {
		
		List<Integer> selectModuleByRoleId = moduleService.selectModuleByRoleId(role_id);
		for(Integer i:selectModuleByRoleId) {
			System.out.println("sdfsdfsdf;;;;;"+i);
		}
		List<Module> selectUserPermById = moduleService.selectModules();
		List<EasyUITreeJson> listGetStree = treeUtil.listGetStree(selectUserPermById,selectModuleByRoleId);
		List<EasyUITreeJson> listToTree = treeUtil.listToTree(listGetStree);
		return listToTree;
		
	}
	
	@RequestMapping(value="/deleteModule",method=RequestMethod.POST)
	@ResponseBody
	public Integer deleteModule(Integer module_id) {
		
		return moduleService.deleteModule(module_id);
		
	}
	
	/**
	 * 修改时验证模块名称是否已存在
	 * @param module
	 * @return
	 */
	@RequestMapping(value="/moduleValidata",method=RequestMethod.POST)
	@ResponseBody
	public Boolean moduleValidata(Module module) {
		
		 Module selectModuleByModuleName = moduleService.selectModuleByModuleName(module.getModule_name());
		 if(selectModuleByModuleName!=null) {
			 if(selectModuleByModuleName.getModule_id()==module.getModule_id()) {
				 return true;
			 }
			 return false;
		 }
		 return true;
		
	}
	
	/**
	 * 修改模块
	 * @param module
	 * @return
	 */
	@RequestMapping(value="/updateModule",method=RequestMethod.POST)
	@ResponseBody
	public Integer updateModule(Module module) {
		
		return moduleService.updateModule(module);
		
	}
	/**
	 * 添加模块时不能存在重复的模块名称
	 * @param module
	 * @return
	 */
	@RequestMapping(value="/insertModule",method=RequestMethod.POST)
	@ResponseBody
	public Integer insertModule(Module module) {
		System.out.println(module+"::::");
		return moduleService.insertModule(module);
		
	}
	
	
	
	
	
}
