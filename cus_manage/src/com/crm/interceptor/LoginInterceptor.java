package com.crm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.crm.pojo.User;
import com.crm.util.MemoryData;

public class LoginInterceptor implements HandlerInterceptor {
	
		
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {

	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
			System.out.println("进入拦截器");
			String parameter = request.getParameter("user_account"); //获取前台传的账号
    		User admin = (User) request.getSession().getAttribute("m");
    		System.out.println(admin);
			if (admin != null) {
				String sessionid = MemoryData.getSeeesionIdMap().get(admin.getUser_account());
    			// 如果用户名存在放心（即登录放行）
				if(sessionid!=null) {
	    			if (sessionid.equals(request.getSession().getId())) {
	    				return true;
					}
				}
			}
			// 获取到项目名，以便下面进行重定向
            String homeUrl = request.getContextPath();
         	// 如果是 ajax 请求，则设置 session 状态 、CONTEXTPATH 的路径值
         	// 如果是ajax请求响应头会有，x-requested-with
            if (request.getHeader("x-requested-with") != null && request.getHeader("x-requested-with").equalsIgnoreCase("XMLHttpRequest")){
            	System.out.println("sdfdsfdsfjdsoifjosdaijfoisdjfoijsdoifjosdifiosdahfiu");
            	response.setHeader("SESSIONSTATUS", "TIMEOUT");
            	response.setHeader("CONTEXTPATH", homeUrl+"login");
                // FORBIDDEN，forbidden。也就是禁止、403
            	response.setStatus(HttpServletResponse.SC_FORBIDDEN); 
            }else{
                // 如果不是 ajax 请求，则直接跳转即可
            	response.sendRedirect("login");
            }
            return false;
	}

}
