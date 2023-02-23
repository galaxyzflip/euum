package com.mycom.euum.commons.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.mycom.euum.member.bean.MemberBean;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
	
		
		HttpSession session = request.getSession();
		MemberBean loginUser = (MemberBean) session.getAttribute("loginUser");
		
		if(loginUser == null) {
			response.sendRedirect("/member/loginForm");
			return false;
		}
		return true;
		
	}
}
