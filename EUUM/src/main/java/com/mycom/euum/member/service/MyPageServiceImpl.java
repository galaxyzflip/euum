package com.mycom.euum.member.service;

import org.springframework.stereotype.Service;

import com.mycom.euum.member.bean.MemberBean;
import com.mycom.euum.member.bean.SellerBean;
import com.mycom.euum.member.mapper.MemberMapper;

import lombok.AllArgsConstructor;


@Service
@AllArgsConstructor
public class MyPageServiceImpl implements MyPageService {
	
	private MemberMapper memberMapper;


	// 회원 정보 상세보기
	@Override
	public MemberBean getMember(MemberBean bean) {
		
		return memberMapper.getMember(bean.getMemberNum());
	}

	// 전문가 정보 상세보기
	@Override
	public SellerBean getSeller(String sellerNum) {

		return memberMapper.getSeller(sellerNum);
	}

	// 회원 정보 수정
	@Override
	public int updateMember(MemberBean bean) {
		
		return memberMapper.updateMember(bean);
	}

	// 전문가 정보 수정
	@Override
	public int updateSeller(SellerBean sellerBean) {
		
		return memberMapper.updateSeller(sellerBean);
	}
	
	// 비밀번호 변경
	@Override
	public int updatePassword(MemberBean bean) {
		
		return memberMapper.updatePassword(bean);
	}

	// 회원 탈퇴
	@Override
	public int secessionMember(String memberNum) {
		
		return memberMapper.secessionMember(memberNum);
	}

	// 회원 탈퇴시 전문가 정보 삭제
	@Override
	public int secessionSeller(String sellerNum) {
		
		return memberMapper.secessionSeller(sellerNum);
	}

	// 전문가 등급 회원으로 전환
	@Override
	public void insertSeller(SellerBean bean) {
		
		memberMapper.insertSeller(bean);
	}

	@Override
	public int updateMemberClass(MemberBean bean) {
	
		return memberMapper.updateMemberClass(bean);
	}
	
}
