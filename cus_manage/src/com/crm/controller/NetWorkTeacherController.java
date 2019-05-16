package com.crm.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.pojo.FenYe;
import com.crm.service.ManagerService;
import com.crm.service.NetWorkTeacherService;
@Controller
public class NetWorkTeacherController {
	@Autowired
	private NetWorkTeacherService netWorkTeacherService;
	@Autowired
	private ManagerService managerService;
	@Autowired
	private FenYe fenye;
	
	@RequestMapping(value="/selectNetWorkTeacher",method=RequestMethod.POST)
	@ResponseBody
	public FenYe selectNetWorkTeacher(Integer page,Integer rows,FenYe fenye) {
		fenye.setPage((page-1)*rows);
		fenye.setRow(rows);	
		return netWorkTeacherService.selectNetWorkTeacher(fenye);
	}
	
	
	@RequestMapping(value="/updateSignin",method=RequestMethod.POST)
	@ResponseBody
	public Integer updateSignin(int user_id) {
		
		return managerService.updateSignIn(user_id);
	}
	
	@RequestMapping(value="/updateSignback",method=RequestMethod.POST)
	@ResponseBody
	public Integer updateSignback(String user_id) {
		List<String> list=new ArrayList<String>();
		list.add(user_id);
		return managerService.updateSignStatus(list);
				
	}
	
	 
		@RequestMapping(value="/getNetWorkTeacher",method=RequestMethod.GET)
		public String getNetWorkTeacher() {
			return "NetWorkTeacher";
		}

}
