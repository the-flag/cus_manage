package com.crm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.pojo.Role;
import com.crm.service.RoleService;


@Controller
public class RoleController {
	@Autowired
	private RoleService roleService;
	@RequestMapping(value="/getRolePage",method=RequestMethod.GET)
	public String getRolePage() {
		return "role";
		
	}
	
	@RequestMapping(value="/getRole",method=RequestMethod.POST)
	@ResponseBody
	public List<Role> getRole() {
		return roleService.selectRole();
		
	}
}
