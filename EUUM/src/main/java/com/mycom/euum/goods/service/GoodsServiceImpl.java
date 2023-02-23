package com.mycom.euum.goods.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.mycom.euum.commons.FileUtils;
import com.mycom.euum.goods.bean.GoodsBean;
import com.mycom.euum.goods.bean.GoodsOptionBean;
import com.mycom.euum.goods.mapper.GoodsMapper;
import com.mycom.euum.image.bean.ImageBean;
import com.mycom.euum.image.mapper.ImageMapper;
import com.mycom.euum.member.bean.CartBean;
import com.mycom.euum.member.bean.SellerBean;
import com.mycom.euum.page.Criteria2;
import com.mycom.euum.page.CriteriaForGoods;
import com.mycom.euum.page.PageForGoodsDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class GoodsServiceImpl implements GoodsService {


	private GoodsMapper goodsMapper;
	private ImageMapper imageMapper;
	private FileUtils fileUtils;

	/* ---------------------------- 상품 리스트 ---------------------------- */


	
	@Override
	public List<GoodsBean> profileGoodsList(int memberNum) throws Exception {
		return goodsMapper.profileGoodsList(memberNum);
	}

	@Override
	public List<GoodsBean> selectCartGoodsList(Criteria2 cri) throws Exception {
		return goodsMapper.selectCartGoodsList(cri);
	}


	/** 은정: 상품 리스트 가져오기 (List)*/

	@Override
	public List<GoodsBean> selectGoodsList(Criteria2 cri) {
		return goodsMapper.selectGoodsList(cri);
	}

	/** 은정: 상품 리스트 페이징 */
	@Override
	public int getTotal(Criteria2 cri) {
		// TODO Auto-generated method stub
		return goodsMapper.getTotalCount(cri);
	}


	/** 선민: 나의 상품 리스트 가져오기 - 승인완료 상품 (List) */
	@Override
//	public Map<String, List<GoodsBean>> selectMyGoodsList(int memberNum, int pageNum, int amount) throws Exception {
	public Map<String, List<GoodsBean>> selectMyGoodsList(int memberNum, CriteriaForGoods cri) throws Exception {
		int pageNum1 = cri.getPageNum1();
		int amount1 = cri.getAmount1();
		int pageNum2 = cri.getPageNum2();
		int amount2 = cri.getAmount2();
		int pageNum3 = cri.getPageNum3();
		int amount3 = cri.getAmount3();

		List<GoodsBean> myGoodsList = new ArrayList<GoodsBean>();
		List<GoodsBean> myUnapprovedGoodsList = new ArrayList<GoodsBean>();
		List<GoodsBean> myTempList = new ArrayList<GoodsBean>();

		myGoodsList = goodsMapper.selectMyGoodsList(memberNum, pageNum1, amount1);
		myUnapprovedGoodsList = goodsMapper.selectMyUnapprovedGoodsList(memberNum, pageNum2, amount2);
		myTempList = goodsMapper.selectMyTempGoodsList(memberNum, pageNum3, amount3);

		Map<String, List<GoodsBean>> myGoodsMap = new HashMap<String, List<GoodsBean>>();
		myGoodsMap.put("myGoodsList", myGoodsList);
		myGoodsMap.put("myUnapprovedGoodsList", myUnapprovedGoodsList);
		myGoodsMap.put("myTempGoodsList", myTempList);

		return myGoodsMap;
	}

	/** 선민: 나의 상품 리스트 - 페이징 처리 */
	@Override
//	public Map<String, PageDTO> createMyGoodsPaging(int memberNum, int pageNum, int amount) throws Exception {
	public Map<String, PageForGoodsDTO> createMyGoodsPaging(int memberNum, CriteriaForGoods cri) throws Exception {

		int totalGoodsCount = goodsMapper.getGoodsTotalCount(memberNum, "승인완료");
		int totalUnapprovedGoodsCount = goodsMapper.getGoodsTotalCount(memberNum, "승인대기");
		int totalTempGoodsCount = goodsMapper.getGoodsTotalCount(memberNum, "임시저장");
		log.info("totalGoodsCount: " + totalGoodsCount);
		log.info("totalUnapprovedGoodsCount: " + totalUnapprovedGoodsCount);
		log.info("totalTempGoodsCount: " + totalTempGoodsCount);

		// 아마 같은 cri가 들어가서 병찬님이 말한 문제 생길 것..
		PageForGoodsDTO pageGoods = new PageForGoodsDTO(cri, totalGoodsCount, "Goods");
		PageForGoodsDTO pageUnapprovedGoods = new PageForGoodsDTO(cri, totalUnapprovedGoodsCount, "UnapprovedGoods");
		PageForGoodsDTO pageTempGoods = new PageForGoodsDTO(cri, totalTempGoodsCount, "TempGoods");
//		PageDTO pageGoods = new PageDTO(cri, 100);
//		PageDTO pageUnapprovedGoods = new PageDTO(cri, 100);
//		PageDTO pageTempGoods = new PageDTO(cri, 100);

		Map<String, PageForGoodsDTO> pagingMap = new HashMap<String, PageForGoodsDTO>();
		pagingMap.put("pageMakerGoods", pageGoods);
		pagingMap.put("pageMakerUnapprovedGoods", pageUnapprovedGoods);
		pagingMap.put("pageMakerTempGoods", pageTempGoods);
		log.info("pagingMap :" + pagingMap);

		return pagingMap;
	}

//	/** 선민: 나의 상품 리스트 가져오기 - 승인대기 상품 (List) */
//	@Override
//	public List<GoodsBean> selectMyUnapprovedGoodsList(int memberNum) throws Exception {
//		return goodsMapper.selectMyUnapprovedGoodsList(memberNum);
//	}
//
//	/** 선민: 나의 상품 리스트 가져오기 - 임시저장 상품 (List) */
//	@Override
//	public List<GoodsBean> selectMyTempGoodsList(int memberNum) throws Exception {
//		return goodsMapper.selectMyTempGoodsList(memberNum);
//	}

//	/** 선민: (페이징) 상품 총개수 가져오기 */
//	@Override
//	public int getGoodsTotalCount(int goodsNum, String goodsStatus) throws Exception {
//		return goodsMapper.getGoodsTotalCount(goodsNum, goodsStatus);
//	}

	/* ---------------------------- 상품 등록 ---------------------------- */

	/** 선민: 상품 등록 - 새로운 상품 데이터를 DB에 삽입하기 */
	@Override
	public int insertGoods(SellerBean sellerBean, GoodsBean goodsBean, List<ImageBean> imageBeanList) throws Exception {
		int goodsNum = 0;

		log.info("imageBeanList: " + imageBeanList);
		for (int i = 0; i < imageBeanList.size(); i++) {
			log.info(i + "번째 imageBean의 파일 이름: " + imageBeanList.get(i).getImageFileName());
			log.info(i + "번째 imageBean의 년/월/일: " + imageBeanList.get(i).getImageUploadPath());
			log.info(i + "번째 imageBean: " + imageBeanList.get(0).getImageUploadPath() + imageBeanList.get(0).getImageFileName());
		}

		goodsBean.setGoodsImageDate1(""); // 1~3번째 파일이 모두 다 비어있을 경우 null값 방지를 위한 공백문자열
		goodsBean.setGoodsImageDate2(""); // 1~3번째 파일이 모두 다 비어있을 경우 null값 방지를 위한 공백문자열
		goodsBean.setGoodsImageDate3(""); // 1~3번째 파일이 모두 다 비어있을 경우 null값 방지를 위한 공백문자열
		
		for (int i = 0; i < imageBeanList.size(); i++) {
			switch (i) {
			case 0:
//				goodsBean.setGoodsImage1(imageBeanList.get(0).getImageUploadPath() + imageBeanList.get(0).getImageFileName()); // 1번째 이미지파일 저장명
				goodsBean.setGoodsImage1(imageBeanList.get(0).getImageFileName()); // 1번째 이미지파일 저장명
				goodsBean.setGoodsImageDate1(imageBeanList.get(0).getImageUploadPath()); // 파일이 저장될 폴더 경로구조 (년/월/일)
				break;
			case 1:
//				goodsBean.setGoodsImage2(imageBeanList.get(1).getImageUploadPath() + imageBeanList.get(1).getImageFileName()); // 2번째 이미지파일 저장명
				goodsBean.setGoodsImage2(imageBeanList.get(1).getImageFileName()); // 2번째 이미지파일 저장명
				goodsBean.setGoodsImageDate2(imageBeanList.get(1).getImageUploadPath());
				break;
			case 2:
//				goodsBean.setGoodsImage3(imageBeanList.get(2).getImageUploadPath() + imageBeanList.get(2).getImageFileName()); // 3번째 이미지파일 저장명
				goodsBean.setGoodsImage3(imageBeanList.get(2).getImageFileName()); // 3번째 이미지파일 저장명
				goodsBean.setGoodsImageDate3(imageBeanList.get(2).getImageUploadPath());
				break;
			}
		}

		goodsBean.setMemberNum(sellerBean.getMemberNum());
		goodsBean.setGoodsSellerNickname(sellerBean.getSellerNickName());

		goodsMapper.insertGoods(goodsBean);
		log.info("GoodsBean: " + goodsBean);

		goodsNum = goodsBean.getGoodsNum(); // 새 글 등록 시 생성된 시퀀스를 selectKey로 가져온 값을 goodsNum으로 사용
		log.info("selectKey로 뽑아온 goodsNum: " + goodsNum);

		return goodsNum;
	}

	/** 선민: 상품 추가옵션 등록 - 등록될 상품의 추가옵션 데이터를 DB에 삽입하기 */
	@Override
	public void insertGoodsOption(int selectKeyGoodsNum, String[] goodsOptNameArr, String[] goodsOptContentArr,
			int[] goodsOptPriceArr) throws Exception {
		log.info("상품 추가옵션의 총 개수: " + goodsOptNameArr.length);

		int goodsOptNameNum = 0;
		String goodsOptNamePrev = ""; // 옵션이름을 비교하기 위한 변수 생성 및 초기화

		for (int i = 0; i < goodsOptNameArr.length; i++) {
			GoodsOptionBean goodsOptionBean = new GoodsOptionBean();

			if (!goodsOptNamePrev.equals(goodsOptNameArr[i])) { // i번째 추가옵션의 옵션이름이 이전 추가옵션의 옵션이름과 다르면
				goodsOptNamePrev = goodsOptNameArr[i];
				goodsOptNameNum++; // 새로운 옵션이름이 등장했으므로 이전 옵션과 서로다른 옵션으로 구분짓기 위해 goodsOptNameNum을 +1
			}

			goodsOptionBean.setGoodsNum(selectKeyGoodsNum);
			goodsOptionBean.setGoodsOptName(goodsOptNameArr[i]);
			goodsOptionBean.setGoodsOptContent(goodsOptContentArr[i]);
			goodsOptionBean.setGoodsOptPrice(goodsOptPriceArr[i]);
			goodsOptionBean.setGoodsOptNameNum(goodsOptNameNum);

			goodsMapper.insertGoodsOption(goodsOptionBean);
			log.info("GoodsOptionBean: " + goodsOptionBean);
		}
	}

	/** 선민: 상품 임시저장 - 상품 등록 폼의 내용을 임시 저장 */
	@Override
	public int insertTempGoods(SellerBean sellerBean, GoodsBean goodsBean, List<ImageBean> imageBeanList)
			throws Exception {
		int goodsNum = 0;

		log.info("imageBeanList: " + imageBeanList);
		for (int i = 0; i < imageBeanList.size(); i++) {
			log.info(i + "번째 imageBean의 파일 이름: " + imageBeanList.get(i).getImageFileName());
		}

		goodsBean.setGoodsImageDate1(""); // 1~3번째 파일이 모두 다 비어있을 경우 null값 방지를 위한 공백문자열
		goodsBean.setGoodsImageDate2(""); // 1~3번째 파일이 모두 다 비어있을 경우 null값 방지를 위한 공백문자열
		goodsBean.setGoodsImageDate3(""); // 1~3번째 파일이 모두 다 비어있을 경우 null값 방지를 위한 공백문자열
		for (int i = 0; i < imageBeanList.size(); i++) {
			switch (i) {
			case 0:
				goodsBean.setGoodsImage1(imageBeanList.get(0).getImageFileName()); // 1번째 이미지파일 저장명
				goodsBean.setGoodsImageDate1(imageBeanList.get(0).getImageUploadPath()); // 파일이 저장될 폴더 경로구조 (년/월/일)
				break;
			case 1:
				goodsBean.setGoodsImage2(imageBeanList.get(1).getImageFileName()); // 2번째 이미지파일 저장명
				goodsBean.setGoodsImageDate2(imageBeanList.get(1).getImageUploadPath());
				break;
			case 2:
				goodsBean.setGoodsImage3(imageBeanList.get(2).getImageFileName()); // 3번째 이미지파일 저장명
				goodsBean.setGoodsImageDate3(imageBeanList.get(2).getImageUploadPath());
				break;
			}
		}

		goodsBean.setMemberNum(sellerBean.getMemberNum());
		goodsBean.setGoodsSellerNickname(sellerBean.getSellerNickName());

		log.info("1");
		goodsMapper.insertTempGoods(goodsBean);
		log.info("GoodsBean: " + goodsBean);

		goodsNum = goodsBean.getGoodsNum(); // 새 글 등록 시 생성된 시퀀스를 selectKey로 가져온 값을 goodsNum으로 사용
		log.info("selectKey로 뽑아온 goodsNum: " + goodsNum);

		return goodsNum;
	}

	/* ---------------------------- 상품 수정 ---------------------------- */

	/** 선민: 상품 수정 - 수정페이지에 기존 추가옵션 불러오기 */
	@Override
	public List<GoodsOptionBean> selectModifyGoodsOption(String goodsNum) throws Exception {
		return goodsMapper.selectModifyGoodsOption(goodsNum);
	}

	/** 선민: 상품 수정 - DB에 수정한 데이터 업데이트 */
	@Override
	public int updateGoods(SellerBean sellerBean, GoodsBean goodsBean, List<ImageBean> imageBeanList) throws Exception {
		int sequence = 1;

		// 단지 로그 찍는 부분
		log.info("imageBeanList: " + imageBeanList);
		for (int i = 0; i < imageBeanList.size(); i++) {
			log.info(i + "번째 imageBean의 파일 이름: " + imageBeanList.get(i).getImageFileName());
		}

		goodsBean.setMemberNum(sellerBean.getMemberNum());
		goodsBean.setGoodsSellerNickname(sellerBean.getSellerNickName());
		goodsBean.setGoodsImageDate1(""); // 1~3번째 파일이 모두 다 비어있을 경우 null값 방지를 위한 공백문자열
		goodsBean.setGoodsImageDate2(""); // 1~3번째 파일이 모두 다 비어있을 경우 null값 방지를 위한 공백문자열
		goodsBean.setGoodsImageDate3(""); // 1~3번째 파일이 모두 다 비어있을 경우 null값 방지를 위한 공백문자열

		for (ImageBean imageBean : imageBeanList) {
			if (!imageBean.isNew()) {
				sequence++;
				continue;
			}
			switch (sequence) {
			case 1:
				goodsBean.setGoodsImage1(imageBean.getImageFileName()); // 1번째 이미지파일 저장명
				goodsBean.setGoodsImageDate1(imageBean.getImageUploadPath()); // 파일이 저장될 폴더 경로구조 (년/월/일)
				break;
			case 2:
				goodsBean.setGoodsImage2(imageBean.getImageFileName()); // 2번째 이미지파일 저장명
				goodsBean.setGoodsImageDate2(imageBean.getImageUploadPath());
				break;
			case 3:
				goodsBean.setGoodsImage3(imageBean.getImageFileName()); // 3번째 이미지파일 저장명
				goodsBean.setGoodsImageDate3(imageBean.getImageUploadPath());
				break;
			}
			goodsMapper.updateGoodsImage(goodsBean, sequence);
			log.info("GOODS_IMAGE" + sequence + " 컬럼의 DB 값 수정완료");
			sequence++;
		}
		goodsMapper.updateGoods(goodsBean);

		int goodsNum = goodsBean.getGoodsNum(); // 기존 임시저장 상품의 goodsNum을 그대로 사용
		log.info("수정하는 상품의 기존 goodsNum을 그대로 사용: " + goodsNum);

		return goodsNum;
	}

	/** 선민: 임시상품 등록 - 기존 임시저장된 상품 데이터를 정식 상품으로 DB 업데이트하기 */
	@Override
	public void updateGoodsTempToRegular(GoodsBean goodsBean) throws Exception {
		int goodsNum = goodsBean.getGoodsNum(); // 기존 임시저장 상품의 goodsNum을 그대로 사용
		goodsMapper.deleteGoodsOption(goodsNum);
	}

	/** 선민: 상품 임시저장에서 다시 임시저장 */
	@Override
	public int updateTempGoods(SellerBean sellerBean, GoodsBean goodsBean, List<ImageBean> imageBeanList)
			throws Exception {
		int sequence = 1;

		goodsBean.setMemberNum(sellerBean.getMemberNum());
		goodsBean.setGoodsSellerNickname(sellerBean.getSellerNickName());
		goodsBean.setGoodsImageDate1(""); // 1~3번째 파일이 모두 다 비어있을 경우 null값 방지를 위한 공백문자열
		goodsBean.setGoodsImageDate2(""); // 1~3번째 파일이 모두 다 비어있을 경우 null값 방지를 위한 공백문자열
		goodsBean.setGoodsImageDate3(""); // 1~3번째 파일이 모두 다 비어있을 경우 null값 방지를 위한 공백문자열

		for (ImageBean imageBean : imageBeanList) {
			if (!imageBean.isNew()) {
				sequence++;
				continue;
			}
			switch (sequence) {
			case 1:
				goodsBean.setGoodsImage1(imageBean.getImageFileName()); // 1번째 이미지파일 저장명
				goodsBean.setGoodsImageDate1(imageBean.getImageUploadPath()); // 파일이 저장될 폴더 경로구조 (년/월/일)
				break;
			case 2:
				goodsBean.setGoodsImage2(imageBean.getImageFileName()); // 2번째 이미지파일 저장명
				goodsBean.setGoodsImageDate2(imageBean.getImageUploadPath());
				break;
			case 3:
				goodsBean.setGoodsImage3(imageBean.getImageFileName()); // 3번째 이미지파일 저장명
				goodsBean.setGoodsImageDate3(imageBean.getImageUploadPath());
				break;
			}
			goodsMapper.updateGoodsImage(goodsBean, sequence);
			log.info("GOODS_IMAGE" + sequence + " 컬럼의 DB 값 수정완료");
			sequence++;
		}
		log.info("임시저장의 임시저장 goodsBean: " + goodsBean);
		goodsMapper.updateTempGoods(goodsBean);

		int goodsNum = goodsBean.getGoodsNum(); // 기존 임시저장 상품의 goodsNum을 그대로 사용
		log.info("수정하는 상품의 기존 goodsNum을 그대로 사용: " + goodsNum);

		return goodsNum;
	}

	/* ---------------------------- 상품 삭제 ---------------------------- */

	/** 선민: 상품 삭제 - DB에서 데이터 삭제 */
	@Override
	public void deleteGoods(int goodsNum) throws Exception {
		goodsMapper.deleteGoods(goodsNum);
	}

	/** 선민: 상품 추가옵션 삭제 - 이미 등록된 상품의 추가옵션 데이터를 DB에서 삭제하기 */
	@Override
	public void deleteGoodsOption(int goodsNum) throws Exception {
		goodsMapper.deleteGoodsOption(goodsNum);
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
	public List<List<GoodsOptionBean>> selectGoodsOptionContent(String goodsNum, int optionCount) throws Exception {
		List<List<GoodsOptionBean>> optionList = new ArrayList<List<GoodsOptionBean>>();

		for (int goodsOptNameNum = 1; goodsOptNameNum <= optionCount; goodsOptNameNum++) {
			List<GoodsOptionBean> list = goodsMapper.selectGoodsOptionContent(goodsNum,
					Integer.toString(goodsOptNameNum));
			log.info(goodsOptNameNum + "번째 옵션의 선택항목: " + list);
			optionList.add(list);
		}
		return optionList;
	}

	/* ---------------------------- 기타 기능 ---------------------------- */

	/** 선민: 상품 등록 시 이미지 업로드 */
	@Override
	public List<ImageBean> goodsFileUpload(MultipartFile[] uploadFile, HttpServletRequest request) throws Exception {
		List<ImageBean> imageBeanList = new ArrayList<ImageBean>();

		imageBeanList = fileUtils.fileUpload(uploadFile, request, "goods");
		return imageBeanList;
	}


	/** 선민: 관리자 상품조회 리스트 */
	@Override
	public List<GoodsBean> selectAdminGoodsList() throws Exception {
		List<GoodsBean> list = goodsMapper.selectAdminGoodsList();
		return list;
	}

	/** 선민: 관리자 상품 상태변경 */
	@Override
	public void updateAdminGoodsStatus(String goodsNum, String goodsStatus) throws Exception {
		goodsMapper.updateAdminGoodsStatus(goodsNum, goodsStatus);
	}



	@Override
	public List<Map<String, Object>> memberCart(int memberNum) throws Exception {
		return goodsMapper.memberCart(memberNum);
	}

	

	
	
}


