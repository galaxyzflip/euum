package com.mycom.euum.goodsQNA.service;

import java.util.List;
import java.util.Map;

import com.mycom.euum.goodsQNA.bean.GoodsQNABean;
import com.mycom.euum.page.Criteria;

public interface GoodsQNAService {
	
	public List<GoodsQNABean> goodsQNAList(String goodsNum,int pageNum, int amount);
	
  //public List<GoodsQNABean> goodsQNAList(Map<String, Object> map);
	
	public void goodsQNAInsert(GoodsQNABean goodsQNABean);
	
	public void insertGqnaComment(GoodsQNABean goodsQNABean);
	
	public int getGoodsQNATotalCount(Criteria cri, String goodsNum);

}
