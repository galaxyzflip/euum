package com.mycom.euum.qna.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycom.euum.page.Criteria;
import com.mycom.euum.page.PageDTO;
import com.mycom.euum.qna.bean.QNABean;
import com.mycom.euum.qna.service.QNAService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@AllArgsConstructor
public class QNAController {
	
	private QNAService qnaService;
		
	@GetMapping("/qna/List")
	public String qnaList(Model model,Criteria cri) {
				
		model.addAttribute("list", qnaService.qnaList(cri));
		
		int total=qnaService.getQNATotalCount(cri); 
		model.addAttribute("pageMaker", new PageDTO(cri, total));
			
		return "qna/qnaList";
	}
	
	@RequestMapping("/qna/insertForm")
	public String openInsert(Model model) {
		
		return "qna/qnaInsertForm";
	}
	
	@PostMapping( "/qna/InsertPro")
	public String insertPro(QNABean qnaBean, HttpServletRequest request) {
		
		qnaService.qnaInsert(qnaBean, request);
		
		return "redirect:/qna/List";
	}
	
	@GetMapping("/qna/Detail")
	public String qnaDetail(@RequestParam("qnaNum") int qnaNum, Model model) {
				
		model.addAttribute("detail", qnaService.qnaDetail(qnaNum));
		
		return "qna/qnaDetail";
	}
	
	@PostMapping("/qna/Delete")
	public String qnaDelete(QNABean qnaBean) {
		qnaService.qnaDelete(qnaBean);
		
		return "redirect:/qna/List";
	}
	
	//답변글 등록폼
	@RequestMapping("/qna/rewriteForm")
	public String openrewrite(@RequestParam("qnaNum") int qnaNum, Model model) {
		
		model.addAttribute("re", qnaService.selectInfo(qnaNum));
		log.info("등록폼 받아오는거=======================" + qnaService.selectInfo(qnaNum));
	    
		return "qna/qnaRewrite";
	}
	
	 //답변글 등록
	 @PostMapping("/qna/rewritePro")
	 public String rewritePro(@RequestParam("qnaNid") int qnaNid, @RequestParam("qnaOrdered") int qnaOrdered, QNABean qnaBean){
		 
		 qnaService.updateOrder(qnaNid, qnaOrdered);
		 qnaService.rewrite(qnaBean);		  
		  
		 return "redirect:/qna/List";
	 }
	 
	 //수정글 폼
	 @PostMapping("/qna/modifyForm")
		public String qnaModifyForm(@RequestParam("qnaNum") int qnaNum, Model model) {
					
			model.addAttribute("detail", qnaService.qnaDetail(qnaNum));
			System.out.println("============"+qnaNum);
			return "qna/qnaModifyForm";
		}
	 
	 //수정하기
	 @PostMapping("/qna/modifyPro")
		public String qnaModifyPro(Model model,QNABean qnaBean) {
		   
		 
		   qnaService.qnaModifyPro(qnaBean);
		  
		   return "redirect:/qna/List";
		}
	 


}