package com.mycom.euum.review.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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
	public String noticeList(Model model, RCriteria rcri) {
	
//		int amount= rcri.getAmount();
//		int pageNum=rcri.getPageNum();
//		int total=reviewService.getTotal(rcri, goodsNum);		 
		
		
		int total=reviewService.getTotal(rcri);
		model.addAttribute("pageMaker", new RPageDTO(rcri, total));
		
						
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
	
}
