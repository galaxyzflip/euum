package com.mycom.euum.admin.member.mapper;

import java.util.List;

import com.mycom.euum.member.bean.MemberBean;

public interface AdminMemberMapper {
	
	/**회원 리스트*/
	public List<MemberBean> getMemberList(MemberBean memeberBean);
	
	/**회원 탈퇴*/
	public int secessionMember(String memberNum);
	
	/**회원탈퇴시 전문가면 전문가 정보도 함께 처리*/
	public int secessionSeller(String sellerNum);

}
