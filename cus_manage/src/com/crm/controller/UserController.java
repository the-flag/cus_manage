package com.crm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	public FenYe showuser(FenYe fenYe,Integer rows) {
		fenYe.setRow(rows);
		fenYe.setPage((fenYe.getPage()-1)*rows);
		FenYe selectUsersByFenYe = userService.selectUsersByFenYe(fenYe);
		return selectUsersByFenYe;
	}
	
	
	@RequestMapping(value="/getuser",method=RequestMethod.GET)
	public String getuser() {
		return "WEB-INF/jsp/user";
	}
}
