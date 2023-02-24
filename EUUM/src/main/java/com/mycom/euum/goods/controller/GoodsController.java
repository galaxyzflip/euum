package com.mycom.euum.goods.controller;



import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.mycom.euum.commons.FileUtils;
import com.mycom.euum.goods.bean.GoodsBean;
import com.mycom.euum.goods.bean.GoodsOptionBean;
import com.mycom.euum.goods.service.GoodsService;
import com.mycom.euum.goodsQNA.bean.GoodsQNABean;
import com.mycom.euum.goodsQNA.service.GoodsQNAService;
import com.mycom.euum.image.bean.ImageBean;
import com.mycom.euum.image.service.ImageService;
import com.mycom.euum.member.bean.MemberBean;
import com.mycom.euum.member.bean.SellerBean;
import com.mycom.euum.page.Criteria;
import com.mycom.euum.page.Criteria2;
import com.mycom.euum.page.CriteriaForGoods;
import com.mycom.euum.page.PageDTO;
import com.mycom.euum.page.PageDTO2;
import com.mycom.euum.page.PageForGoodsDTO;
import com.mycom.euum.review.service.ReviewService;

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
	private GoodsQNAService goodsQNAService;
	private ReviewService reviewService;
	private FileUtils fileUtils; // 123
	

	@RequestMapping(value = "/")
	public String test() {
		log.info("start");
		return "main_layout";
	}


	
	
	/* ---------------------------- 상품 리스트 ---------------------------- */
