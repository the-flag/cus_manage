package com.crm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.pojo.FenYe;
import com.crm.pojo.User;
import com.crm.pojo.UserQueryParameters;
import com.crm.service.UserService;
import com.crm.util.MD5Utils;
import com.google.gson.Gson;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private MD5Utils md5Utils;
	
	@RequestMapping("/showUserTab")
	@ResponseBody
	public FenYe showUserTab(FenYe fenYe,Integer rows,UserQueryParameters queryParameters) {
		fenYe.setObject(queryParameters);
		fenYe.setRow(rows);
		fenYe.setPage((fenYe.getPage()-1)*rows);
		FenYe selectUsersByFenYe = userService.selectUsersByFenYe(fenYe);
		return selectUsersByFenYe;
	}
	
	
	@RequestMapping(value="/getUserPage",method=RequestMethod.GET)
	public String getUserPage() {
		return "user";
	}
	
	
	
	@RequestMapping("/validationAccount")
	@ResponseBody
	public Boolean validationAccount(User user) {
		User selectUserByAccount = userService.selectUserByAccount(user);
		if(selectUserByAccount!=null) {
			return false;
		}
		return true;
	}
	
	
	@RequestMapping("/insertUserAndRole")
	@ResponseBody
	public Integer insertUserAndRole(User user,String xsry) {
		System.out.println(xsry);
		user.setUser_password(md5Utils.getSaltMD5(user.getUser_password()));
		String substring = xsry.substring(1, xsry.length());
		Integer insertUserAndRole = userService.insertUserAndRole(user, substring);
		return insertUserAndRole;
	}
	
	/**
	 * 关联删除 删除用户时先删除 用户和角色中间表 的关联信息
	 * @param user
	 * @param xsry
	 * @return
	 */
	@RequestMapping("/deleteUsers")
	@ResponseBody
	public Integer deleteUsers(String user_ids) {
		try {
			return userService.deleteUsers(user_ids);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	
	@RequestMapping("/updateUserByAccount")
	@ResponseBody
	public Integer updateUserByAccount(User user) {
		return userService.updateUserByAccount(user);
	}
	
}
