package com.mycom.euum.admin.member.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mycom.euum.admin.member.mapper.AdminMemberMapper;
import com.mycom.euum.member.bean.MemberBean;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class AdminMemberServiceImpl implements AdminMemberService {
	
	private AdminMemberMapper adminMemberMapper;
	
	@Override
	public List<MemberBean> getMemberList(MemberBean memberBean) {
		
		return adminMemberMapper.getMemberList(memberBean);
	}
	
	@Override
	public int secessionMember(String memberNum) {
		
		return adminMemberMapper.secessionMember(memberNum);
	}

	@Override
	public int secessionSeller(String sellerNum) {
		
		return adminMemberMapper.secessionSeller(sellerNum);
	}

}
