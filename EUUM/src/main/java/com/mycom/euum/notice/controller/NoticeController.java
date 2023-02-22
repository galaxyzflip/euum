package com.mycom.euum.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.mycom.euum.commons.FileUtils;
import com.mycom.euum.image.bean.ImageBean;
import com.mycom.euum.image.service.ImageService;
import com.mycom.euum.notice.bean.NoticeBean;
import com.mycom.euum.notice.service.NoticeService;
import com.mycom.euum.page.Criteria;
import com.mycom.euum.page.PageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@AllArgsConstructor
public class NoticeController {
	
	
	@Autowired
	private NoticeService noticeService;	
	private ImageService imageService;
	private FileUtils fileUtils; 
	
	
	
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
	
	@GetMapping("/admin/notice")
	public String adminNoticeList(Model model, Criteria cri) {
		
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
	public String noticeInsertPro(NoticeBean noticeBean ,MultipartFile[] uploadFile)throws Exception {
		
		int noticeKey = noticeService.noticeInsert(noticeBean);
		
		List<ImageBean> imageBeanList = fileUtils.noticeFileUpload(uploadFile);	
		 
		imageService.insertImage(imageBeanList, noticeKey);
				
		return "redirect:/notice/notice";
	}
	
	@GetMapping("/notice/detail")
	public String noticeDetail(@RequestParam("noticeNum") int noticeNum, @ModelAttribute("cri") Criteria cri ,Model model) {
		
		System.out.println("받냐???????????????????"+noticeNum);
		
		//고객문의 이미지 리스트
		model.addAttribute("image", imageService.selectNoticeImage(noticeNum));
		model.addAttribute("detail", noticeService.noticeDetail(noticeNum));
		
		System.out.println("이미지 받=============================" +imageService.selectNoticeImage(noticeNum));
		
		System.out.println("받냐???????????????????"+noticeService.noticeDetail(noticeNum));
		
		//noticeService.noticeDetail(noticeNum);
		
		return "notice/noticeDetail";
	}
	
	@GetMapping("/notice/noticeModifyForm")
	public String noticeModify(@RequestParam("noticeNum") int noticeNum, @ModelAttribute("cri") Criteria cri , Model model) {
		
		//고객문의 이미지 리스트
		model.addAttribute("image", imageService.selectNoticeImage(noticeNum));
		model.addAttribute("modify", noticeService.noticeModify(noticeNum));
		
		System.out.println("수정받냐???????????????????"+noticeService.noticeModify(noticeNum));
		
		return "notice/noticeModifyForm";
		
	}
	
	@PostMapping("notice/noticeModifyPro")
	public String noticeModifyPro(@RequestParam("noticeNum")int noticeNum, NoticeBean noticeBean,MultipartFile[] uploadFile)throws Exception {
		
     System.out.println("notice숫자==================" + noticeNum);		
     
     noticeService.noticeModifyPro(noticeBean);
     
	log.info("===== 이미지 수정 처리 ====="); 
	List<ImageBean> imageBeanList = fileUtils.noticeFileUpload(uploadFile);
	
	  log.info("---------- (6) 이미지파일 정보 DB 저장 ----------");
	  log.info("이미지 쿼리 동작하기 전 imageBeanList: " + imageBeanList);
	  imageService.updateImage(imageBeanList, noticeNum);
		 
	      return "redirect:/notice/notice";
	}
	
	@PostMapping("notice/noticeDelete")
	public String noticeDelete(NoticeBean noticeBean) {
		
		noticeService.noticeDelete(noticeBean);
		
		return "redirect:/notice/notice";
	}
}
