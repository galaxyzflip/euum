package com.mycom.euum.goodsQNA.service;

import java.util.List;

import com.mycom.euum.goodsQNA.bean.GoodsQNABean;
import com.mycom.euum.qna.bean.QNABean;

public interface GoodsQNAService {
	
	public List<GoodsQNABean> goodsQNAList();
	
	public void goodsQNAInsert(GoodsQNABean goodsQNABean);
	
	public void insertGqnaComment(GoodsQNABean goodsQNABean);

}