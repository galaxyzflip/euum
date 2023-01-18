package com.mycom.euum.member.service;

import java.util.Map;

import com.mycom.euum.member.bean.MemberBean;

public interface MemberService {

	public MemberBean loginService(MemberBean bean);
	
	public Map<String, Object> findId(MemberBean bean);
	
	public int resetPassword(MemberBean bean, String memberPassword_check);
	
}
