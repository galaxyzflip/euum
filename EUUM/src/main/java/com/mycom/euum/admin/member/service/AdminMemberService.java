package com.mycom.euum.admin.member.service;

import java.util.List;

import com.mycom.euum.member.bean.MemberBean;

public interface AdminMemberService {
	
	public List<MemberBean> getMemberList(MemberBean memberBean);
	
	public int secessionMember(String memberNum);
	
	public int secessionSeller(String sellerNum);

}
