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
import com.crm.util.ModuleTreeUtil;


@Controller
public class ModuleController {
	@Autowired
	private ModuleService moduleService;
	@Autowired 
	private ModuleTreeUtil treeUtil;
	
	
	@RequestMapping(value="/getModulePage",method=RequestMethod.GET)
	public String getModulePage() {
		return "module";
		
	}
	
	@RequestMapping(value="/getModuleTree",method=RequestMethod.POST)
	@ResponseBody
	public List<EasyUITreeJson> getModuleTree() {
		List<Module> selectUserPermById = moduleService.selectModules();
		List<EasyUITreeJson> listGetStree = treeUtil.listGetStree(selectUserPermById,null);
		List<EasyUITreeJson> listToTree = treeUtil.listToTree(listGetStree);
		return listToTree;
		
	}
	
	
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
	
	
}
