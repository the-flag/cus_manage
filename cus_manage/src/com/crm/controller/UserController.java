package com.crm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.pojo.FenYe;
import com.crm.pojo.User;
import com.crm.service.UserService;
import com.google.gson.Gson;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	
	@RequestMapping("/showuser")
	@ResponseBody
	public String showuser() {
		List<User> selectUser = userService.selectUser();
		FenYe fenYe =new FenYe();
		fenYe.setTotal(10);
		fenYe.setRows(selectUser);
		Gson gson=new Gson();
		System.out.println("sdfsd");
		return gson.toJson(fenYe);
	}
}
