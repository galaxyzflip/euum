package com.mycom.euum.goods.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mycom.euum.goods.bean.GoodsBean;
import com.mycom.euum.goods.bean.GoodsOptionBean;
import com.mycom.euum.goods.mapper.GoodsMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class GoodsServiceImpl implements GoodsService {

	private GoodsMapper goodsMapper;

	/** 선민: 상품 리스트 가져오기 (List) */
	@Override
	public List<GoodsBean> selectGoodsList() throws Exception {
		return goodsMapper.selectGoodsList();
	}

	/** 선민: 상품 상세보기 - 품번에 해당하는 상품의 기본 정보 가져오기 (Bean) */
	@Override
	public GoodsBean selectGoodsInfo(String goodsNum) throws Exception {
		return goodsMapper.selectGoodsInfo(goodsNum);
	}

	/** 선민: 상품 상세보기 - 품번에 해당하는 상품의 추가옵션 정보 가져오기 (List) */
	// 일단 사용 안함
	@Override
	public List<GoodsOptionBean> selectGoodsOptionInfo(String goodsNum) throws Exception {
		return goodsMapper.selectGoodsOptionInfo(goodsNum);
	}
	
	/** 선민: 상품 상세보기 - 추가옵션 옵션 개수 꺼내오기 (int) */
	@Override
	public int selectGoodsOptionCount(String goodsNum) throws Exception {
		return goodsMapper.selectGoodsOptionCount(goodsNum);
	}

	/** 선민: 상품 상세보기 - 추가옵션 선택항목 리스트 꺼내오기 (List) */
	@Override
	public List<GoodsOptionBean> selectGoodsOptionContent(String goodsNum, String goodsOptNameNum) throws Exception {
		return goodsMapper.selectGoodsOptionContent(goodsNum, goodsOptNameNum);
	}

//	@Resource(name = "goodsMapper")
//	private GoodsMapper goodsMapper;
//	private GoodsOptionMapper goodsOptionMapper;

	/* --------------------------------------------------------------- */
}
