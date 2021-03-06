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
import com.crm.service.UserService;
import com.crm.util.EasyUITreeJson;
import com.crm.util.TreeUtil;

@Controller
public class MianController {
	@Autowired
	private UserService userService;
	@Autowired 
	private TreeUtil treeUtil;
	
	/**
	 * 跳转首页
	 * @return
	 */
	@RequestMapping(value="/getMain",method=RequestMethod.GET)
	public String getMain() {
		return "main";
		
	}
	
	
	/**
	 * 首页tree树控件 
	 * @param user_id
	 * @return
	 */
	@RequestMapping(value="/showHomeTree",method=RequestMethod.POST)
	@ResponseBody
	public List<EasyUITreeJson> showHomeTree(Integer user_id) {
		List<Module> selectUserPermById = userService.selectUserPermById(user_id);
		List<EasyUITreeJson> listGetStree = treeUtil.listGetStree(selectUserPermById);
		List<EasyUITreeJson> listToTree = treeUtil.listToTree(listGetStree);
		return listToTree;
		
	}
	
	
	
}
