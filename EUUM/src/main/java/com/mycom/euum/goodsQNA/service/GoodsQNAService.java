package com.mycom.euum.goodsQNA.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.mycom.euum.goodsQNA.bean.GoodsQNABean;
import com.mycom.euum.page.Criteria;

public interface GoodsQNAService {
	
	public List<GoodsQNABean> goodsQNAList(String goodsNum,int pageNum, int amount);
	
	public int goodsQNAInsert(GoodsQNABean goodsQNABean);
	
	public void insertGqnaComment(GoodsQNABean goodsQNABean);
	
	public int getGoodsQNATotalCount(Criteria cri, String goodsNum);
	
	/**마이페이지 상품문의 삭제 */
	public void deleteGQNA(GoodsQNABean goodsQNABean);
	
	/** 마이페이지 상품 문의 내역 */
	public List<GoodsQNABean> myGoodsQNAList(@Param("memberNum")int memberNum, @Param("pageNum")int pageNum, @Param("amount")int amount);
    
	/** 마이페이지문의 총 개수 */
	public int getmyGQNATotalCount(@Param("cri")Criteria cri, @Param("memberNum")int memberNum);
	
	/**마이페이지 상품문의 수정 */
	public void modifyGQNA(GoodsQNABean goodsQNABean);
}
