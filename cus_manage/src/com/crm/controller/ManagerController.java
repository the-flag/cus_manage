package com.crm.controller;

import java.util.Arrays;
import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.pojo.Customer;
import com.crm.pojo.CustomerTrackParameters;
import com.crm.pojo.FenYe;
import com.crm.pojo.User;
import com.crm.service.ManagerService;
import com.google.gson.JsonArray;


@Controller
public class ManagerController {
	@Autowired
	private ManagerService managerService;
	@Autowired
	private FenYe fenye;
	private CustomerTrackParameters customerTrackParameters;
	@RequestMapping(value="/selectManager",method=RequestMethod.POST)
	@ResponseBody
	public FenYe selectManager(HttpServletRequest request,Integer page,Integer rows,FenYe fenye) {
			fenye.setPage((page-1)*rows);
			fenye.setRow(rows);
		List<User> selectUserReferTeacher = managerService.selectUserReferTeacher();
		request.getSession().setAttribute("selectUserReferTeacher", selectUserReferTeacher);
		return managerService.selectManager(fenye);
	}
	//增加客户
	@RequestMapping(value="/insertCustomer",method=RequestMethod.POST)
	@ResponseBody
	public Integer insertCustomer(Customer customer){
		return managerService.insertCustomer(customer);
		
		
	}
	//查询签到or签退
	@RequestMapping(value="/selectUserSign",method=RequestMethod.POST)
	@ResponseBody
	public FenYe selectUserSign(int page,int rows,FenYe fenye) {
		fenye.setPage((page-1)*rows);
		fenye.setRow(rows);
		return managerService.selectUserSigninOrback(fenye);
		
		
		
	}
	
	//一键签退
	@RequestMapping(value="/updateSignstatus",method=RequestMethod.POST)
	@ResponseBody
	public Integer updateSignstatus(String s){
		String[] split = s.split(",");
		List<String> list=Arrays.asList(split);
		System.out.println("遭雷劈的"+s);
	    
		return managerService.updateSignStatus(list);
	
	}
	
	
	@RequestMapping(value="/updateCustomerTrack",method=RequestMethod.POST)
	@ResponseBody
	public Integer updateCustomerTrack(String s,Integer user_id){
		String[] split = s.split(",");
		List<String> list=Arrays.asList(split);
		customerTrackParameters=new  CustomerTrackParameters();
		customerTrackParameters.setS(list);
		customerTrackParameters.setUser_id(user_id);
		System.out.println("输出一下"+customerTrackParameters);
		return managerService.updateCustomerTrack(customerTrackParameters);
	
	}
	 
	
	@RequestMapping(value="/UpdateCustomer",method=RequestMethod.POST)
	@ResponseBody
	public Integer UpdateCustomer(Customer customer){
		
		return managerService.UpdateCustomer(customer);
	
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
