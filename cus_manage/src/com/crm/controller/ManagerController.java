package com.crm.controller;

import java.util.Arrays;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.pojo.Customer;
import com.crm.pojo.FenYe;
import com.crm.service.ManagerService;
import com.google.gson.JsonArray;


@Controller
public class ManagerController {
	@Autowired
	private ManagerService managerService;
	@Autowired
	private FenYe fenye;
	
	@RequestMapping(value="/selectManager",method=RequestMethod.POST)
	@ResponseBody
	public FenYe selectManager(Integer page,Integer rows,FenYe fenye) {
			fenye.setPage((page-1)*rows);
			fenye.setRow(rows);
		return managerService.selectManager(fenye);
	}
	
	@RequestMapping(value="/insertCustomer",method=RequestMethod.POST)
	@ResponseBody
	public Integer insertCustomer(Customer customer){
		return managerService.insertCustomer(customer);
		
		
	}
	//签到or签退
	@RequestMapping(value="/selectUserSign",method=RequestMethod.POST)
	@ResponseBody
	public FenYe selectUserSign(int page,int rows,FenYe fenye) {
		fenye.setPage((page-1)*rows);
		fenye.setRow(rows);
		return managerService.selectUserSigninOrback(fenye);
		
		
		
	}
	
	
	@RequestMapping(value="/updateSignstatus",method=RequestMethod.POST)
	@ResponseBody
	public Integer updateSignstatus(String s){
		String[] split = s.split(",");
		List<String> list=Arrays.asList(split);
		System.out.println("遭雷劈的"+s);
	    
		return managerService.updateSignStatus(list);
	
	}
	
	
	
	
    //点击tree中的客户管理时，向ManagerList.jsp页面发送请求
	@RequestMapping(value="/getManager",method=RequestMethod.GET)
	public String getManager() {
		return "ManagerList";
	}

	 
	@RequestMapping(value="/getSigninorback",method=RequestMethod.GET)
	public String getSigninorback() {
		return "UserSign";
	}

}
