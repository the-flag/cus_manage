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
public class HomeController {
	@Autowired
	private UserService userService;
	@Autowired 
	private TreeUtil treeUtil;
	
	@RequestMapping(value="/getHome",method=RequestMethod.GET)
	public String getHome() {
		return "home";
		
	}
}
