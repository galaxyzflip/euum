package com.mycom.euum.admin.goods.service;

import java.util.List;

import com.mycom.euum.goods.bean.GoodsBean;
import com.mycom.euum.page.Criteria2;

public interface AdminGoodsService {
    
	/** 관리자 상품 리스트 가져오기 */
	public List<GoodsBean> adminGoodsList(Criteria2 cri);
	
	/** 관리자 상품 리스트 페이징,검색,정렬 */
	public int getTotal(Criteria2 cri);
	

	
}
