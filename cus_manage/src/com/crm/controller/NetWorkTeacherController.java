package com.crm.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.pojo.Access_record;
import com.crm.pojo.FenYe;
import com.crm.pojo.User;
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
	public FenYe selectNetWorkTeacher(HttpServletRequest request,Integer page,Integer rows,FenYe fenye) {
		fenye.setPage((page-1)*rows);
		fenye.setRow(rows);
		
		return netWorkTeacherService.selectNetWorkTeacher(fenye);
	}
	

	//网络咨询师签到
	@RequestMapping(value="/updateSignin",method=RequestMethod.POST)
	@ResponseBody
	public Integer updateSignin(int user_id) {
		managerService.insertSignInfo(user_id);
		return managerService.updateSignIn(user_id);
	}
	
	//网络咨询师签退
	@RequestMapping(value="/updateSignback",method=RequestMethod.POST)
	@ResponseBody
	public Integer updateSignback(String user_id,String s) {
		List<String> list=new ArrayList<String>();
		list.add(user_id);
		managerService.updateSignInfo(Integer.parseInt(user_id),s);
		return managerService.updateSignStatus(list);
				
	}
	
	//跟踪信息
	@RequestMapping(value="/insertTrackInfo",method=RequestMethod.POST)
	@ResponseBody
	public Integer insertTrackInfo(Access_record access_record) {
	
		return netWorkTeacherService.insertTrackInfo(access_record);
				
	}
	
	//查询跟踪信息
	@RequestMapping(value="/selectDateLog",method=RequestMethod.POST)
	@ResponseBody
	public List<Access_record> selectDateLog(Access_record access_record) {
	
		return netWorkTeacherService.selectDateLog(access_record);
				
	}
	
	//查询员工状态
	@RequestMapping(value="/selectUserstatus",method=RequestMethod.POST)
	@ResponseBody
	public User selectUserstatus(int user_id) {
		return managerService.selectUserStatus(user_id);
				
	}
	
	
	//上班迟到信息
		@RequestMapping(value="/insertSignBack",method=RequestMethod.POST)
		@ResponseBody
		public Integer insertSignBack(int user_id) {
			return managerService.insertSignInfo(user_id);
					
		}
	
	 
		@RequestMapping(value="/getNetWorkTeacher",method=RequestMethod.GET)
		public String getNetWorkTeacher() {
			return "NetWorkTeacher";
		}

}
