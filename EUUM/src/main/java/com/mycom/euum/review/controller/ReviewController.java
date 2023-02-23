package com.mycom.euum.review.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.mycom.euum.commons.FileUtils;
import com.mycom.euum.image.bean.ImageBean;
import com.mycom.euum.image.service.ImageService;
import com.mycom.euum.member.bean.MemberBean;
import com.mycom.euum.page.Criteria;
import com.mycom.euum.page.PageDTO;
import com.mycom.euum.page.RCriteria;
import com.mycom.euum.page.RPageDTO;
import com.mycom.euum.review.bean.ReviewBean;
import com.mycom.euum.review.service.ReviewService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@AllArgsConstructor
public class ReviewController {

	////////////// 리스트에서 페이징 수정 삭제 가능하게 해야할거같음

	@Autowired
	private ReviewService reviewService;
    private FileUtils fileUtils;
    private ImageService imageService;

	@GetMapping("/review/list")
	public String reviewList(Model model, RCriteria rcri) {

		int total = reviewService.getTotal(rcri);
		model.addAttribute("rpageMaker", new RPageDTO(rcri, total));

		model.addAttribute("reviewList", reviewService.reviewList(rcri));


		return "review/reviewList";
	}

	@GetMapping("/review/insertForm")
	public String reviewInsertForm(@RequestParam("goodsNum") String goodsNum,
			@RequestParam("orderKeyNum") int orderKeyNum, HttpServletRequest request, Model model,
			HttpSession session) {

		model.addAttribute("goodsNum", goodsNum);
		model.addAttribute("orderKeyNum", orderKeyNum);
		log.info("주문번호 받아오는지===================" + orderKeyNum);

		// (2) 세션 정보 확인
		log.info("---------- (2) 세션 정보 확인 ----------");
		MemberBean memberBean = (MemberBean) session.getAttribute("loginUser");
		int memberNum = memberBean.getMemberNum();
		log.info("memberNum: " + memberNum);
		String memberName = memberBean.getMemberName();
		log.info("memberName: " + memberName);

		model.addAttribute("memberNum", memberNum);
		model.addAttribute("memberName", memberName);

		return "review/reviewInsertForm";
	}

	@PostMapping("/review/insertPro")
	public String reviewInsertPro(ReviewBean reviewBean, HttpServletRequest request, MultipartFile[] uploadFile)throws Exception {
        
		int reviewSelectKey = reviewService.reviewInsert(reviewBean,request);
		
		
        List<ImageBean> imageBeanList = fileUtils.reviewFileUpload(uploadFile);
        log.info("ccff");
        imageService.insertImage(imageBeanList, reviewSelectKey);
        log.info("ffrr");
        
		return "redirect:/review/list";
	}


	@GetMapping("/review/reviewModifyForm")
	public String reviewModify(@RequestParam("reviewNum") int reviewNum, Model model) {

		System.out.println(reviewNum + "-============================");

		model.addAttribute("modify", reviewService.reviewModifyForm(reviewNum));
		
		//리뷰이미지
		model.addAttribute("image", reviewService.getSelectRimage(reviewNum));

		System.out.println("수정받냐???????????????????" + reviewService.reviewModifyForm(reviewNum));

		return "review/reviewModifyForm";

	}

	@PostMapping("review/reviewModifyPro")
	public String reviewModifyPro(@RequestParam("reviewNum") int reviewNum, ReviewBean reviewBean, MultipartFile[] uploadFile)throws Exception {

		/* int rNum = reviewBean.getReviewNum(); */
		System.out.println("수정처리 빈에 무엇이 들었습니까>??????????????????" + reviewBean);
		reviewService.reviewModifyPro(reviewBean);

		 log.info("===== 상품 수정 처리 =====");
		 List<ImageBean> imageBeanList = fileUtils.reviewFileUpload(uploadFile);
		 
		 log.info("---------- (6) 이미지파일 정보 DB 저장 ----------");
		 log.info("이미지 쿼리 동작하기 전 imageBeanList: " + imageBeanList);
		 imageService.updateImage(imageBeanList, reviewNum);
		
		return "redirect:/myPage/orderList";
	}

	@PostMapping("review/reviewDelete")
	public String reviewDeletePro(@RequestParam("reviewNum") int reviewNum, ReviewBean reviewBean) {

		// noticeBean.setNoticeNum(noticeNum);
		System.out.println(reviewBean);
		reviewService.reviewDelete(reviewBean);

		System.out.println("삭제 되냐?????????????????????" + reviewService.reviewDelete(reviewBean));

		return "redirect:/review/list";
	}

	@GetMapping("/myPage/goodsReview")
	public String myReviewList(Model model, Criteria cri, HttpSession session) {

		MemberBean loginUser = (MemberBean) session.getAttribute("loginUser");
		cri.setMemberNum(loginUser.getMemberNum());
		int total = reviewService.myGetTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));

		model.addAttribute("reviewList", reviewService.myReviewList(cri));

		log.info("sql돌려요=======================" + reviewService.myReviewList(cri));

		return "myPage/myReviewList";
	}
}
