package com.mycom.euum.goods.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mycom.euum.goods.bean.GoodsBean;
import com.mycom.euum.goods.bean.GoodsOptionBean;

//@Repository("goodsMapper")
public interface GoodsMapper {

//	@Autowired
//	private SqlSessionTemplate sqlSession;

	/* ---------------------------- 상품 리스트 ---------------------------- */

	/** 선민: 상품 리스트 가져오기 (List) */
	public List<GoodsBean> selectGoodsList() throws Exception;
	
	/** 은정: 상품 리스트 검색결과 가져오기 (List) */
	public List<GoodsBean> selectGoodsSearchList(String searchKeyword) throws Exception ;
	
	/** 선민: 나의 상품 리스트 가져오기 - 승인완료 상품 (List) */
	public List<GoodsBean> selectMyGoodsList(int goodsMemberNum) throws Exception;
	
	/** 선민: 나의 상품 리스트 가져오기 - 승인대기 상품 (List) */
	public List<GoodsBean> selectMyUnapprovedGoodsList(int goodsMemberNum) throws Exception;
	
	/** 선민: 나의 상품 리스트 가져오기 - 임시저장 상품 (List) */
	public List<GoodsBean> selectMyTempGoodsList(int goodsMemberNum) throws Exception;

	/* ---------------------------- 상품 등록 ---------------------------- */
	
	/** 선민: 상품 등록 - 새로운 상품 데이터를 DB에 삽입하기 */
	public void insertGoods(GoodsBean goodsBean);
	
	/** 선민: 상품 임시저장 - 상품 등록 폼의 내용을 임시 저장 */
	public void insertTempGoods(GoodsBean goodsBean);
	
	/* ---------------------------- 상품 상세보기 ---------------------------- */
	
	/** 선민: 상품 상세보기 - 품번에 해당하는 상품의 기본 정보 가져오기 (Bean) */
	public GoodsBean selectGoodsInfo(String goodsNum) throws Exception;

	/** 선민: 상품 상세보기 - 품번에 해당하는 상품의 모든 추가옵션 정보 가져오기 (List) */
	public List<GoodsOptionBean> selectGoodsOptionInfo(String goodsNum) throws Exception;

	/** 선민: 상품 상세보기 - 추가옵션 옵션 개수 꺼내오기 (int) */
	public int selectGoodsOptionCount(String goodsNum) throws Exception;

	
	/** 선민: 상품 상세보기 - 추가옵션 선택항목 리스트 꺼내오기 (List) */
	// 선민: mybatis로 2개 이상의 파라미터를 보낼 때 @Param으로 명시해주기
	public List<GoodsOptionBean> selectGoodsOptionContent(@Param("goodsNum") String goodsNum, @Param("goodsOptNameNum") String goodsOptNameNum) throws Exception;

}