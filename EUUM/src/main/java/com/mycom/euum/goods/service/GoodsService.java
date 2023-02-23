package com.mycom.euum.goods.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.mycom.euum.goods.bean.GoodsBean;
import com.mycom.euum.goods.bean.GoodsOptionBean;
import com.mycom.euum.image.bean.ImageBean;
import com.mycom.euum.member.bean.SellerBean;
import com.mycom.euum.page.Criteria2;
import com.mycom.euum.page.CriteriaForGoods;
import com.mycom.euum.page.PageForGoodsDTO;

public interface GoodsService {

	
	/** 명식: */
	public List<GoodsBean> profileGoodsList(int memberNum) throws Exception;
	
	/** 명식: */
	public List<GoodsBean> selectCartGoodsList(Criteria2 cri) throws Exception;

	/* ---------------------------- 상품 리스트 ---------------------------- */

	/** 은정: 상품 리스트 가져오기 (List) */
	public List<GoodsBean> selectGoodsList(Criteria2 cri);

	/** 은정: 상품 리스트 페이징 */
	public int getTotal(Criteria2 cri);

	/** 선민: 나의 상품 리스트 가져오기 - 승인완료 상품 (List) */
//	public Map<String, List<GoodsBean>> selectMyGoodsList(int memberNum, int pageNum, int amount) throws Exception;
	public Map<String, List<GoodsBean>> selectMyGoodsList(int memberNum, CriteriaForGoods cri) throws Exception;
//	
//	/** 선민: 나의 상품 리스트 가져오기 - 승인대기 상품 (List) */
//	public List<GoodsBean> selectMyUnapprovedGoodsList(int memberNum, int pageNum, int amount) throws Exception;
//	
//	/** 선민: 나의 상품 리스트 가져오기 - 임시저장 상품 (List) */
//	public List<GoodsBean> selectMyTempGoodsList(int memberNum, int pageNum, int amount) throws Exception;

//	/** 선민: (페이징) 상품 총개수 가져오기 */
//	public int getGoodsTotalCount(int goodsNum, String goodsStatus) throws Exception;

	/** 선민: 나의 상품 리스트 - 페이징 처리 */
//	public Map<String, PageDTO> createMyGoodsPaging(int memberNum, int pageNum, int amount) throws Exception;
	public Map<String, PageForGoodsDTO> createMyGoodsPaging(int memberNum, CriteriaForGoods cri) throws Exception;

	/* ---------------------------- 상품 등록 ---------------------------- */

	/** 선민: 상품 등록 - 새로운 상품 데이터를 DB에 삽입하기 */
	public int insertGoods(SellerBean sellerBean, GoodsBean goodsBean, List<ImageBean> imageBeanList) throws Exception;

	/** 선민: 상품 추가옵션 등록 - 등록될 상품의 추가옵션 데이터를 DB에 삽입하기 */
	public void insertGoodsOption(int selectKeyGoodsNum, String[] goodsOptNameArr, String[] goodsOptContentArr,
			int[] goodsOptPriceArr) throws Exception;

	/** 선민: 상품 임시저장 - 상품 등록 폼의 내용을 임시 저장 */
	public int insertTempGoods(SellerBean sellerBean, GoodsBean goodsBean, List<ImageBean> imageBeanList)
			throws Exception;

	/* ---------------------------- 상품 수정 ---------------------------- */

	/** 선민: 상품 수정 - 수정페이지에 기존 추가옵션 불러오기 */
	public List<GoodsOptionBean> selectModifyGoodsOption(String goodsNum) throws Exception;

	/** 선민: 상품 수정 - DB에 수정한 데이터 업데이트 */
	public int updateGoods(SellerBean sellerBean, GoodsBean goodsBean, List<ImageBean> imageBeanList) throws Exception;

	/** 선민: 임시상품 등록 - 기존 임시저장된 상품 데이터를 정식 상품으로 DB 업데이트하기 */
	public void updateGoodsTempToRegular(GoodsBean goodsBean) throws Exception;

	/** 선민: 상품 임시저장에서 다시 임시저장 */
	public int updateTempGoods(SellerBean sellerBean, GoodsBean goodsBean, List<ImageBean> imageBeanList)
			throws Exception;

	/* ---------------------------- 상품 삭제 ---------------------------- */

	/** 선민: 상품 삭제 - DB에서 데이터 삭제 */
	public void deleteGoods(int goodsNum) throws Exception;

	/** 선민: 상품 추가옵션 삭제 - 이미 등록된 상품의 추가옵션 데이터를 DB에서 삭제하기 */
	public void deleteGoodsOption(int goodsNum) throws Exception;

	/* ---------------------------- 상품 상세보기 ---------------------------- */

	/** 선민: 상품 상세보기 - 품번에 해당하는 상품의 기본 정보 가져오기 (Bean) */
	public GoodsBean selectGoodsInfo(String goodsNum) throws Exception;

	/** 선민: 상품 상세보기 - 품번에 해당하는 상품의 추가옵션 정보 가져오기 (List) */
	public List<GoodsOptionBean> selectGoodsOptionInfo(String goodsNum) throws Exception;

	/** 선민: 상품 상세보기 - 품번에 해당하는 상품의 옵션명 개수 꺼내오기 (int) */
	public int selectGoodsOptionCount(String goodsNum) throws Exception;

	/** 선민: 상품 상세보기/수정 - 상품번호와 옵션명번호를 받아서 각 옵션명의 모든 세부항목 가져오기 (List) */
	public List<List<GoodsOptionBean>> selectGoodsOptionContent(String goodsNum, int optionCount) throws Exception;

	/* ---------------------------- 기타 기능 ---------------------------- */

	/** 선민: 상품 등록 시 이미지 업로드 */
	public List<ImageBean> goodsFileUpload(MultipartFile[] uploadFile, HttpServletRequest request) throws Exception;


	/** 선민: 관리자 상품조회 리스트 */
	public List<GoodsBean> selectAdminGoodsList() throws Exception;

	/** 선민: 관리자 상품 상태변경 */
	public void updateAdminGoodsStatus(String goodsNum, String goodsStatus) throws Exception;

	/** 선민: 상품 수정 - 품번에 해당하는 상품의 모든 세부항목 개수 꺼내오기 (int) */
	public int selectGoodsOptionContentCount(String goodsNum) throws Exception;

//	/** 선민: 상품 수정 - 상품번호와 옵션명번호를 받아서 각 옵션명의 모든 세부항목 가져오기 */
//	public List<List<GoodsOptionBean>> selectGoodsOption(String goodsNum, int optionCount) throws Exception;


	public List<Map<String, Object>> memberCart(int memberNum) throws Exception;
	

}