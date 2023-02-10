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
	public List<GoodsBean> selectGoodsSearchList(@Param("searchKeyword")String searchKeyword, @Param("searchOption")String searchOption) throws Exception ;
	
	/** 선민: 나의 상품 리스트 가져오기 - 승인완료 상품 (List) */
	public List<GoodsBean> selectMyGoodsList(int memberNum) throws Exception;
	
	/** 선민: 나의 상품 리스트 가져오기 - 승인대기 상품 (List) */
	public List<GoodsBean> selectMyUnapprovedGoodsList(int memberNum) throws Exception;
	
	/** 선민: 나의 상품 리스트 가져오기 - 임시저장 상품 (List) */
	public List<GoodsBean> selectMyTempGoodsList(int memberNum) throws Exception;

	/* ---------------------------- 상품 등록 ---------------------------- */
	
	/** 선민: 상품 등록 - 새로운 상품 데이터를 DB에 삽입하기 */
	public void insertGoods(GoodsBean goodsBean) throws Exception;
	
	/** 선민: 상품 등록 - 기존 임시저장된 상품 데이터를 정식 상품으로 DB 업데이트하기 */
	public void updateGoodsTempToOfficial(GoodsBean goodsBean);
	
	/** 선민: 상품 추가옵션 등록 - 등록될 상품의 추가옵션 데이터를 DB에 삽입하기 */
	public void insertGoodsOption(GoodsOptionBean goodsOptionBean) throws Exception;
	
	/** 선민: 상품 임시저장 - 상품 등록 폼의 내용을 임시 저장 */
	public void insertTempGoods(GoodsBean goodsBean) throws Exception;
	
	/* ---------------------------- 상품 수정 ---------------------------- */
	
	/** 선민: 상품 수정 - 수정페이지에 기존 추가옵션 불러오기 */ 
	public List<GoodsOptionBean> selectModifyGoodsOption(String goodsNum) throws Exception;
	
	/** 선민: 상품 수정 - DB에 수정한 데이터 업데이트 */
	public void updateGoods(GoodsBean goodsBean);
	
	/* ---------------------------- 상품 삭제 ---------------------------- */
	
	/** 선민: 상품 삭제 - DB에서 데이터 삭제 */
	public void deleteGoods(int goodsNum) throws Exception;
	
	/** 선민: 상품 추가옵션 삭제 - 이미 등록된 상품의 추가옵션 데이터를 DB에서 삭제하기 */
	public void deleteGoodsOption(int goodsNum);
	
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