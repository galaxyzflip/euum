package com.mycom.euum.goods.controller;

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
import com.mycom.euum.goods.service.GoodsService;
import com.mycom.euum.image.bean.ImageBean;
import com.mycom.euum.image.service.ImageService;
import com.mycom.euum.member.bean.MemberBean;
import com.mycom.euum.member.bean.SellerBean;
import com.mycom.euum.page.Criteria;
import com.mycom.euum.page.PageDTO;
import com.mycom.euum.page.RCriteria;
import com.mycom.euum.page.RPageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class GoodsController {

//	@Resource(name = "goodsService")
//	private GoodsServiceImpl goodsService;
//	private ImageServiceImpl imageService;
	private GoodsService goodsService;
	private ImageService imageService;
	
	private FileUtils fileUtils; // 123

	@RequestMapping(value = "/")
	public String test() {
		log.info("start");
		return "main_layout";
	}

	
	/* ---------------------------- 상품 리스트 ---------------------------- */

	/** 선민: 상품 리스트 - 전체 상품 리스트 */
	@GetMapping(value = "/goods/goodsList")
	public String selectGoodsList(Model model) throws Exception {
		log.info("===== 상품 리스트 =====");

		List<GoodsBean> goodsList = goodsService.selectGoodsList();
		log.info("상품 리스트: " + goodsList);
		model.addAttribute("goodsList", goodsList);

		return "goods/goodsList";
	}

	/** 은정: 상품 리스트 - 검색 */
	@GetMapping(value = "/goods/goodsSearch")
	public String goodsSearch(String searchKeyword, String searchOption, Model model) throws Exception {
		log.info("===== 상품 검색결과 리스트 =====");
		log.info("---------------------------------");
		log.info("검색어: " + searchKeyword);
		log.info("검색옵션: " + searchOption);

		List<GoodsBean> goodsList = goodsService.selectGoodsSearchList(searchKeyword, searchOption);
		model.addAttribute("goodsList", goodsList);
		model.addAttribute("selectedSearchOption", searchOption);

		return "goods/goodsList";
	}

	/** 은정: 상품 리스트 - 정렬 */
	// 1차 취합 전까지 일단 비워놓을게요!!

	
	/** 선민: 상품 리스트 - 나의 상품 리스트 */
//	@PostMapping(value = "/myPage/myGoods")
	@RequestMapping(value = "/myPage/myGoods") // 일단 RequestMapping -> 추후 myPage 탭 완성되면 PostMapping
	public String myGoods(HttpSession session, Model model) throws Exception {
		log.info("===== 내 작품 관리 =====");
		
		// (1) 세션 정보 확인
		log.info("---------- (1) 세션 정보 확인 ----------");
		SellerBean sellerBean = getSessionSeller(session);
		int memberNum = sellerBean.getMemberNum(); 
		log.info("memberNum: " + memberNum);
		
		
		// (2) 내 작품 리스트 가져오기
		log.info("---------- (2) 내 작품 리스트 가져오기 ----------");
		Map<String, List<GoodsBean>> myGoodsMap = goodsService.selectMyGoodsList(memberNum);
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
	public String goodsRegisterPro(HttpSession session, MultipartFile[] uploadFile, HttpServletRequest request, GoodsBean goodsBean, String[] goodsOptNameArr, String[] goodsOptContentArr, int[] goodsOptPriceArr, Model model) throws Exception {
		log.info("===== 상품 등록 처리 =====");
		
		// (1) 파일 파라미터 확인
		log.info("---------- (1) 파일 파라미터 확인 ----------");
		log.info("파라미터 uploadFile의 객체 유무: " + uploadFile);
		log.info("요청받은 파라미터의 개수: " + uploadFile.length);

		// (2) 세션 정보 확인
		log.info("---------- (2) 세션 정보 확인 ----------");
		SellerBean sellerBean = getSessionSeller(session);
		log.info("sellerBean: " + sellerBean);
		
		// (3) 파일 업로드
		log.info("---------- (3) 파일 업로드 메소드 호출 ----------");
//		List<ImageBean> imageBeanList = goodsService.goodsFileUpload(uploadFile, request);
		
		List<ImageBean> imageBeanList = fileUtils.goodsFileUpload(uploadFile);
		
		// (4) 상품 등록
		log.info("---------- (4) 상품 등록 ----------");
		goodsBean.setGoodsPrice(goodsOptPriceArr[0]); // 추가옵션 첫번째 옵션의 첫번째 항목 가격을 해당 상품의 대표가격으로 set
		int selectKeyGoodsNum = goodsService.insertGoods(sellerBean, goodsBean, imageBeanList);
		
		// (5) 상품 추가옵션 등록
		log.info("---------- (5) 상품 추가옵션 등록 ----------");
		goodsService.insertGoodsOption(selectKeyGoodsNum, goodsOptNameArr, goodsOptContentArr, goodsOptPriceArr);

		// (6) 이미지파일 정보를 DB에 저장
		log.info("---------- (6) 이미지파일 정보 DB 저장 ----------");
		imageService.insertImage(imageBeanList, selectKeyGoodsNum);

		return "redirect:/myPage/myGoods";
	}

	
	/** 선민: 상품 임시저장 - DB에 데이터 저장 (goodsStatus = '임시저장') */
	@PostMapping(value = "/goods/goodsRegisterTempPro")
	public String goodsRegisterTempPro(HttpSession session, MultipartFile[] uploadFile, HttpServletRequest request, GoodsBean goodsBean, String[] goodsOptNameArr, String[] goodsOptContentArr, int[] goodsOptPriceArr, Model model) throws Exception {
		log.info("===== 상품 임시 저장 =====");
		
		// (1) 파일 파라미터 확인
		log.info("---------- (1) 파일 파라미터 확인 ----------");
		log.info("파라미터 uploadFile의 객체 유무: " + uploadFile);
		log.info("요청받은 파라미터의 개수: " + uploadFile.length);
		
		// (2) 세션 정보 확인
		log.info("---------- (2) 세션 정보 확인 ----------");
		SellerBean sellerBean = getSessionSeller(session);
		log.info("sellerBean: " + sellerBean);
		
		// (3) 파일 업로드
		log.info("---------- (3) 파일 업로드 메소드 호출 ----------");
		List<ImageBean> imageBeanList = fileUtils.goodsFileUpload(uploadFile);
		
		// (4) 상품 등록
		log.info("---------- (4) 상품 등록 ----------");
		goodsBean.setGoodsPrice(goodsOptPriceArr[0]); // 추가옵션 첫번째 옵션의 첫번째 항목 가격을 해당 상품의 대표가로 책정
		int selectKeyGoodsNum = goodsService.insertTempGoods(sellerBean, goodsBean, imageBeanList);
		
		// (5) 상품 추가옵션 등록
		log.info("---------- (5) 상품 추가옵션 등록 ----------");
		goodsService.insertGoodsOption(selectKeyGoodsNum, goodsOptNameArr, goodsOptContentArr, goodsOptPriceArr);

		// (6) 이미지파일 정보를 DB에 저장
		log.info("---------- (6) 이미지파일 정보 DB 저장 ----------");
		imageService.insertImage(imageBeanList, selectKeyGoodsNum);

		return "redirect:/myPage/myGoods";
	}

	
	/* ---------------------------- 상품 수정 ---------------------------- */

	/** 선민: 상품 수정 - 수정 폼 이동 */
	@PostMapping(value = "/goods/goodsModifyForm")
	public String goodsModifyForm(String goodsNum, Model model) throws Exception {
		log.info("===== 상품 수정 폼 =====");
		log.info("goodsNum: " + goodsNum);
		
		GoodsBean goodsBean = goodsService.selectGoodsInfo(goodsNum);
		model.addAttribute("goods", goodsBean);
		return "goods/goodsRegisterForm";
	}
	
	
	/* ---------------------------- 상품 삭제 ---------------------------- */

	/** 선민: 상품 삭제 - DB에서 데이터 삭제 (Ajax가 반환한 result 데이터를 jsp에 그려서 가져오기) */
	@PostMapping(value = "/goods/goodsDeletePro")
	public String goodsDeletePro(HttpSession session, int goodsNum, Model model) throws Exception {
		log.info("===== 상품 삭제 처리 =====");
		log.info("삭제할 상품 번호: " + goodsNum);

		// (1) 상품 삭제
		log.info("---------- (1) 상품 삭제 ----------");
		goodsService.deleteGoods(goodsNum);

		// (2) 세션 정보 확인
		log.info("---------- (2) 세션 정보 확인 ----------");
		SellerBean sellerBean = getSessionSeller(session);
		int memberNum = sellerBean.getMemberNum();
		log.info("memberNum: " + memberNum);

		// (3) 내 작품 리스트 가져오기
		log.info("---------- (3) 내 작품 리스트 가져오기 ----------");
		Map<String, List<GoodsBean>> myGoodsMap = goodsService.selectMyGoodsList(memberNum);
		model.addAttribute("myGoodsMap", myGoodsMap);

		return "myPage/myGoodsAjax";
	}

	
	/* ---------------------------- 상품 상세보기 ---------------------------- */

	/** 선민: 상품 상세보기 */
	@GetMapping(value = "/goods/goodsDetail")
	public String goodsDetail(Model model, String goodsNum, Criteria cri, RCriteria rcri) throws Exception {
		log.info("===== 상품 상세보기 =====");
		
		// (1) 상품 정보 가져오기
		log.info("---------- (1) 상품 정보 가져오기 ----------");
		GoodsBean goodsBean = goodsService.selectGoodsInfo(goodsNum);
		log.info("goodsBean: " + goodsBean);
		
		// (2) 상품 존재유무 판별
		log.info("---------- (2) 상품 존재유무 ----------");
		if (goodsBean == null) { 
			log.info("상품이 존재하지 않음");
			return "redirect:/goods/goodsList";
		} else {
			log.info("상품이 존재함");
		}
		
		// (3) 상품 추가옵션 가져오기
		log.info("---------- (3) 상품 추가옵션 가져오기 ----------");
		int optionCount = goodsService.selectGoodsOptionCount(goodsNum);
		log.info("옵션의 개수: " + optionCount);
		List<List<GoodsOptionBean>> optionList = goodsService.selectGoodsOptionContent(goodsNum, optionCount);
		
		model.addAttribute("detail", goodsBean);
		model.addAttribute("optionList", optionList);
		model.addAttribute("optionCount", optionCount);

		
		
		
//		// 게시판 쪽 페이징
//		/** 의종: goodsQNA 리스트 가져오기 및 페이징 */
//		int amount = cri.getAmount();
//		int pageNum = cri.getPageNum();
//		int total=goodsQNAService.getGoodsQNATotalCount(cri,goodsNum); 
//		
//		model.addAttribute("list" , goodsQNAService.goodsQNAList(goodsNum, pageNum, amount));
//		model.addAttribute("pageMaker", new PageDTO(cri, total));
//		model.addAttribute("goodsNum" , goodsNum);
//		
//		
//		model.addAttribute("detail", goodsService.selectGoodsInfo(goodsNum));
//		model.addAttribute("optionList", optionList);
//		model.addAttribute("optionCount", optionCount);
//
//		
//		
//		/*================= 용주 작업중===============*/
//		
//		
//		
//		int rtotal=reviewService.getTotal(rcri);
//		model.addAttribute("rpageMaker", new RPageDTO(rcri, rtotal));
//		
//						
//		model.addAttribute("reviewList", reviewService.reviewList(rcri));
//		
//		log.info("sql돌려요=======================" + reviewService.reviewList(rcri));
//
//		return "goods/goodsDetail";

		return "goods/goodsDetail";
	}
	
	
	/* ---------------------------- 기타 기능 ---------------------------- */
	
	/** 선민: 세션 정보 받아오기 - 일반회원 */
	private MemberBean getSessionMember(HttpSession session) {
		MemberBean memberBean = (MemberBean)session.getAttribute("loginMember"); // 세션 정보 저장 (이식성을 고려하여 웹 의존성이 있는 로직은 Controller에 작성)
		return memberBean;
	}
	
	
	/** 선민: 세션 정보 받아오기 - 작가 */
	private SellerBean getSessionSeller(HttpSession session) {
		SellerBean sellerBean = (SellerBean)session.getAttribute("loginSeller"); // 세션 정보 저장 (이식성을 고려하여 웹 의존성이 있는 로직은 Controller에 작성)
		return sellerBean;
	}
	
}