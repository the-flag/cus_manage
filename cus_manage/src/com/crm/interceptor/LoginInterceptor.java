package com.crm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

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
			if (request.getSession().getAttribute("m") != null) {
				return true;
			}
			System.out.println("Interceptor：跳转到login页面！");
			 System.out.println("request.getContextPath() = "+ request.getContextPath() + "/login.jsp");
			// 获取到项目名，以便下面进行重定向
            String homeUrl = request.getContextPath();
         	// 如果是 ajax 请求，则设置 session 状态 、CONTEXTPATH 的路径值
         	// 如果是ajax请求响应头会有，x-requested-with
            if (request.getHeader("x-requested-with") != null && request.getHeader("x-requested-with").equalsIgnoreCase("XMLHttpRequest")){
            	System.out.println("sdfdsfdsfjdsoifjosdaijfoisdjfoijsdoifjosdifiosdahfiu");
            	response.setHeader("SESSIONSTATUS", "TIMEOUT");
            	response.setHeader("CONTEXTPATH", homeUrl+"/WEB-INF/jsp/login.jsp");
                // FORBIDDEN，forbidden。也就是禁止、403
            	response.setStatus(HttpServletResponse.SC_FORBIDDEN); 
            }else{
                // 如果不是 ajax 请求，则直接跳转即可
            	response.sendRedirect("login");
            }
            return false;
	}

}
