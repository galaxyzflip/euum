package com.mycom.euum.goods.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.mycom.euum.commons.FileUtils;
import com.mycom.euum.goods.bean.GoodsBean;
import com.mycom.euum.goods.bean.GoodsOptionBean;
import com.mycom.euum.image.bean.ImageBean;
import com.mycom.euum.image.service.ImageServiceImpl;
import com.mycom.euum.member.bean.SellerBean;

public interface GoodsService {
	
	/* ---------------------------- 상품 리스트 ---------------------------- */
	
	/** 선민: 상품 리스트 가져오기 (List) */
	public List<GoodsBean> selectGoodsList() throws Exception;
	
	/** 은정: 상품 리스트 검색결과 가져오기 (List) */
	public List<GoodsBean> selectGoodsSearchList(String searchKeyword, String searchOption) throws Exception;
	
	/** 선민: 나의 상품 리스트 가져오기 - 승인완료 상품 (List) */
	public Map<String, List<GoodsBean>> selectMyGoodsList(int memberNum) throws Exception;
	
	/** 선민: 나의 상품 리스트 가져오기 - 승인대기 상품 (List) */
	public List<GoodsBean> selectMyUnapprovedGoodsList(int memberNum) throws Exception;
	
	/** 선민: 나의 상품 리스트 가져오기 - 임시저장 상품 (List) */
	public List<GoodsBean> selectMyTempGoodsList(int memberNum) throws Exception;
	
	/* ---------------------------- 상품 등록 ---------------------------- */
	
	/** 선민: 상품 등록 - 새로운 상품 데이터를 DB에 삽입하기 */
	public int insertGoods(SellerBean sellerBean, GoodsBean goodsBean, List<ImageBean> imageBeanList) throws Exception;
	
	/** 선민: 상품 추가옵션 등록 - 등록될 상품의 추가옵션 데이터를 DB에 삽입하기 */
	public void insertGoodsOption(int selectKeyGoodsNum, String[] goodsOptNameArr, String[] goodsOptContentArr, int[] goodsOptPriceArr) throws Exception;
	
	/** 선민: 상품 임시저장 - 상품 등록 폼의 내용을 임시 저장 */
	public int insertTempGoods(SellerBean sellerBean, GoodsBean goodsBean, List<ImageBean> imageBeanList) throws Exception;
	
	/* ---------------------------- 상품 삭제 ---------------------------- */
	
	/** 선민: 상품 삭제 - DB에서 데이터 삭제 */
	public void deleteGoods(int goodsNum) throws Exception;
	
	/* ---------------------------- 상품 상세보기 ---------------------------- */
	
	/** 선민: 상품 상세보기 - 품번에 해당하는 상품의 기본 정보 가져오기 (Bean) */
	public GoodsBean selectGoodsInfo(String goodsNum) throws Exception;

	/** 선민: 상품 상세보기 - 품번에 해당하는 상품의 추가옵션 정보 가져오기 (List) */
	public List<GoodsOptionBean> selectGoodsOptionInfo(String goodsNum) throws Exception;

	/** 선민: 상품 상세보기 - 품번에 해당하는 상품의 추가옵션 옵션 개수 꺼내오기 (int) */
	public int selectGoodsOptionCount(String goodsNum) throws Exception;

	/** 선민: 상품 상세보기 - 품번에 해당하는 상품의 추가옵션 세부항목 리스트 꺼내오기 (List) */
	public List<List<GoodsOptionBean>> selectGoodsOptionContent(String goodsNum, int optionCount) throws Exception;

	/* ---------------------------- 기타 기능 ---------------------------- */
	
	/** 선민: 상품 등록 시 이미지 업로드 */
	public List<ImageBean> goodsFileUpload(MultipartFile[] uploadFile, HttpServletRequest request) throws Exception;
}
