package com.mycom.euum.member.service;


import java.util.List;

import org.springframework.stereotype.Service;

import com.mycom.euum.image.bean.ImageBean;
import com.mycom.euum.member.bean.CartBean;
import com.mycom.euum.member.bean.MemberBean;
import com.mycom.euum.member.bean.SellerBean;
import com.mycom.euum.member.mapper.CartMapper;
import com.mycom.euum.member.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MyPageServiceImpl implements MyPageService {

	

	private MemberMapper memberMapper;
	private CartMapper cartMapper;

	// 회원 정보 상세보기
	@Override
	public MemberBean getMember(int memberNum) {

		return memberMapper.getMember(memberNum);
	}

	// 전문가 정보 상세보기
	@Override
	public SellerBean getSeller(int sellerNum) {

		return memberMapper.getSeller(sellerNum);
	}

	// 회원 정보 수정
	@Override
	public int updateMember(MemberBean bean) {

		return memberMapper.updateMember(bean);
	}
	
	// 회원 휴대폰 번호 수정
	@Override
	public int updateMobile(MemberBean bean) {
		
		return memberMapper.updateMobile(bean);
	}

	// 전문가 정보 수정
	@Override
	public int updateSeller(SellerBean sellerBean) {

		return memberMapper.updateSeller(sellerBean);
	}

	// 전문가 프로필 수정
	@Override
	public int updateSellerFile(SellerBean bean, List<ImageBean> imageBeanList) {

		return memberMapper.updateSellerFile(bean);
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
	public void insertSeller(SellerBean bean, String memberBean) {

		memberMapper.insertSeller(bean);
	}

	@Override
	public int updateMemberClass(MemberBean bean) {

		return memberMapper.updateMemberClass(bean);
	}

	@Override
	public List<CartBean> getCartList(int memberNum) {

		return cartMapper.getCartList(memberNum);
	}

	@Override
	public int deleteCart(int memberNum, int goodsNum) {
		return cartMapper.deleteCart(memberNum, goodsNum);
	}

	@Override
	public int checkCart(int memberNum, int goodsNum) {
		return cartMapper.checkCart(memberNum, goodsNum);
	}



}
