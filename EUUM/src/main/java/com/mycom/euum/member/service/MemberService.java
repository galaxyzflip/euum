package com.mycom.euum.member.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.mycom.euum.member.bean.MemberBean;
import com.mycom.euum.member.bean.SellerBean;

public interface MemberService {

	public MemberBean loginService(MemberBean bean);
	
	public Map<String, Object> findId(MemberBean bean);
	
	public int resetPassword(MemberBean bean, String memberPassword_check);
	
	
	public void insertMember(MemberBean memberBean, HttpServletRequest request);

	public int selectByEmail(String email);

	public int selectByMobile(String mobile);
	
	public SellerBean getSeller(int sellerNum);
	
	public MemberBean checkAPIJoinInfo(MemberBean memberBean);
	
}
