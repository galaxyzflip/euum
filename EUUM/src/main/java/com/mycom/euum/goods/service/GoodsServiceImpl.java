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
import com.mycom.euum.image.service.ImageServiceImpl;
import com.mycom.euum.member.bean.SellerBean;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class GoodsServiceImpl implements GoodsService {

	private GoodsMapper goodsMapper;
//	private ImageServiceImpl imageService;
	private FileUtils fileUtils;

	/* ---------------------------- 상품 리스트 ---------------------------- */

	/** 선민: 상품 리스트 가져오기 (List) */
	@Override
	public List<GoodsBean> selectGoodsList() throws Exception {
		return goodsMapper.selectGoodsList();
	}

	/** 은정: 상품 리스트 검색결과 가져오기 (List) */
	@Override
	public List<GoodsBean> selectGoodsSearchList(String searchKeyword, String searchOption) throws Exception {
		return goodsMapper.selectGoodsSearchList(searchKeyword, searchOption);
	}

	/** 선민: 나의 상품 리스트 가져오기 - 승인완료 상품 (List) */
	@Override
	public Map<String, List<GoodsBean>> selectMyGoodsList(int memberNum) throws Exception {
		List<GoodsBean> myGoodsList = new ArrayList<GoodsBean>();
		List<GoodsBean> myUnapprovedGoodsList = new ArrayList<GoodsBean>();
		List<GoodsBean> myTempList = new ArrayList<GoodsBean>();

		myGoodsList = goodsMapper.selectMyGoodsList(memberNum);
		myUnapprovedGoodsList = goodsMapper.selectMyUnapprovedGoodsList(memberNum);
		myTempList = goodsMapper.selectMyTempGoodsList(memberNum);

		Map<String, List<GoodsBean>> myGoodsMap = new HashMap<String, List<GoodsBean>>();
		myGoodsMap.put("myGoodsList", myGoodsList);
		myGoodsMap.put("myUnapprovedGoodsList", myUnapprovedGoodsList);
		myGoodsMap.put("myTempGoodsList", myTempList);

		return myGoodsMap;
	}

	/** 선민: 나의 상품 리스트 가져오기 - 승인대기 상품 (List) */
	@Override
	public List<GoodsBean> selectMyUnapprovedGoodsList(int memberNum) throws Exception {
		return goodsMapper.selectMyUnapprovedGoodsList(memberNum);
	}

	/** 선민: 나의 상품 리스트 가져오기 - 임시저장 상품 (List) */
	@Override
	public List<GoodsBean> selectMyTempGoodsList(int memberNum) throws Exception {
		return goodsMapper.selectMyTempGoodsList(memberNum);
	}

	/* ---------------------------- 상품 등록 ---------------------------- */

	/** 선민: 상품 등록 - 새로운 상품 데이터를 DB에 삽입하기 */
	@Override
	public int insertGoods(SellerBean sellerBean, GoodsBean goodsBean, List<ImageBean> imageBeanList) throws Exception {
		log.info("imageBeanList: " + imageBeanList);
		for (int i = 0; i < imageBeanList.size(); i++) {
			log.info(i + "번째 imageBean의 파일 이름: " + imageBeanList.get(i).getImageFileName());
		}
		
		goodsBean.setGoodsImageDate(""); // 1~3번째 파일이 모두 다 비어있을 경우 null값 방지를 위한 공백문자열
		for (int i = 0; i < imageBeanList.size(); i++) {
			switch (i) {
			case 0:
				goodsBean.setGoodsImage1(imageBeanList.get(0).getImageFileName()); // 1번째 이미지파일 저장명
				goodsBean.setGoodsImageDate(imageBeanList.get(0).getImageUploadPath()); // 파일이 저장될 폴더 경로구조 (년/월/일)
				break;
			case 1:
				goodsBean.setGoodsImage2(imageBeanList.get(1).getImageFileName()); // 2번째 이미지파일 저장명
				goodsBean.setGoodsImageDate(imageBeanList.get(1).getImageUploadPath());
				break;
			case 2:
				goodsBean.setGoodsImage3(imageBeanList.get(2).getImageFileName()); // 3번째 이미지파일 저장명
				goodsBean.setGoodsImageDate(imageBeanList.get(2).getImageUploadPath());
				break;
			}
		}

		goodsBean.setMemberNum(sellerBean.getMemberNum());
		goodsBean.setGoodsSellerNickname(sellerBean.getSellerNickName());

		goodsMapper.insertGoods(goodsBean);
		log.info("GoodsBean: " + goodsBean);

		int selectKeyGoodsNum = goodsBean.getGoodsNum();
		log.info("selectKey로 뽑아온 goodsNum: " + selectKeyGoodsNum);

		return selectKeyGoodsNum;
	}

	/** 선민: 상품 추가옵션 등록 - 등록될 상품의 추가옵션 데이터를 DB에 삽입하기 */
	@Override
	public void insertGoodsOption(int selectKeyGoodsNum, String[] goodsOptNameArr, String[] goodsOptContentArr, int[] goodsOptPriceArr) throws Exception {
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
	public int insertTempGoods(SellerBean sellerBean, GoodsBean goodsBean, List<ImageBean> imageBeanList) throws Exception {
		log.info("imageBeanList: " + imageBeanList);
		for (int i = 0; i < imageBeanList.size(); i++) {
			log.info(i + "번째 imageBean의 파일 이름: " + imageBeanList.get(i).getImageFileName());
		}
		
		goodsBean.setGoodsImageDate(""); // 1~3번째 파일이 모두 다 비어있을 경우 null값 방지를 위한 공백문자열
		for (int i = 0; i < imageBeanList.size(); i++) {
			switch (i) {
			case 0:
				goodsBean.setGoodsImage1(imageBeanList.get(0).getImageFileName()); // 1번째 이미지파일 저장명
				goodsBean.setGoodsImageDate(imageBeanList.get(0).getImageUploadPath()); // 파일이 저장될 폴더 경로구조 (년/월/일)
				break;
			case 1:
				goodsBean.setGoodsImage2(imageBeanList.get(1).getImageFileName()); // 2번째 이미지파일 저장명
				goodsBean.setGoodsImageDate(imageBeanList.get(1).getImageUploadPath());
				break;
			case 2:
				goodsBean.setGoodsImage3(imageBeanList.get(2).getImageFileName()); // 3번째 이미지파일 저장명
				goodsBean.setGoodsImageDate(imageBeanList.get(2).getImageUploadPath());
				break;
			}
		}

		goodsBean.setMemberNum(sellerBean.getMemberNum());
		goodsBean.setGoodsSellerNickname(sellerBean.getSellerNickName());

		goodsMapper.insertTempGoods(goodsBean);
		log.info("GoodsBean: " + goodsBean);

		int selectKeyGoodsNum = goodsBean.getGoodsNum();
		log.info("selectKey로 뽑아온 goodsNum: " + selectKeyGoodsNum);

		return selectKeyGoodsNum;
	}

	/* ---------------------------- 상품 삭제 ---------------------------- */

	/** 선민: 상품 삭제 - DB에서 데이터 삭제 */
	@Override
	public void deleteGoods(int goodsNum) throws Exception {
		goodsMapper.deleteGoods(goodsNum);
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
			List<GoodsOptionBean> list = goodsMapper.selectGoodsOptionContent(goodsNum, Integer.toString(goodsOptNameNum));
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

}