/** 은정: 상품 리스트 - 전체 상품 리스트(02/01 페이징추가) */
	@GetMapping(value="/goods/goodsList")
	public String selectGoodsList(Model model, Criteria2 cri, HttpSession session) throws Exception {
    
    log.info("===== 상품 리스트 =====");

		
		/* 명식님 부분 ----------------------------- */
		MemberBean loginUser = getSessionMember(session);
		
		// 로그인이 되어 있을 시
		if(loginUser!=null) {
			cri.setMemberNum(loginUser.getMemberNum());
			List<GoodsBean> goodsList = goodsService.selectCartGoodsList(cri);
			int total=goodsService.getTotal(cri);
			model.addAttribute("pageMaker", new PageDTO2(cri, total));
			model.addAttribute("goodsList", goodsList);
			log.info("로그인 되어있음");
			return "goods/goodsList";
		}else {
				
			
			/* ----------------------------------------- */
			
			System.out.println("cri 내용 : " + cri.toString());
			System.out.println("cri 내용 : " + cri.toString());
			System.out.println("cri 내용 : " + cri.toString());
			System.out.println("cri 내용 : " + cri.toString());
	
			List<GoodsBean> goodsList = goodsService.selectGoodsList(cri);
			log.info("상품 리스트: " + goodsList);
			model.addAttribute("goodsList", goodsList);
	
			int total = goodsService.getTotal(cri);
	
			model.addAttribute("pageMaker", new PageDTO2(cri, total));
			log.info("로그인 안돼있음");
			return "goods/goodsList";
		}
	}

	/** 선민: 상품리스트 - 나의 상품 리스트 */
	@Transactional
	@RequestMapping(value = "/myPage/myGoods") // 일단 RequestMapping -> 추후 myPage 탭 완성되면 PostMapping
	public String myGoods(HttpSession session, Model model, CriteriaForGoods cri) throws Exception {
		log.info("===== 내 작품 관리 =====");

		log.info("---------- (0) Criteria 확인 ----------");
		log.info("PageNum1: " + cri.getPageNum1());
		log.info("Amount1: " + cri.getAmount1());
		log.info("PageNum2: " + cri.getPageNum2());
		log.info("Amount2: " + cri.getAmount2());
		log.info("PageNum3: " + cri.getPageNum3());
		log.info("Amount3: " + cri.getAmount3());


		// (1) 세션 정보 확인
		log.info("---------- (1) 세션 정보 확인 ----------");
		SellerBean sellerBean = getSessionSeller(session);
		int memberNum = sellerBean.getMemberNum();
		log.info("memberNum: " + memberNum);

		// (2) 내 작품 리스트 가져오기
		log.info("---------- (2) 내 상품 리스트 가져오기 ----------");
		Map<String, List<GoodsBean>> myGoodsMap = goodsService.selectMyGoodsList(memberNum, cri);

		log.info("---------- (3) 내 상품 페이징 가져오기 ----------");
		Map<String, PageForGoodsDTO> pagingMap = goodsService.createMyGoodsPaging(memberNum, cri);
		log.info("pagingMap :" + pagingMap);


		model.addAttribute("myGoodsMap", myGoodsMap);
		model.addAttribute("pagingMap", pagingMap);
		model.addAttribute("memberNum", memberNum);
		log.info("컨트롤러 끝 !!!");


		
		return "myPage/myGoods";
	}



	/* ---------------------------- 상품 등록 ---------------------------- */

	/** 선민: 상품등록 약관 페이지 이동 */
	@GetMapping(value = "/goods/goodsRegisterGuide")
	public String goodsRegisterGuide() throws Exception {
		log.info("===== 상품 등록 약관 =====");
		return "goods/goodsRegisterGuide";
	}


	/** 선민: 상품등록 폼 이동 */
	@GetMapping(value = "/goods/goodsRegisterForm")
	public String goodsRegisterForm() throws Exception {
		log.info("===== 상품 등록 폼 =====");
		return "goods/goodsRegisterForm";
	}



	/** 선민: 상품등록 */
	@Transactional
	@PostMapping(value = "/goods/goodsRegisterPro")
	public String goodsRegisterPro(HttpSession session, MultipartFile[] uploadFile, GoodsBean goodsBean,
			String[] goodsOptNameArr, String[] goodsOptContentArr, int[] goodsOptPriceArr, Model model)
			throws Exception {
		log.info("===== 상품 등록 처리 =====");
		
		log.info("---------- (1) 파일 파라미터 확인 ----------");
		log.info("파라미터 uploadFile의 객체 유무: " + uploadFile);
		log.info("요청받은 파라미터의 개수: " + uploadFile.length);

		log.info("---------- (2) 세션 정보 확인 ----------");
		SellerBean sellerBean = getSessionSeller(session);
		log.info("sellerBean: " + sellerBean);


		log.info("---------- (3) 파일 업로드 메소드 호출 ----------");
		List<ImageBean> imageBeanList = fileUtils.goodsFileUpload(uploadFile);

		log.info("---------- (4) 상품 등록 ----------");
		goodsBean.setGoodsPrice(goodsOptPriceArr[0]); // 추가옵션 첫번째 옵션의 첫번째 항목 가격을 해당 상품의 대표가격으로 set
		int goodsNum = goodsService.insertGoods(sellerBean, goodsBean, imageBeanList);


		log.info("---------- (5) 상품 추가옵션 등록 ----------");
		goodsService.insertGoodsOption(goodsNum, goodsOptNameArr, goodsOptContentArr, goodsOptPriceArr);

		log.info("---------- (6) 이미지파일 정보 DB 저장 ----------");
		imageService.insertImage(imageBeanList, goodsNum);

		return "redirect:/myPage/myGoods";
	}


	/** 선민: 상품 임시저장 */
	@Transactional
	@PostMapping(value = "/goods/goodsRegisterTempPro")
	public String goodsRegisterTempPro(HttpSession session, MultipartFile[] uploadFile, HttpServletRequest request,
			GoodsBean goodsBean, String[] goodsOptNameArr, String[] goodsOptContentArr, int[] goodsOptPriceArr,
			Model model) throws Exception {
		log.info("===== 상품 임시저장 =====");

		log.info("goodsBean: " + goodsBean);
		log.info("Use값은: " + goodsBean.getGoodsUse());

		log.info("---------- (1) 파일 파라미터 확인 ----------");
		log.info("파라미터 uploadFile의 객체 유무: " + uploadFile);
		log.info("요청받은 파라미터의 개수: " + uploadFile.length);


		log.info("---------- (2) 세션 정보 확인 ----------");
		SellerBean sellerBean = getSessionSeller(session);
		log.info("sellerBean: " + sellerBean);

		log.info("---------- (3) 파일 업로드 메소드 호출 ----------");
		List<ImageBean> imageBeanList = fileUtils.goodsFileUpload(uploadFile);


		log.info("---------- (4) 상품 등록 ----------");
		goodsBean.setGoodsPrice(goodsOptPriceArr[0]); // 추가옵션 첫번째 옵션의 첫번째 항목 가격을 해당 상품의 대표가로 책정
		int goodsNum = goodsService.insertTempGoods(sellerBean, goodsBean, imageBeanList);

		log.info("---------- (5) 상품 추가옵션 등록 ----------");
		goodsService.insertGoodsOption(goodsNum, goodsOptNameArr, goodsOptContentArr, goodsOptPriceArr);
		log.info("임시저장된 상품 추가옵션 없음");

		log.info("임시저장된 상품 추가옵션 없음");


		log.info("---------- (6) 이미지파일 정보 DB 저장 ----------");
		imageService.insertImage(imageBeanList, goodsNum);

		return "redirect:/myPage/myGoods";
	}


	/* ---------------------------- 상품 수정 ---------------------------- */

	/** 선민: 상품수정 폼 이동 */
	@Transactional
	@PostMapping(value = "/goods/goodsModifyForm")
	public String goodsModifyForm(String goodsNum, Model model) throws Exception {
		log.info("===== 상품 수정 폼 =====");
		log.info("goodsNum: " + goodsNum);


		GoodsBean goodsBean = goodsService.selectGoodsInfo(goodsNum);
		int optionCount = goodsService.selectGoodsOptionCount(goodsNum);
		int optionContentCount = goodsService.selectGoodsOptionContentCount(goodsNum);
		List<List<GoodsOptionBean>> optionList = goodsService.selectGoodsOptionContent(goodsNum, optionCount);
		log.info("optionList :" + optionList);
		log.info("옵션항목 총 개수 -> optionContentCount :" + optionContentCount);
		
//		model.addAttribute("optionCount", optionCount);
		model.addAttribute("optionContentCount", optionContentCount);

		model.addAttribute("goods", goodsBean);
		model.addAttribute("optionList", optionList);
		return "goods/goodsModifyForm";
	}


	/** 선민: 상품수정 처리 */

	@Transactional
	@PostMapping(value = "/goods/goodsModifyPro")
	public String goodsModifyPro(HttpSession session, MultipartFile[] uploadFile, GoodsBean goodsBean,
			String[] goodsOptNameArr, String[] goodsOptContentArr, int[] goodsOptPriceArr, Model model)
			throws Exception {

		log.info("===== 상품 수정 처리 =====");
		int goodsNum = goodsBean.getGoodsNum();

		SellerBean sellerBean = getSessionSeller(session);
		List<ImageBean> imageBeanList = fileUtils.goodsFileUpload(uploadFile);


		log.info("---------- (4) 상품 수정 ----------");
		goodsBean.setGoodsPrice(goodsOptPriceArr[0]); // 추가옵션 첫번째 옵션의 첫번째 항목 가격을 해당 상품의 대표가격으로 set
		goodsService.updateGoods(sellerBean, goodsBean, imageBeanList);


		// (5) 상품 추가옵션 등록
		log.info("---------- (5) 상품 추가옵션 등록 ----------");
		goodsService.deleteGoodsOption(goodsNum);
		goodsService.insertGoodsOption(goodsNum, goodsOptNameArr, goodsOptContentArr, goodsOptPriceArr);

		// (6) 이미지파일 정보를 DB에 저장
		log.info("---------- (6) 이미지파일 정보 DB 저장 ----------");
		log.info("이미지 쿼리 동작하기 전 imageBeanList: " + imageBeanList);
		imageService.updateImage(imageBeanList, goodsNum);

		return "redirect:/myPage/myGoods";
	}


	/** 선민: 상품 임시저장에서 등록 */
	@Transactional
	@PostMapping(value = "/goods/goodsModifyTempToRegularPro")
	public String goodsModifyTempToRegularPro(HttpSession session, MultipartFile[] uploadFile,
			HttpServletRequest request, GoodsBean goodsBean, String[] goodsOptNameArr, String[] goodsOptContentArr,
			int[] goodsOptPriceArr, Model model) throws Exception {
		log.info("===== 임시저장 상품 최종등록 처리 =====");
		int goodsNum = goodsBean.getGoodsNum();

		log.info("---------- (1) 파일 파라미터 확인 ----------");
		log.info("파라미터 uploadFile의 객체 유무: " + uploadFile);
		log.info("요청받은 파라미터의 개수: " + uploadFile.length);

		log.info("---------- (2) 세션 정보 확인 ----------");
		SellerBean sellerBean = getSessionSeller(session);
		log.info("sellerBean: " + sellerBean);

		log.info("---------- (3) 파일 업로드 메소드 호출 ----------");
		List<ImageBean> imageBeanList = fileUtils.goodsFileUpload(uploadFile);

		log.info("---------- (4) 상품 등록 ----------");
		goodsBean.setGoodsPrice(goodsOptPriceArr[0]); // 추가옵션 첫번째 옵션의 첫번째 항목 가격을 해당 상품의 대표가격으로 set
		goodsService.updateGoods(sellerBean, goodsBean, imageBeanList);

		log.info("---------- (5) 상품 추가옵션 등록 ----------");
		goodsService.deleteGoodsOption(goodsNum);
		goodsService.insertGoodsOption(goodsNum, goodsOptNameArr, goodsOptContentArr, goodsOptPriceArr);

		log.info("---------- (6) 이미지파일 정보 DB 저장 ----------");
		imageService.updateImage(imageBeanList, goodsNum);

		return "redirect:/myPage/myGoods";
	}

	/** 선민: 상품 임시저장에서 다시 임시저장 */
	@Transactional
	@PostMapping(value = "/goods/goodsModifyTempPro")
	public String goodsModifyTempPro(HttpSession session, MultipartFile[] uploadFile, GoodsBean goodsBean,
			String[] goodsOptNameArr, String[] goodsOptContentArr, int[] goodsOptPriceArr, Model model)
			throws Exception {
		log.info("===== 임시저장 상품의 임시저장 처리 =====");
		log.info("임시저장 goodsBean: " + goodsBean);
		int goodsNum = goodsBean.getGoodsNum();

		SellerBean sellerBean = getSessionSeller(session);
		List<ImageBean> imageBeanList = fileUtils.goodsFileUpload(uploadFile);

		log.info("---------- (4) 상품 수정 ----------");
		goodsBean.setGoodsPrice(goodsOptPriceArr[0]); // 추가옵션 첫번째 옵션의 첫번째 항목 가격을 해당 상품의 대표가격으로 set
		goodsService.updateTempGoods(sellerBean, goodsBean, imageBeanList);

		// (5) 상품 추가옵션 등록
		log.info("---------- (5) 상품 추가옵션 등록 ----------");
		goodsService.deleteGoodsOption(goodsNum);
		goodsService.insertGoodsOption(goodsNum, goodsOptNameArr, goodsOptContentArr, goodsOptPriceArr);

		// (6) 이미지파일 정보를 DB에 저장
		log.info("---------- (6) 이미지파일 정보 DB 저장 ----------");
		log.info("이미지 쿼리 동작하기 전 imageBeanList: " + imageBeanList);
		imageService.updateImage(imageBeanList, goodsNum);

		return "redirect:/myPage/myGoods";
	}

	/* ---------------------------- 상품 삭제 ---------------------------- */


	/** 선민: 상품삭제 (Ajax가 반환한 result 데이터를 jsp에 그려서 가져오기) */
	@Transactional
	@PostMapping(value = "/goods/goodsDeletePro")
	public String goodsDeletePro(HttpSession session, int goodsNum, Model model, CriteriaForGoods cri)
			throws Exception {
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
		log.info("---------- (2) 내 상품 리스트 가져오기 ----------");
		Map<String, List<GoodsBean>> myGoodsMap = goodsService.selectMyGoodsList(memberNum, cri);

		log.info("---------- (3) 내 상품 페이징 가져오기 ----------");
		Map<String, PageForGoodsDTO> pagingMap = goodsService.createMyGoodsPaging(memberNum, cri);
		log.info("pagingMap :" + pagingMap);

		model.addAttribute("myGoodsMap", myGoodsMap);
		model.addAttribute("pagingMap", pagingMap);
		model.addAttribute("memberNum", memberNum);

		return "myPage/myGoodsAjax";
	}


	/* ---------------------------- 상품 상세보기 ---------------------------- */

	/** 선민: 상품 상세보기 */
	@GetMapping(value = "/goods/goodsDetail")

	public String goodsDetail(Model model, String goodsNum, Criteria cri, GoodsQNABean goodsQNABean, HttpSession session) throws Exception {
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


	/** 의종: 답변작성시 유효성검사 */		
		SellerBean sellerBean = getSessionSeller(session);
		
		if(sellerBean != null) {
		int sellerMemberNum = sellerBean.getMemberNum();
		log.info("sellerBean셀러빈 뭐받음?????????========= " + sellerBean);
		
		model.addAttribute("memberNum", sellerMemberNum);
		}


		/** 의종: goodsQNA 리스트 가져오기 및 페이징 */
		int amount = cri.getAmount();
		int pageNum = cri.getPageNum();
		int total = goodsQNAService.getGoodsQNATotalCount(cri, goodsNum);

		model.addAttribute("list", goodsQNAService.goodsQNAList(goodsNum, pageNum, amount));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		model.addAttribute("goodsNum", goodsNum);

		model.addAttribute("detail", goodsBean);
		model.addAttribute("optionList", optionList);
		model.addAttribute("optionCount", optionCount);

		return "goods/goodsDetail";
	}

	/* ---------------------------- 기타 기능 ---------------------------- */

	/** 선민: 세션 정보 받아오기 - 일반회원 */
	private MemberBean getSessionMember(HttpSession session) {
		MemberBean memberBean = (MemberBean) session.getAttribute("loginUser"); // 세션 정보 저장 (이식성을 고려하여 웹 의존성이 있는 로직은
																					// Controller에 작성)
		return memberBean;
	}

	/** 선민: 세션 정보 받아오기 - 작가 */
	private SellerBean getSessionSeller(HttpSession session) {
		SellerBean sellerBean = (SellerBean) session.getAttribute("loginSeller"); // 세션 정보 저장 (이식성을 고려하여 웹 의존성이 있는 로직은
																					// Controller에 작성)
		return sellerBean;
	}


}