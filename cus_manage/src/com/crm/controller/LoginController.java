package com.crm.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.dao.UserMapper;
import com.crm.pojo.Module;
import com.crm.pojo.User;
import com.crm.service.UserService;
import com.crm.util.EasyUITreeJson;
import com.crm.util.MD5Utils;
import com.crm.util.MemoryData;
import com.crm.util.RandomValidateCode;
import com.crm.util.TreeUtil;
import com.google.gson.Gson;

@Controller
public class LoginController {
	@Autowired
	private UserService userService;
	@Autowired
	private MD5Utils md5Utils;
	@Autowired 
	private TreeUtil treeUtil;
	
	private DateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH/mm/ss");  
	
	
	
	
	/**
	  * 跳转登陆页面
	 * @return
	 */
	@RequestMapping(value="/login")
	public String login(){
		return "login";
	}
	
	
	
	/**
	  * 跳转登陆页面
	 * @return
	 */
	@RequestMapping(value="/exitlogin")
	public void exitlogin(HttpServletRequest request,HttpServletResponse response){
		request.getSession().removeAttribute("m");
		try {
			response.sendRedirect("login");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	/**
	 * 获取生成验证码显示到 UI 界面
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping(value="/loginCheckCode")
	public void loginCheckCode(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		//设置相应类型,告诉浏览器输出的内容为图片
        response.setContentType("image/jpeg");
        //设置响应头信息，告诉浏览器不要缓存此内容
        response.setHeader("pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expire", 0);
        RandomValidateCode randomValidateCode = new RandomValidateCode();
        try {
            randomValidateCode.getRandcode(request, response);//输出图片方法
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
	/**
	 * 登陆用户验证并在前台提示错误信息
	 * @param user
	 * @param request
	 * @param response
	 * @param remember
	 * @return
	 */
	@RequestMapping(value="/loginValidation",method=RequestMethod.POST)
	public String loginValidation(HttpServletRequest request,HttpServletResponse response,User user,Integer remember,String yanzhengma) {
		
		String code = (String) request.getSession().getAttribute("randomcode_key");
		if(yanzhengma==null || yanzhengma=="" || !code.equalsIgnoreCase(yanzhengma)) {
			request.setAttribute("key", "验证码错误!!!!!!");
			return "login";
		}
		User login = userService.selectUserByAccount(user);
		if(login==null) {
			request.setAttribute("key", "账号或密码错误 账号");
			return "login";
		}
		Boolean filg=md5Utils.getSaltverifyMD5(user.getUser_password(),login.getUser_password());
		if(filg) {
			if(login.getUser_is_lock()<1) {
				request.setAttribute("key", "该账号已被锁定,请联系管理员!!!");
				return "login";
			}
			User admin = (User) request.getSession().getAttribute("m");
			if(admin!=null) {
				return "main";
			}
			request.setAttribute("key", "正确");
			if(remember == null){
				Cookie ck = new Cookie("remember_ticket","");
				ck.setMaxAge(0); //一周的过期时间
				ck.setPath(request.getContextPath());
				response.addCookie(ck);
			}
			if(remember != null){
				request.getSession().setAttribute("m", login);//存储到会话中
				request.getSession().setAttribute("loginType", "standard");//登录方式是标准登录
				String sessionID = request.getRequestedSessionId();
				String User_account=login.getUser_account();
				if(!MemoryData.getSeeesionIdMap().containsKey(User_account)) {
					MemoryData.getSeeesionIdMap().put(User_account, sessionID);
				}else if(MemoryData.getSeeesionIdMap().containsKey(User_account)&&!StringUtils.equals(sessionID, MemoryData.getSeeesionIdMap().get(User_account))){
					/*MemoryData.getSeeesionIdMap().remove(User_account);
					MemoryData.getSeeesionIdMap().put(User_account,sessionID);*/
					request.setAttribute("key", "该"+User_account+"账号以在其他设备登陆!!");
					return "login";
				}
				//勾选免登陆,在cookie中添加凭证
				String uuid = UUID.randomUUID().toString();
				Cookie cookie = new Cookie("remember_ticket",uuid);
				cookie.setMaxAge(7*24*60*60); //一周的过期时间
				cookie.setPath(request.getContextPath());//cookie在该路径下的网页起作用
				//添加cookie意图,添加到响应头,真正回到浏览器的时候才会被添加到浏览器的cookie
				response.addCookie(cookie);
				login.setUser_uuid(uuid);
				System.out.println(sdf2.format(new Date())+":时间格式");
				login.setUser_login_time(sdf2.format(new Date()));
				userService.updateUser(login);
			}
			
			System.out.println("登陆成功！！！！！！！！");
			return "redirect:getMain"; 		
			 
		}else {
			userService.updateUserWrongNumberByAccount(login);
			request.setAttribute("key", "账号或密码错误22222");
			if(login.getUser_wrong_number()==4) {
				login.setUser_is_lock(0);;
				userService.updateUserIsLockByUserId(user);
				request.setAttribute("key", "错误次数过多,此"+login.getUser_account()+"账号已被锁定!!");
			}
		}
		return "login";
	}
	
}
