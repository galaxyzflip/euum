package com.mycom.euum.admin.review.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycom.euum.admin.review.service.AdminReviewService;
import com.mycom.euum.review.bean.ReviewBean;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class AdminReviewController {
	
	private AdminReviewService adminReviewService;
	
	@RequestMapping("admin/reviewList")
	public String openRequest(Model model){
		
		model.addAttribute("list", adminReviewService.getAdminReviewList()); 
		
		System.out.println("review뭐가져옴??????????????" +  adminReviewService.getAdminReviewList()); 
	
		
		return "admin/review/adminReview";
	}
	
	@PostMapping("/deleteAdminReview")
	public String deleteAdminReview(ReviewBean reviewBean) {
		
		adminReviewService.deleteAdminReview(reviewBean);
		
		return "redirect:admin/reviewList"; 
	}
	
	@PostMapping("/cancelReviewDelete")
	public String cancelRdelete(ReviewBean reviewBean) {
		
		adminReviewService.cancelRdelete(reviewBean);
		
		return "redirect:admin/reviewList"; 
	}

}
