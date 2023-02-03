package com.mycom.euum.notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycom.euum.notice.bean.NoticeBean;
import com.mycom.euum.notice.service.NoticeService;
import com.mycom.euum.page.Criteria;
import com.mycom.euum.page.PageDTO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class NoticeController {
	
	
	@Autowired
	private NoticeService noticeService;
	
	
	
	//공지사항 리스트
	@GetMapping("/notice/notice")
	public String noticeList(Model model, Criteria cri) {
		
//		int noticeCategory = noticeService.category();
//		
//		System.out.println("category----------------------" + noticeCategory);
		
		
		model.addAttribute("list",noticeService.noticeList(cri));
		model.addAttribute("FAQ", noticeService.FAQList());
		
		int total=noticeService.getTotal(cri);     //공지사항(1)번만 토탈로 불러오게 함 
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		log.info("sql돌려요=======================" + noticeService.noticeList(cri));
		log.info("이거 전체 몇개냐=======================" + new PageDTO(cri, total));
		log.info("모델에 뭐들었지=======================" + model);
		
		return "notice/noticeList";
	}
	
	
	//공지사항 등록 폼으로 이동
	@GetMapping("/notice/noticeInsertForm")
	public String noticeInsertForm() {
		return "notice/noticeInsertForm";
	}
	
	//공지사항 등록처
	@PostMapping("/notice/noticeInsertPro")
	public String noticeInsertPro(NoticeBean noticeBean) {
		
		log.info(noticeBean);
		noticeService.noticeInsert(noticeBean);
				
		return "redirect:/notice/notice";
	}
	
	@GetMapping("/notice/detail")
	public String noticeDetail(@RequestParam("noticeNum") int noticeNum, @ModelAttribute("cri") Criteria cri ,Model model) {
		
		System.out.println("받냐???????????????????"+noticeNum);
		
		
		model.addAttribute("detail", noticeService.noticeDetail(noticeNum));
		
		System.out.println("받냐???????????????????"+noticeService.noticeDetail(noticeNum));
		
		//noticeService.noticeDetail(noticeNum);
		
		return "notice/noticeDetail";
	}
	
	@GetMapping("/notice/noticeModifyForm")
	public String noticeModify(@RequestParam("noticeNum") int noticeNum, @ModelAttribute("cri") Criteria cri , Model model) {
		
		model.addAttribute("modify", noticeService.noticeModify(noticeNum));
		
		System.out.println("수정받냐???????????????????"+noticeService.noticeModify(noticeNum));
		
		return "notice/noticeModifyForm";
		
	}
	
	@PostMapping("notice/noticeModifyPro")
	public String noticeModifyPro(@RequestParam("noticeNum")int noticeNum, NoticeBean noticeBean) {
		
		//noticeBean.setNoticeNum(noticeNum);
		System.out.println(noticeBean);
		noticeService.noticeModifyPro(noticeBean);
		
		System.out.println("수정 되냐?????????????????????"+noticeService.noticeModifyPro(noticeBean));
		
		return "redirect:/notice/notice";
	}
	
	@PostMapping("notice/noticeDelete")
	public String noticeDelete(NoticeBean noticeBean) {
		
		noticeService.noticeDelete(noticeBean);
		
		return "redirect:/notice/notice";
	}
}
