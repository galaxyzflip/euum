package com.mycom.euum.cart.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mycom.euum.cart.bean.CartBean;

public interface CartMapper {

	
	/**찜 추가*/
	public int addCard(@Param("goodsNum") int goodsNum, @Param("memberNum") int memberNum );
	
	
	/**찜 목록 불러오기*/
	public List<CartBean> getCartList(int memberNum);
	
	
	/**찜 삭제*/
	public int deleteCart(int cartNum);
}
