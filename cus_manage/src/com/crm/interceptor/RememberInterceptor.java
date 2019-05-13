package com.crm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.crm.pojo.User;
import com.crm.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

public class RememberInterceptor implements HandlerInterceptor {
	
	@Autowired
	private UserService userService;
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		

	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse arg1, Object arg2) throws Exception {
		System.out.println("自动登录拦截器");
		//判断是否已经登录过
		if (request.getSession().getAttribute("m") != null) {return true;}
		Cookie[] cookies = request.getCookies();//获取请求中的cookies
		if (cookies != null && cookies.length > 0) {
			System.out.println("请求中存在cookie：：：：：：：：：：：：：");
			for (Cookie c:cookies){
				if(c.getName().equals("remember_ticket")){
					System.out.println(c.getValue());
					User login = userService.selectUserByUuid(c.getValue());
				if (login != null){
						System.out.println("自动登录成功!!");
						request.getSession().setAttribute("m",login);
						request.getSession().setAttribute("loginType","auto");//登录方式是自动登录
				}
				}
			}
		}
		System.out.println("自动免登陆放行！！！！！！1");
		return true;
	}

}
