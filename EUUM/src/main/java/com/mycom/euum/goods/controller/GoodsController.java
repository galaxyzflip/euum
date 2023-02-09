package com.mycom.euum.goods.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.mycom.euum.commons.FileUtils;
import com.mycom.euum.goods.bean.GoodsBean;
import com.mycom.euum.goods.bean.GoodsOptionBean;
import com.mycom.euum.goods.service.GoodsServiceImpl;
import com.mycom.euum.goodsQNA.service.GoodsQNAService;
import com.mycom.euum.image.bean.ImageBean;
import com.mycom.euum.image.service.ImageServiceImpl;
import com.mycom.euum.page.Criteria;
import com.mycom.euum.page.Criteria2;
import com.mycom.euum.page.PageDTO;
import com.mycom.euum.page.PageDTO2;
import com.mycom.euum.page.RCriteria;
import com.mycom.euum.page.RPageDTO;
import com.mycom.euum.review.service.ReviewService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class GoodsController {

//	@Resource(name = "goodsService")
	private GoodsServiceImpl goodsService;
	private ImageServiceImpl imageService;
	private FileUtils fileUtils;
	private GoodsQNAService goodsQNAService;
	private ReviewService reviewService;

	@RequestMapping(value = "/")
	public String test() {
		log.info("start");
		return "main_layout";
	}

	
	/* ---------------------------- 상품 리스트 ---------------------------- */

	/** 은정: 상품 리스트 - 전체 상품 리스트(02/01 페이징추가) */
	@GetMapping(value="/goods/goodsList")
	public String selectGoodsList(Model model, Criteria2 cri) throws Exception {
		log.info("===== 상품 리스트 =====");
		
		System.out.println("cri 내용 : " +cri.toString());
		System.out.println("cri 내용 : " +cri.toString());
		System.out.println("cri 내용 : " +cri.toString());
		System.out.println("cri 내용 : " +cri.toString());
		
		
		
		List<GoodsBean> goodsList = goodsService.selectGoodsList(cri);
		log.info("상품 리스트: " + goodsList);
		model.addAttribute("goodsList", goodsList);
		
		int total=goodsService.getTotal(cri);
        
		
		model.addAttribute("pageMaker", new PageDTO2(cri, total));

		return "goods/goodsList";  
		
	}

	@GetMapping(value = "/goods/goodsSearch2")
	public String goodsSearch2(String searchOption, Model model) throws Exception {
		log.info("검색옵션: " + searchOption);
		model.addAttribute("searchOption", searchOption);

		return "goods/goodsList";
	}

	/** 은정: 상품 리스트 - 상품 정렬결과 리스트 */
	// 1차 취합 전까지 일단 비워놓을게요!!

	/** 선민: 상품 리스트 - 전체 상품 리스트 */
	@RequestMapping(value = "/myPage/myGoods") // GET으로 보낼지 POST로 보낼지 모르므로 RequestMapping
	public String myGoods(HttpSession session, Model model) throws Exception {
		log.info("===== 내 작품 관리 =====");

		Map<String, List<GoodsBean>> myGoodsMap = new HashMap<String, List<GoodsBean>>();

		// (임시) 테스트를 위해 goodsMemberNum을 입력받지 않고 고정된 값으로 설정
		int goodsMemberNum = 999;
		myGoodsMap = goodsService.selectMyGoodsList(goodsMemberNum);

		model.addAttribute("myGoodsMap", myGoodsMap);

		return "myPage/myGoods";
	}

	/* ---------------------------- 상품 등록 ---------------------------- */

	/** 선민: 상품 등록 - 약관 페이지 이동 */
	@GetMapping(value = "/goods/goodsRegisterGuide")
	public String goodsRegisterGuide() throws Exception {
		log.info("===== 상품 등록 약관 =====");
		return "goods/goodsRegisterGuide";
	}

	/** 선민: 상품 등록 - 등록 폼 이동 */
	@GetMapping(value = "/goods/goodsRegisterForm")
	public String goodsRegisterForm() throws Exception {
		log.info("===== 상품 등록 폼 =====");
		return "goods/goodsRegisterForm";
	}

	/** 선민: 상품 등록 - DB에 데이터 저장 (goodsStatus = '승인대기') */
	@PostMapping(value = "/goods/goodsRegisterPro")
	public String goodsRegisterPro(MultipartFile[] uploadFile, HttpServletRequest request, GoodsBean goodsBean, String[] goodsOptName, String[] goodsOptContent, int[] goodsOptPrice, Model model) throws Exception {
		log.info("===== 상품 등록 처리 =====");
		log.info("uploadFile: " + uploadFile);
		log.info("업로드 된 파일 개수: " + uploadFile.length);

		List<ImageBean> imageBeanList = new ArrayList<ImageBean>();

		// 01. 파일 업로드 메소드 fileUpload()
		log.info("---------- 01. 파일 업로드 메소드 호출 ----------");
		imageBeanList = fileUtils.fileUpload(uploadFile, request, "goods");

		// 02. 상품 등록
		goodsBean.setGoodsImageDate(imageBeanList.get(0).getImageUploadPath()); // 파일저장날짜 (추후 <img>태그에 사용)
		goodsBean.setGoodsImage1(imageBeanList.get(0).getImageFileName()); // 첫번째 이미지파일 저장명
		goodsBean.setGoodsImage2(imageBeanList.get(1).getImageFileName()); // 두번째 이미지파일 저장명
		goodsBean.setGoodsImage3(imageBeanList.get(2).getImageFileName()); // 세번째 이미지파일 저장명

		goodsBean.setMemberNum(999); // (임시)not null에 의한 에러방지
		goodsBean.setGoodsSellerNickname("홍길동"); // (임시)not null에 의한 에러방지

		goodsService.insertGoods(goodsBean);
		log.info("---------- 02. 상품 등록 ----------");
		log.info("GoodsBean: " + goodsBean);

		int selectKeyGoodsNum = goodsBean.getGoodsNum();
		log.info("---------- 02. 상품 등록 ----------");
		log.info("selectKey로 뽑아온 goodsNum: " + selectKeyGoodsNum);

		// 03. 상품 추가옵션 등록
		log.info("---------- 03. 상품 추가옵션 등록 ----------");
		log.info("상품 추가옵션의 총 개수: " + goodsOptName.length);

		int goodsOptNameIndex = 0;
		String goodsOptNameEx = ""; // 옵션이름을 비교하기 위한 변수

		for (int i = 0; i < goodsOptName.length; i++) {
			GoodsOptionBean goodsOptionBean = new GoodsOptionBean();

			if (!goodsOptNameEx.equals(goodsOptName[i])) {
				goodsOptNameEx = goodsOptName[i];
				goodsOptNameIndex++;
			}

			goodsOptionBean.setGoodsNum(selectKeyGoodsNum); // selectKey 사용
			goodsOptionBean.setGoodsOptName(goodsOptName[i]);
			goodsOptionBean.setGoodsOptContent(goodsOptContent[i]);
			goodsOptionBean.setGoodsOptPrice(goodsOptPrice[i]);
			goodsOptionBean.setGoodsOptNameNum(goodsOptNameIndex);

			goodsService.insertGoodsOption(goodsOptionBean);
			log.info("---------- 03. 상품 추가옵션 등록 ----------");
			log.info("GoodsOptionBean: " + goodsOptionBean);
		}

		// 04. 이미지파일 정보를 DB에 저장
		for (ImageBean imageBean : imageBeanList) {
			imageBean.setImageUseNum(selectKeyGoodsNum);
			imageService.insertImage(imageBean);
		}

		log.info("---------- 04. 이미지파일 정보 DB 저장 ----------");
		log.info("imageBeanList: " + imageBeanList);

		return "redirect:/myPage/myGoods";
	}

	/** 선민: 상품 임시저장 - DB에 데이터 저장 (goodsStatus = '임시저장') */
	@PostMapping(value = "/goods/goodsRegisterTempPro")
	public String goodsRegisterTempPro(MultipartFile[] uploadFile, HttpServletRequest request, GoodsBean goodsBean, String[] goodsOptName, String[] goodsOptContent, int[] goodsOptPrice, Model model) throws Exception {
		log.info("===== 상품 등록 처리 =====");
		log.info("uploadFile: " + uploadFile);
		log.info("업로드 된 파일 개수: " + uploadFile.length);

		List<ImageBean> imageBeanList = new ArrayList<ImageBean>();

		// 01. 파일 업로드 메소드 fileUpload()
		log.info("---------- 01. 파일 업로드 메소드 호출 ----------");
		imageBeanList = fileUtils.fileUpload(uploadFile, request, "goods");

		// 02. 상품 등록
		goodsBean.setGoodsImageDate(imageBeanList.get(0).getImageUploadPath()); // 파일저장날짜 (추후 <img>태그에 사용)
		goodsBean.setGoodsImage1(imageBeanList.get(0).getImageFileName()); // 첫번째 이미지파일 저장명
		goodsBean.setGoodsImage2(imageBeanList.get(1).getImageFileName()); // 두번째 이미지파일 저장명
		goodsBean.setGoodsImage3(imageBeanList.get(2).getImageFileName()); // 세번째 이미지파일 저장명

		goodsBean.setMemberNum(999); // (임시)not null에 의한 에러방지
		goodsBean.setGoodsSellerNickname("홍길동"); // (임시)not null에 의한 에러방지

		goodsService.insertGoods(goodsBean);
		log.info("---------- 02. 상품 등록 ----------");
		log.info("GoodsBean: " + goodsBean);

		int selectKeyGoodsNum = goodsBean.getGoodsNum();
		log.info("---------- 02. 상품 등록 ----------");
		log.info("selectKey로 뽑아온 goodsNum: " + selectKeyGoodsNum);

		// 03. 상품 추가옵션 등록
		log.info("---------- 03. 상품 추가옵션 등록 ----------");
		log.info("상품 추가옵션의 총 개수: " + goodsOptName.length);

		int goodsOptNameIndex = 0;
		String goodsOptNameEx = ""; // 옵션이름을 비교하기 위한 변수

		for (int i = 0; i < goodsOptName.length; i++) {
			GoodsOptionBean goodsOptionBean = new GoodsOptionBean();

			if (!goodsOptNameEx.equals(goodsOptName[i])) {
				goodsOptNameEx = goodsOptName[i];
				goodsOptNameIndex++;
			}

			goodsOptionBean.setGoodsNum(selectKeyGoodsNum); // selectKey 사용
			goodsOptionBean.setGoodsOptName(goodsOptName[i]);
			goodsOptionBean.setGoodsOptContent(goodsOptContent[i]);
			goodsOptionBean.setGoodsOptPrice(goodsOptPrice[i]);
			goodsOptionBean.setGoodsOptNameNum(goodsOptNameIndex);

			goodsService.insertGoodsOption(goodsOptionBean);
			log.info("---------- 03. 상품 추가옵션 등록 ----------");
			log.info("GoodsOptionBean: " + goodsOptionBean);
		}

		// 04. 이미지파일 정보를 DB에 저장
		for (ImageBean imageBean : imageBeanList) {
			imageBean.setImageUseNum(selectKeyGoodsNum);
			imageService.insertImage(imageBean);
		}

		log.info("---------- 04. 이미지파일 정보 DB 저장 ----------");
		log.info("imageBeanList: " + imageBeanList);

		return "redirect:/myPage/myGoods";
	}

	/* ---------------------------- 상품 수정 ---------------------------- */

	/* ---------------------------- 상품 삭제 ---------------------------- */

	/** 선민: 상품 삭제 - DB에서 데이터 삭제 (Ajax가 반환한 result 데이터를 jsp에 그려서 가져오기) */
	@PostMapping(value = "/goods/goodsDeletePro")
	public String goodsDeletePro(int goodsNum, Model model) throws Exception {
		log.info("===== 상품 삭제 처리 =====");
		log.info("삭제할 상품 번호: " + goodsNum);

		goodsService.deleteGoods(goodsNum);

		Map<String, List<GoodsBean>> myGoodsMap = new HashMap<String, List<GoodsBean>>();
		int goodsMemberNum = 999;
		myGoodsMap = goodsService.selectMyGoodsList(goodsMemberNum);
		model.addAttribute("myGoodsMap", myGoodsMap);

		return "myPage/myGoodsAjax";
	}

	/* ---------------------------- 상품 상세보기 ---------------------------- */

	/** 선민: 상품 상세보기 */
	@GetMapping(value = "/goods/goodsDetail")
	public String goodsDetail(Model model,String goodsNum, Criteria cri, RCriteria rcri) throws Exception {
		
		int optionCount = goodsService.selectGoodsOptionCount(goodsNum);
		List<List<GoodsOptionBean>> optionList = new ArrayList<List<GoodsOptionBean>>();

		log.info("옵션의 개수: " + optionCount);

		/** 상품등록 - 추가옵션 구현 전까지 전체 주석 */

//		 선민: 상품의 옵션 세부항목이 존재하지 않는다는 것은 상품 자체가 존재하지 않는 것을 의미하므로 상품 리스트로 return
//		if (optionCount == 0) {
//			// 지금은 상품 리스트로 return하지만,
//			// 추후에는 '검색결과가 없습니다.'를 보여줄 수 있도록 goodsList.jsp에 구현
//			return "redirect:/goods/goodsList";
//		}

		for (int i = 1; i <= optionCount; i++) {
			List<GoodsOptionBean> list = goodsService.selectGoodsOptionContent(goodsNum, Integer.toString(i));

			optionList.add(list);
		}
        
		/** 의종: goodsQNA 리스트 가져오기 및 페이징 */
		int amount = cri.getAmount();
		int pageNum = cri.getPageNum();
		int total=goodsQNAService.getGoodsQNATotalCount(cri,goodsNum); 
		
		model.addAttribute("list" , goodsQNAService.goodsQNAList(goodsNum, pageNum, amount));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		model.addAttribute("goodsNum" , goodsNum);
		
		
		model.addAttribute("detail", goodsService.selectGoodsInfo(goodsNum));
		model.addAttribute("optionList", optionList);
		model.addAttribute("optionCount", optionCount);

		
		
		/*================= 용주 작업중===============*/
		
		
		
		int rtotal=reviewService.getTotal(rcri);
		model.addAttribute("rpageMaker", new RPageDTO(rcri, rtotal));
		
						
		model.addAttribute("reviewList", reviewService.reviewList(rcri));
		
		log.info("sql돌려요=======================" + reviewService.reviewList(rcri));

		return "goods/goodsDetail";
	}

}