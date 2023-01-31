package com.mycom.euum.goods.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class GoodsController {

//	@Resource(name = "goodsService")
	private GoodsServiceImpl goodsService;
	private FileUtils fileUtils;
	
	@RequestMapping(value = "/")
	public String test() {
		log.info("start");
		return "main_layout";
	}
	
	/* ---------------------------- 상품 리스트 ----------------------------- */

	/** 선민: 상품 리스트 - 전체 상품 리스트 */
	@GetMapping(value="/goods/goodsList")
	public String selectGoodsList(Model model) throws Exception {
		log.info("===== 상품 리스트 =====");
		
		List<GoodsBean> goodsList = goodsService.selectGoodsList();
		log.info("상품 리스트: " + goodsList);
		model.addAttribute("goodsList", goodsList);
		
		return "goods/goodsList";
	}
	
	/** 은정: 상품 리스트 - 상품 검색결과 리스트 */
	@GetMapping(value = "/goods/goodsSearch")
	public String goodsSearch(String searchKeyword, Model model) throws Exception {
		log.info("===== 상품 검색결과 리스트 =====");
		log.info("---------------------------------");
		log.info("검색어: " + searchKeyword);

		List<GoodsBean> goodsList = goodsService.selectGoodsSearchList(searchKeyword);
		model.addAttribute("goodsList", goodsList);
		
		return "/goods/goodsList";
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
	
	/** 선민: 상품 등록 - DB에 값 저장 (goodsStatus = '승인대기') */
	@PostMapping(value = "/goods/goodsRegisterPro")
	public String goodsRegisterPro(MultipartFile[] uploadFile, GoodsBean goodsBean, GoodsOptionBean goodsOptionBean, Model model) throws Exception {
		log.info("===== 상품 등록 처리 =====");
		log.info("---------------------------------");
		log.info("uploadFile: " + uploadFile);
		log.info("index length: " + uploadFile.length);
		log.info("index 0: " + uploadFile[0].getOriginalFilename());
		log.info("index 1: " + uploadFile[1].getOriginalFilename());
		log.info("index 2: " + uploadFile[2].getOriginalFilename());
		
		List<String> fileInfoList = new ArrayList<String>();
		
		// 파일 업로드 메소드 fileUpload()
		// -> 메소드 호출 시 리스트를 리턴하고, 인덱스 0번은 파일저장날짜, 이후 인덱스번호는 파일 저장명이 담겨있음
		fileInfoList = fileUtils.fileUpload(uploadFile);
		
		goodsBean.setGoodsImageDate(fileInfoList.get(0)); // 파일저장날짜 (추후 <img>태그에 사용)
		goodsBean.setGoodsImage1(fileInfoList.get(1)); // 첫번째 이미지파일 저장명
		goodsBean.setGoodsImage2(fileInfoList.get(2)); // 두번째 이미지파일 저장명
		goodsBean.setGoodsImage3(fileInfoList.get(3)); // 세번째 이미지파일 저장명
		
		log.info("---------------------------------");
		log.info("GoodsBean: " + goodsBean);
		log.info("---------------------------------");
		log.info("GoodsOptionBean: " + goodsOptionBean);
		
		// (임시)not null에 의한 에러방지
		goodsBean.setGoodsMemberNum(999);
		goodsBean.setGoodsSellerNickname("홍길동");
		goodsService.insertGoods(goodsBean);
		
		
		// (임시)not null에 의한 에러방지
		goodsOptionBean.setGoodsNum(goodsBean.getGoodsNum()); // selectKey 사용
		log.info("*** selectKey로 뽑아온 goodsNum: " + goodsBean.getGoodsNum());
//		goodsOptionBean.setGoodsOptName("SD전신");
//		goodsOptionBean.setGoodsOptNameNum(1);
//		goodsOptionBean.setGoodsOptContent("흑백");
//		goodsOptionBean.setGoodsOptPrice(1000);
		
		return "redirect:/myPage/myGoods";
	}
	
	/** 선민: 상품 임시저장 - DB에 값 저장 (goodsStatus = '임시저장') */
	@PostMapping(value = "/goods/goodsRegisterTempPro")
	public String goodsRegisterTempPro(MultipartFile[] uploadFile, GoodsBean goodsBean, GoodsOptionBean goodsOptionBean, Model model) throws Exception {
		log.info("===== 상품 임시저장 처리 =====");
		
		List<String> fileInfoList = new ArrayList<String>();
		
		// 파일 업로드 메소드 fileUpload()
		// -> 메소드 호출 시 리스트를 리턴하고, 인덱스 0번은 파일저장날짜, 이후 인덱스번호는 파일 저장명이 담겨있음
		fileInfoList = fileUtils.fileUpload(uploadFile);
		
		goodsBean.setGoodsImageDate(fileInfoList.get(0)); // 파일저장날짜 (추후 <img>태그에 사용)
		goodsBean.setGoodsImage1(fileInfoList.get(1)); // 첫번째 이미지파일 저장명
		goodsBean.setGoodsImage2(fileInfoList.get(2)); // 두번째 이미지파일 저장명
		goodsBean.setGoodsImage3(fileInfoList.get(3)); // 세번째 이미지파일 저장명
		
		// (임시)not null에 의한 에러방지
		goodsBean.setGoodsMemberNum(999);
		goodsBean.setGoodsSellerNickname("홍길동");
		
		goodsService.insertTempGoods(goodsBean);
		
		// (임시)not null에 의한 에러방지
		goodsOptionBean.setGoodsNum(goodsBean.getGoodsNum()); // selectKey 사용
		log.info("*** selectKey로 뽑아온 goodsNum: " + goodsBean.getGoodsNum());
		
		return "myPage/myGoods";
	}
	
	/* ---------------------------- 상품 수정 ---------------------------- */
	/* ---------------------------- 상품 삭제 ---------------------------- */

	
	
	/* ---------------------------- 상품 상세보기 ---------------------------- */
	
	/** 선민: 상품 상세보기 */
	@GetMapping(value = "/goods/goodsDetail")
	public String goodsDetail(Model model, String goodsNum) throws Exception {
		log.info("===== 상품 상세보기 =====");
		int optionCount = goodsService.selectGoodsOptionCount(goodsNum);
		List<List<GoodsOptionBean>> optionList = new ArrayList<List<GoodsOptionBean>>();
		log.info("옵션의 개수: " + optionCount);
		
		/** 상품등록 - 추가옵션 구현 전까지 전체 주석 */ 
//		// 선민: 상품의 옵션 세부항목이 존재하지 않는다는 것은 상품 자체가 존재하지 않는 것을 의미하므로 상품 리스트로 return
//		if (optionCount == 0) {
//			// 지금은 상품 리스트로 return하지만,
//			// 추후에는 '검색결과가 없습니다.'를 보여줄 수 있도록 goodsList.jsp에 구현
//			return "redirect:/goods/goodsList";
//		}

		for (int i = 1; i <= optionCount; i++) {
			List<GoodsOptionBean> list = goodsService.selectGoodsOptionContent(goodsNum, Integer.toString(i));

			log.info("---------------------------------");
			log.info(i + "번째 옵션의 선택항목: " + list);
			optionList.add(list);
		}

		model.addAttribute("detail", goodsService.selectGoodsInfo(goodsNum));
		model.addAttribute("optionList", optionList);
		model.addAttribute("optionCount", optionCount);
		
		return "goods/goodsDetail";
	}
	
}