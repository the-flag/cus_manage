package com.crm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.crm.pojo.User;
import com.crm.util.MemoryData;

public class SingleUserInterceptor implements HandlerInterceptor {
	
		
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
		// 如果是其他请求地址，进行拦截
		User admin = (User) request.getSession().getAttribute("m");
		if (admin != null) {
			String sessionid = MemoryData.getSeeesionIdMap().get(admin.getUser_account());
			// 如果用户名存在放心（即登录放行）
			if (sessionid.equals(request.getSession().getId())) {
				return true;
			} else { // 如果请求的sessionID和此账号Map中存放的sessionID不一致，跳转到登陆页
				// 判断如果是异步请求，设置响应头 sessionstatus为timeout，自动跳转，否则重定向
				if (request.getHeader("x-requested-with") != null
						&& request.getHeader("x-requested-with").equalsIgnoreCase("XMLHttpRequest")) {
					response.setHeader("sessionstatus", "timeout");
					return false;
				} else {
					String indexurl = request.getContextPath() + "login";
					response.sendRedirect(indexurl);
					return false;
				}
			}
		}
		// 如果session中没有admin，跳转到登陆页
		String url1 = request.getContextPath() + "login";
		response.sendRedirect(url1);
		return true;
	}

}
