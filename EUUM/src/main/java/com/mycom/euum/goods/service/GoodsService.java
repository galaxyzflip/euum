package com.mycom.euum.goods.service;

import java.util.List;

import com.mycom.euum.goods.bean.GoodsBean;
import com.mycom.euum.goods.bean.GoodsOptionBean;


public interface GoodsService {
	
	/** 선민: 상품 리스트 가져오기 (List) */
	public List<GoodsBean> selectGoodsList() throws Exception;
	
	/** 선민: 상품 상세보기 - 품번에 해당하는 상품의 기본 정보 가져오기 (Bean) */
	public GoodsBean selectGoodsInfo(String goodsNum) throws Exception;

	/** 선민: 상품 상세보기 - 품번에 해당하는 상품의 추가옵션 정보 가져오기 (List) */
	public List<GoodsOptionBean> selectGoodsOptionInfo(String goodsNum) throws Exception;

	/** 선민: 상품 상세보기 - 추가옵션 옵션 개수 꺼내오기 (int) */
	public int selectGoodsOptionCount(String goodsNum) throws Exception;

	/** 선민: 상품 상세보기 - 추가옵션 선택항목 리스트 꺼내오기 (List) */
	public List<GoodsOptionBean> selectGoodsOptionContent(String goodsNum, String goodsOptNameNum) throws Exception;

}
