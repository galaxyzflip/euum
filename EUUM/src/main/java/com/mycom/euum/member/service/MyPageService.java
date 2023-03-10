package com.mycom.euum.member.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mycom.euum.image.bean.ImageBean;
import com.mycom.euum.member.bean.CartBean;
import com.mycom.euum.member.bean.MemberBean;
import com.mycom.euum.member.bean.SellerBean;

public interface MyPageService {

	// 회원 정보 관련
	public MemberBean getMember(int memberNum);

	public int updateMember(MemberBean bean);

	public int updateSeller(SellerBean bean);

	public int updateSellerFile(SellerBean bean, List<ImageBean> imageBeanList);

	public int updatePassword(MemberBean bean);
	
	public int updateMobile(MemberBean bean);
	
	public int secessionMember(String memberNum);

	public int secessionSeller(String sellerNum);

	public SellerBean getSeller(int sellerNum);

	public void insertSeller(SellerBean bean, String memberBean);

	public int updateMemberClass(MemberBean bean);

	
	public int checkCart(int memberNum, int goodsNum);
	
	public List<CartBean> getCartList(int memberNum);

	public int deleteCart(int memberNum, int goodsNum);

	// 회원 주문 관련

	// 회원 게시판 관련

	// 전문가 상품 관련

}
