package com.mycom.euum.review.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycom.euum.page.Criteria;
import com.mycom.euum.page.PageDTO;
import com.mycom.euum.page.RCriteria;
import com.mycom.euum.page.RPageDTO;
import com.mycom.euum.review.bean.ReviewBean;
import com.mycom.euum.review.service.ReviewService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class ReviewController {

	//////////////	리스트에서 페이징 수정 삭제 가능하게 해야할거같음
	
	@Autowired
	private ReviewService reviewService;
	
	
	
	@GetMapping("/review/list")
	public String reviewList(Model model, RCriteria rcri) {
	 
		
		
		int total=reviewService.getTotal(rcri);
		model.addAttribute("rpageMaker", new RPageDTO(rcri, total));
		
						
		model.addAttribute("reviewList", reviewService.reviewList(rcri));
		
		log.info("sql돌려요=======================" + reviewService.reviewList(rcri));
		
		return "review/reviewList";
	}
	
	@GetMapping("/review/insertForm")
	public String reviewInsertForm() {
		return "review/reviewInsertForm";
	}
	
	@PostMapping("/review/insertPro")
	public String reviewInsertPro(ReviewBean reviewBean) {
		
		reviewService.reviewInsert(reviewBean);
		
		return "redirect:/review/list";
	}
	
	@GetMapping("/review/reviewModifyForm")
	public String reviewModify(@RequestParam("reviewNum") int reviewNum, Model model) {
		
		System.out.println(reviewNum+"-============================");
		
		model.addAttribute("modify", reviewService.reviewModifyForm(reviewNum));
		
		System.out.println("수정받냐???????????????????"+reviewService.reviewModifyForm(reviewNum));
		
		return "review/reviewModifyForm";
		
	}
	
	@PostMapping("review/reviewModifyPro")
	public String reviewModifyPro(@RequestParam("reviewNum")int reviewNum, ReviewBean reviewBean) {
		
		//noticeBean.setNoticeNum(noticeNum);
		System.out.println("수정처리 빈에 무엇이 들었습니까>??????????????????"+reviewBean);
		reviewService.reviewModifyPro(reviewBean);
		
		System.out.println("수정 되냐?????????????????????"+reviewService.reviewModifyPro(reviewBean));
		
		return "redirect:/review/list";
	}
	
	@PostMapping("review/reviewDelete")
	public String reviewDeletePro(@RequestParam("reviewNum")int reviewNum, ReviewBean reviewBean) {
		
		//noticeBean.setNoticeNum(noticeNum);
		System.out.println(reviewBean);
		reviewService.reviewDelete(reviewBean);
		
		System.out.println("삭제 되냐?????????????????????"+reviewService.reviewDelete(reviewBean));
		
		return "redirect:/review/list";
	}
	
	@GetMapping("/review/myReviewList")
	public String myReviewList(Model model, Criteria cri) {
	
		int total=reviewService.myGetTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
							
		model.addAttribute("reviewList", reviewService.myReviewList(cri));
		
		log.info("sql돌려요=======================" + reviewService.myReviewList(cri));
		
		return "review/myReviewList";
	}
}
