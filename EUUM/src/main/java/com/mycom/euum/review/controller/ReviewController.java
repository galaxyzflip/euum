package com.mycom.euum.review.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.mycom.euum.notice.bean.NoticeBean;
import com.mycom.euum.review.bean.ReviewBean;
import com.mycom.euum.review.service.ReviewService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	private ReviewBean reviewBean;
	
	@GetMapping("/review/list")
	public String noticeList(Model model) {
	
		ReviewBean reviewBean = new ReviewBean();
		
		reviewBean.setGoodsNum(1);
		
		System.out.println("빈이==================="+reviewBean);
				
		model.addAttribute("reviewList", reviewService.reviewList(reviewBean));
		
		log.info("sql돌려요=======================" + reviewService.reviewList(reviewBean));
		
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
}
