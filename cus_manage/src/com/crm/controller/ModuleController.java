package com.crm.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class ModuleController {
	@RequestMapping(value="/getmodule",method=RequestMethod.GET)
	public String getmodule() {
		return "WEB-INF/jsp/module";
		
	}
}
