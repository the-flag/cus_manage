package com.crm.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
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
import com.crm.pojo.UserCust;
import com.crm.service.ManagerService;
import com.crm.service.UserCustService;
import com.crm.service.UserService;
import com.crm.util.DistributionCustomer;
import com.google.gson.JsonArray;


@Controller
public class ManagerController {
	@Autowired
	private ManagerService managerService;
	@Autowired
	private FenYe fenye;
	private CustomerTrackParameters customerTrackParameters;
	@Autowired
	 private UserService userService;
	@Autowired
	 private UserCustService userCustService;
	@RequestMapping(value="/selectManager",method=RequestMethod.POST)
	@ResponseBody
	public FenYe selectManager(HttpSession session,HttpServletRequest request,Integer page,Integer rows,FenYe fenye) {
			fenye.setPage((page-1)*rows);
			fenye.setRow(rows);
		List<User> selectUserReferTeacher = managerService.selectUserReferTeacher();
		request.getSession().setAttribute("selectUserReferTeacher", selectUserReferTeacher);
		User s = managerService.selectUserStatus(fenye.getUser_id());
		System.out.println("特舒服水电费水电费"+s.getUser_status());
		session.setAttribute("ssss", s);
		
	
		return managerService.selectManager(fenye);
	}
	//增加客户
	@RequestMapping(value="/insertCustomer",method=RequestMethod.POST)
	@ResponseBody
	public Integer insertCustomer(HttpSession session, HttpServletRequest request,Customer customer){
		
	/*	User attribute = (User) session.getAttribute("s");
		System.out.println("状态值为"+attribute);
		if(attribute.getUser_status()==1){
			
			
		}*/
		
		List<User> selectUser = userService.selectUser();
		 paixu(selectUser);
		 customer.setUser_id(selectUser.get(0).getUser_id());
		 Integer insertCustomer = managerService.insertCustomer(customer);
		return insertCustomer;
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
	    System.out.println(managerService.updateCustomerTrack(customerTrackParameters));
		return managerService.updateCustomerTrack(customerTrackParameters);
	
	}
	 
	
	@RequestMapping(value="/UpdateCustomer",method=RequestMethod.POST)
	@ResponseBody
	public Integer UpdateCustomer(Customer customer){
		
		return managerService.UpdateCustomer(customer);
	
	}
	 
	
	//查询客户跟进情况
	@RequestMapping(value="/selectAccess_recordInfo",method=RequestMethod.POST)
	@ResponseBody
	public FenYe selectAccess_recordInfo(Integer page,Integer rows,FenYe fenye){
		fenye.setPage((page-1)*rows);
		fenye.setRow(rows);
		return managerService.selectAccess_recordInfo(fenye);
	
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
	
	@RequestMapping(value="/getCustomerFollow",method=RequestMethod.GET)
	public String getCustomerFollow() {
		return "CustomerFollow";
	}
	public static void paixu(List<User> UserList) {
		Collections.sort(UserList, new Comparator<User>() {
			@Override
			public int compare(User o1, User o2) {
				if(o1!=null && o2!=null) {
					if(o1.getCustomer_num()>o2.getCustomer_num()){
		                return 1;
		            }else if(o1.getCustomer_num()<o2.getCustomer_num()){
		                return -1;
		            }else if(o1.getCustomer_num()==o2.getCustomer_num()) {
		            	if(o1.getUser_weight()>o2.getUser_weight()) {
		            		return -1;
		            	}
		            }
				}
	            return 0;
			}
		});
	}
}
