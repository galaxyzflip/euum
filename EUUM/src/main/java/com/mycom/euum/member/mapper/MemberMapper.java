package com.mycom.euum.member.mapper;

import java.util.List;

import com.mycom.euum.goods.bean.GoodsBean;
import com.mycom.euum.member.bean.MemberBean;
import com.mycom.euum.member.bean.SellerBean;

public interface MemberMapper {


	/**이메일 중복검사용*/
	public int selectByEmail(String memberEmail);


	/**휴대폰번호 중복검사용*/
	public int selectByMobile(String memberMobile);

	/**회원가입*/
	public int insertMember(MemberBean bean);


	/**로그인 하기*/
	public MemberBean checkLogin(MemberBean bean);

	/**계정 찾기*/
	public MemberBean findAccount(MemberBean bean);




	/**비밀번호 재설정*/
	public int updatePassword(MemberBean bean);


	/**회원정보 1개 가져오기*/
	public MemberBean getMember(int MemberNum);


	/**회원정보 수정*/
	public int updateMember(MemberBean bean);


	/**휴대폰번호 수정*/
	public int updateMobile(MemberBean bean);


	/**member_class 수정*/
	public int updateMemberClass(MemberBean bean);


	/**전문가 레코드 삽입/저문가 전환시 */
	public int insertSeller(SellerBean bean);


	/**전문가 정보 불러오기*/
	public SellerBean getSeller(int sellerNum);


	/**전문가 정보 수정*/
	public int updateSeller(SellerBean bean);

	/**전문가 프로필 수정*/
	public int updateSellerFile(SellerBean bean);

	/**전문가 프로필 가져오기... 수정 필요함*/
	public MemberBean getSellerInfo(int memberNum);


	/**완성되지않음.....*/
	public List<SellerBean> getMemberList();


	/**회원 탈퇴*/
	public int secessionMember(String memberNum);

	/**회원탈퇴시 전문가면 전문가 정보도 함께 처리*/
	public int secessionSeller(String sellerNum);
	
	
	public MemberBean selectAPIJoinInfo(MemberBean memberBean);
	
	// 메인
	
	/**메인 판매자 3인*/
	public List<SellerBean> mainSellerList();
	
	/**메인 굿즈 리스트*/
	public List<GoodsBean> mainGoodsList();
	
	/**메인 카운트(멤버)*/
	public int memberCount();
	/**메인 카운트(상품)*/
	public int goodsCount();
	/**메인 카운트(주문)*/
	public int orderCount();
	/**메인 카운트(판매자)*/
	public int sellerCount();





}
