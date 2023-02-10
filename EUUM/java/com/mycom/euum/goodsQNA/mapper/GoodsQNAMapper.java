package com.mycom.euum.goodsQNA.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mycom.euum.goodsQNA.bean.GoodsQNABean;
import com.mycom.euum.page.Criteria;
import com.mycom.euum.qna.bean.QNABean;

public interface GoodsQNAMapper {
	
    public List<GoodsQNABean> goodsQNAList(@Param("goodsNum")String goodsNum, @Param("pageNum")int pageNum, @Param("amount")int amount);
	
  //public List<GoodsQNABean> goodsQNAList(Map<String, Object> map);
	
	public int goodsQNAInsert(GoodsQNABean goodsQNABean);
	
	public void insertGqnaComment(GoodsQNABean goodsQNABean);
	
	/** 상품문의 삭제 */
	public void deleteGQNA(GoodsQNABean goodsQNABean);
	
	/** 상품문의 총 개수 */
	public int getGoodsQNATotalCount(@Param("cri")Criteria cri, @Param("goodsNum")String goodsNum);
    
	/** 마이페이지 상품 문의 내역 */
	public List<GoodsQNABean> myGoodsQNAList(@Param("memberNum")int memberNum, @Param("pageNum")int pageNum, @Param("amount")int amount);

	/** 마이페이지문의 총 개수 */
	public int getmyGQNATotalCount(@Param("cri")Criteria cri, @Param("memberNum")int memberNum);
	
	/** 상품문의 수정 */
	public void modifyGQNA(GoodsQNABean goodsQNABean);

}
