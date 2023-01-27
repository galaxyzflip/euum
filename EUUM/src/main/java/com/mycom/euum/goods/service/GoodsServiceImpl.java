package com.mycom.euum.goods.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	/* ---------------------------- 상품 리스트 ---------------------------- */

	/** 선민: 상품 리스트 가져오기 (List) */
	@Override
	public List<GoodsBean> selectGoodsList() throws Exception {
		return goodsMapper.selectGoodsList();
	}
	
	/** 은정: 상품 리스트 검색결과 가져오기 (List) */
	@Override
	public List<GoodsBean> selectGoodsSearchList(String searchKeyword) throws Exception {
		return goodsMapper.selectGoodsSearchList(searchKeyword);
	}
	
	/** 선민: 나의 상품 리스트 가져오기 - 승인완료 상품 (List) */
	@Override
	public Map<String, List<GoodsBean>> selectMyGoodsList(int goodsMemberNum) throws Exception {
		List<GoodsBean> myGoodsList = new ArrayList<GoodsBean>();
		List<GoodsBean> myUnapprovedGoodsList = new ArrayList<GoodsBean>();
		List<GoodsBean> myTempList = new ArrayList<GoodsBean>();
		
		myGoodsList = goodsMapper.selectMyGoodsList(goodsMemberNum);
		myUnapprovedGoodsList = goodsMapper.selectMyUnapprovedGoodsList(goodsMemberNum);
		myTempList = goodsMapper.selectMyTempGoodsList(goodsMemberNum);
		
		Map<String, List<GoodsBean>> myGoodsMap = new HashMap<String, List<GoodsBean>>();
		myGoodsMap.put("myGoodsList", myGoodsList);
		myGoodsMap.put("myUnapprovedGoodsList", myUnapprovedGoodsList);
		myGoodsMap.put("myTempGoodsList", myTempList);
		
		return myGoodsMap;
	}

	/** 선민: 나의 상품 리스트 가져오기 - 승인대기 상품 (List) */
	@Override
	public List<GoodsBean> selectMyUnapprovedGoodsList(int goodsMemberNum) throws Exception {
		return goodsMapper.selectMyUnapprovedGoodsList(goodsMemberNum);
	}

	/** 선민: 나의 상품 리스트 가져오기 - 임시저장 상품 (List) */
	@Override
	public List<GoodsBean> selectMyTempGoodsList(int goodsMemberNum) throws Exception {
		return goodsMapper.selectMyTempGoodsList(goodsMemberNum);
	}

	/* ---------------------------- 상품 등록 ---------------------------- */
	
	/** 선민: 상품 등록 - 새로운 상품 데이터를 DB에 삽입하기 */
	@Override
	public void insertGoods(GoodsBean goodsBean) throws Exception {
		goodsMapper.insertGoods(goodsBean);
	}
	
	/** 선민: 상품 임시저장 - 상품 등록 폼의 내용을 임시 저장 */
	public void insertTempGoods(GoodsBean goodsBean) {
		goodsMapper.insertTempGoods(goodsBean);
	}
	
	/* ---------------------------- 상품 상세보기 ---------------------------- */
	
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

}
