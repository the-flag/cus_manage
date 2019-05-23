package com.crm.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
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
import com.crm.util.phoneValidata.HttpUtil;
import com.crm.util.phoneValidata.IndustrySMS;
import com.google.gson.Gson;

@Controller
public class LoginController {
	@Autowired
	private UserService userService;
	@Autowired
	private MD5Utils md5Utils;
	@Autowired 
	private TreeUtil treeUtil;
	@Autowired
	private HttpUtil httpUtil;
	@Autowired
	private IndustrySMS industrySMS;
	
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
	  * 退出,跳转登陆页面
	 * @return
	 */
	@RequestMapping(value="/exitlogin")
	public void exitlogin(HttpServletRequest request,HttpServletResponse response){
		Map<String, String> seeesionIdMap = MemoryData.getSeeesionIdMap();
		User user =(User) request.getSession().getAttribute("m");
		seeesionIdMap.remove(user.getUser_account());
		try {
			response.sendRedirect("login");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	/**
	  * 获取手机号发送验证码
	 * @return
	 */
	@RequestMapping(value="/phoneValidata",method=RequestMethod.GET)
	
	public void phoneValidata(String phone,HttpServletRequest request){
		int p= (int)((Math.random()*9+1)*100000);//获取6位随机验证码
		IndustrySMS.setTo(phone);//发送到这个手机号
		String smsContent = "您的验证码为"+p+"，请于30分钟内正确输入，如非本人操作，请忽略此短信。";//发送的内容
		IndustrySMS.setSmsContent(smsContent);//把发送的信息内容存到这个对象类中
		IndustrySMS.execute();//执行发送验证码方法
		request.getSession().setAttribute("p", p);//把验证码存入到键值并存在session中
		System.out.println("验证码为:"+p);
	}
	
	
	
	/**
	 * 获取生成验证码显示到 登陆 界面
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
		String parameter = request.getParameter("user_account"); //获取前台传的账号
		
		String code = (String) request.getSession().getAttribute("randomcode_key"); //获取图片验证码
		if(yanzhengma==null || yanzhengma=="" || !code.equalsIgnoreCase(yanzhengma)) {
			request.setAttribute("key", "验证码错误!!!!!!");
			return "login";
		}
		
		User login = userService.selectUserByAccount(user); //根据账号查询用户
		if(login==null) {
			request.setAttribute("key", "账号或密码错误 账号");
			return "login";
		}
		
		Boolean filg=md5Utils.getSaltverifyMD5(user.getUser_password(),login.getUser_password()); //如果账号正确,判断用户输入的密码是否正确
		if(filg) {
			if(login.getUser_is_lock()<1) { //账号密码都没有问题,进一步判断该账号是否被锁定
				request.setAttribute("key", "该账号已被锁定,请联系管理员!!!");
				return "login";
			}
			/*if(request.getSession().getAttribute("m")==null) { //判断session是否已存在用户信息*/
			//登陆成功后,用户信息存在session中
				request.getSession().setAttribute("m", login);//根据账号为Key存储到会话中
				request.getSession().setAttribute("loginType", "standard");//登录方式是标准登录
			/*}*/
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
			
			if(remember == null){
				Cookie ck = new Cookie(""+User_account+"","");
				ck.setMaxAge(0); //一周的过期时间
				ck.setPath(request.getContextPath());
				response.addCookie(ck);
			}
			if(remember != null){
				
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
