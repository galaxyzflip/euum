package com.mycom.euum.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mycom.euum.member.bean.CartBean;


public interface CartMapper {

	
	/**찜 추가*/
	public int addCard(@Param("goodsNum") int goodsNum, @Param("memberNum") int memberNum );
	
	
	/**찜 목록 불러오기*/
	public List<CartBean> getCartList(int memberNum);
	
	
	/**찜 삭제*/
	public int deleteCart(@Param("memberNum")int memberNum, @Param("goodsNum")int goodsNum);
}
