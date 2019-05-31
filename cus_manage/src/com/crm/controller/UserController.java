package com.crm.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.pojo.FenYe;
import com.crm.pojo.User;
import com.crm.pojo.UserQueryParameters;
import com.crm.pojo.UserRole;
import com.crm.service.UserRoleService;
import com.crm.service.UserService;
import com.crm.util.MD5Utils;
import com.google.gson.Gson;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private MD5Utils md5Utils;
	@Autowired
	private UserRoleService userRoleService;
	
	/**
	  * 用户数据表格
	 * @param fenYe
	 * @param rows
	 * @param queryParameters
	 * @return
	 */
	@RequestMapping("/showUserTab")
	@ResponseBody
	public FenYe showUserTab(FenYe fenYe,Integer rows,UserQueryParameters queryParameters) {
		fenYe.setObject(queryParameters);
		fenYe.setRow(rows);
		fenYe.setPage((fenYe.getPage()-1)*rows);
		FenYe selectUsersByFenYe = userService.selectUsersByFenYe(fenYe);
		return selectUsersByFenYe;
	}
	
	/**
	 * 跳转用户页面
	 * @return
	 */
	@RequestMapping(value="/getUserPage",method=RequestMethod.GET)
	public String getUserPage() {
		return "user";
	}
	
	
	  /**
     * 聊天主页
     */
    @RequestMapping(value = "/chat",method=RequestMethod.GET)
    public void getchat(HttpServletRequest request,HttpServletResponse response){
      /*  ModelAndView view = new ModelAndView("view/index.jsp");
        return view;*/
    	System.out.println("跳转页面!!!");
    	System.out.println("跳转页面!!!");
    	System.out.println("跳转页面!!!");
    	System.out.println("跳转页面!!!");
    	try {
			request.getRequestDispatcher("view/index.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
    }
	
	/**
	 * 验证账号是否已存在
	 * @param user
	 * @return
	 */
	@RequestMapping("/validationAccount")
	@ResponseBody
	public Boolean validationAccount(User user) {
		User selectUserByAccount = userService.selectUserByAccount(user);
		if(selectUserByAccount!=null) {
			return false;
		}
		return true;
	}
	
	
	/**
	 * 验证用户是否已存在
	 * @param user
	 * @return
	 */
	@RequestMapping("/selectUserByPhone")
	@ResponseBody
	public Boolean selectUserByPhone(String phone) {
		User selectUserByAccount = userService.selectUserByPhone(phone);
		if(selectUserByAccount!=null) {
			return true;
		}
		return false;
	}
	
	/**
	 * 修改密码时验证
	 * @param user
	 * @return
	 */
	@RequestMapping("/validationPass")
	@ResponseBody
	public Boolean validationPass(User user) {
		User selectUserByAccount = userService.selectUserByAccount(user);
		boolean saltverifyMD5 = MD5Utils.getSaltverifyMD5(user.getUser_password(), selectUserByAccount.getUser_password());
		System.out.println(saltverifyMD5);
		return saltverifyMD5;
	}
	
	/**
	 * 添加用户
	 * @param user
	 * @param xsry
	 * @return
	 */
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
	
	/**
	 * 根据用户账号修改用户信息
	 * @param user
	 * @return
	 */
	@RequestMapping(value="/updateUserByAccount",method=RequestMethod.POST)
	@ResponseBody
	public Integer updateUserByAccount(User user) {
		if(user.getUser_password()!=null && !"".equals(user.getUser_password())) {
			user.setUser_password(md5Utils.getSaltMD5(user.getUser_password()));
		}
		return userService.updateUserByAccount(user);
	}
	
	/**
	 * 根据用户id设置密码为默认密码
	 * @param user_id
	 * @return
	 */
	@RequestMapping(value="/updatePasswordByUserId",method=RequestMethod.POST)
	@ResponseBody
	public Integer updatePasswordByUserId(Integer user_id) {
		return userService.updatePasswordByUserId(user_id);
	}
	
	
	
	/**
	 * 根据用户id设置密码为默认密码
	 * @param user_id
	 * @return
	 */
	@RequestMapping(value="/updatePasswordByUserPhone",method=RequestMethod.POST)
	@ResponseBody
	public Integer updatePasswordByUserPhone(String user_phone,String validata,HttpServletRequest request) {
		String attribute =(String) request.getSession().getAttribute("phonevalidata");
		System.out.println("验证码:"+validata);
		System.out.println("验证码:"+attribute);
		if(attribute!=null) {
			if(attribute.equals(validata.trim())) {
				return userService.updatePasswordByUserPhone(user_phone);
			}
		}
		return 0;
	}
	
	/**
	 * 修改用户锁定状态
	 * @param user
	 * @return
	 */
	@RequestMapping(value="/updateUserIsLockByUserId",method=RequestMethod.POST)
	@ResponseBody
	public Integer updateUserIsLockByUserId(User user) {
		userService.updateUserIsLockByUserId(user);
		if(user.getUser_is_lock()==1) {
			user.setUser_wrong_number(0);
		}
		return userService.updateUserIsLockByUserId(user);
	}
	
	/**
	 *为用户添加角色
	 * @param user
	 * @return
	 */
	@RequestMapping(value="/addUserRole",method=RequestMethod.POST)
	@ResponseBody
	public Integer addUserRole(UserRole userRole) {
		/*List<UserRole> list=new ArrayList<>();
		list.add(userRole);
		try {
			return userRoleService.insertUserRole(list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;*/
		return userRoleService.insertUserRole(userRole);
	}
	
	/**
	 *根据用户id和角色id 到中间表删除对应信息
	 * @param user
	 * @return
	 */
	@RequestMapping(value="/delUserRole",method=RequestMethod.POST)
	@ResponseBody
	public Integer delUserRole(UserRole userRole) {
		return userRoleService.deleteUserRoleByUserIdAndRoleId(userRole);
	}
	
}
