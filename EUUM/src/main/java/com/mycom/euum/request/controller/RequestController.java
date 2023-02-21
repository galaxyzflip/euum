package com.mycom.euum.request.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycom.euum.page.RqCriteria;
import com.mycom.euum.page.RqPageDTO;
import com.mycom.euum.request.bean.RequestBean;
import com.mycom.euum.request.service.RequestService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class RequestController {

	@Autowired
	private RequestService requestService;
	
	@GetMapping("/request/requestInsertForm")
	public String requestInsertForm() {
		return "request/requestInsertForm";
	}
	
	@PostMapping("/request/requestInsertPro")
	public String requestInsertPro(RequestBean requestBean) {
		
		log.info("의뢰등록======================="+requestBean);
		
		requestService.requestInsert(requestBean);
		
		return "redirect:/request/requestList";
	}
	
	@GetMapping("/request/requestList")
	public String requestList(Model model, RqCriteria rqcri) {				
		
		model.addAttribute("rqlist", requestService.requestList(rqcri));
		log.info("모델에 뭐들었지=======================" + model);
		
		int total=requestService.getTotal(rqcri);     //공지사항(1)번만 토탈로 불러오게 함 
		model.addAttribute("rqpageMaker", new RqPageDTO(rqcri, total));
		
		log.info("sql돌려요=======================" + requestService.requestList(rqcri));
		log.info("이거 전체 몇개냐=======================" + new RqPageDTO(rqcri, total));
		
		
		return "request/requestList";
	}
	
	@PostMapping("/request/requestCategoryChange")
	public String requestCategoryChange(Model model, RqCriteria rqcri) {				
		
		model.addAttribute("rqlist", requestService.requestList(rqcri));
		log.info("모델에 뭐들었지=======================" + model);
		
		int total=requestService.getTotal(rqcri);     
		model.addAttribute("rqpageMaker", new RqPageDTO(rqcri, total));
		
		log.info("sql돌려요=======================" + requestService.requestList(rqcri));
		log.info("이거 전체 몇개냐=======================" + new RqPageDTO(rqcri, total));
		
		
		return "request/requestList";
	}
	
	@GetMapping("/request/requestDetail")
	public String requestDetail(@RequestParam("requestNum") int requestNum, Model model, @ModelAttribute("rqcri") RqCriteria rqcri) {
		
		System.out.println("의뢰게시판 번호 몇번???????????????????"+requestNum);
		
		
		model.addAttribute("detail", requestService.requestDetail(requestNum));
		
		System.out.println("sql받냐???????????????????"+requestService.requestDetail(requestNum));
		
		return "request/requestDetail";
	}
	
	@GetMapping("/request/requestModifyForm")
	public String requestModifyForm(@RequestParam("requestNum") int requestNum, Model model) {
		
		model.addAttribute("requestModify", requestService.requestModifyForm(requestNum));
		
		log.info("리뷰 수정 입니다======================================================");
		log.info(requestService.requestModifyForm(requestNum));
		return "request/requestModify";
	}
	
	@PostMapping("/request/requestModifyPro")
	public String requestModifyPro(@RequestParam("requestNum") int requestNum, RequestBean requestBean) {
		
		requestService.requestModifyPro(requestBean);
		
		log.info("리뷰 수정 처리 입니다======================================================");
		log.info(requestService.requestModifyPro(requestBean));
		
		return "redirect:/request/requestList";
	}
	
	@PostMapping("/request/requestDelete")
	public String requestDelete(@RequestParam("requestNum") int requestNum, RequestBean requestBean) {
		
		requestService.requestDelete(requestBean);
		log.info("리뷰 삭제 처리 입니다======================================================");
		log.info(requestService.requestDelete(requestBean));
		
		
		return "redirect:/request/requestList";
	}
}
