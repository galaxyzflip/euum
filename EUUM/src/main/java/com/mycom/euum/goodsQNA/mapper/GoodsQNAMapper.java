package com.mycom.euum.goodsQNA.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mycom.euum.goodsQNA.bean.GoodsQNABean;
import com.mycom.euum.page.Criteria;

public interface GoodsQNAMapper {
	
    public List<GoodsQNABean> goodsQNAList(@Param("goodsNum")String goodsNum, @Param("pageNum")int pageNum, @Param("amount")int amount);
	
  //public List<GoodsQNABean> goodsQNAList(Map<String, Object> map);
	
	public void goodsQNAInsert(GoodsQNABean goodsQNABean);
	
	public void insertGqnaComment(GoodsQNABean goodsQNABean);
	
	public int getGoodsQNATotalCount(@Param("cri")Criteria cri, @Param("goodsNum")String goodsNum);
      
}
