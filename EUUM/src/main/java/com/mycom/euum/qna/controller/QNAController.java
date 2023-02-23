package com.mycom.euum.qna.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.mycom.euum.commons.FileUtils;
import com.mycom.euum.image.bean.ImageBean;
import com.mycom.euum.image.service.ImageService;
import com.mycom.euum.member.bean.MemberBean;
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
	
	private ImageService imageService;
	private FileUtils fileUtils; 
	private QNAService qnaService;
		
	@GetMapping("/qna/List")
	public String qnaList(Model model,Criteria cri) {
				
		model.addAttribute("list", qnaService.qnaList(cri));
		
		int total=qnaService.getQNATotalCount(cri); 
		model.addAttribute("pageMaker", new PageDTO(cri, total));
			
		return "qna/qnaList";
	}
	
	@RequestMapping("/qna/insertForm")
	public String openInsert(Model model, HttpSession session) {
		
		// (2) 세션 정보 확인
		log.info("---------- (2) 세션 정보 확인 ----------");
		MemberBean memberBean = (MemberBean)session.getAttribute("loginUser");
		String memberName = memberBean.getMemberName();
		log.info("memberName: " + memberName);
		int memberNum = memberBean.getMemberNum();
		log.info("memberNum: " + memberNum);

		model.addAttribute("memberNum", memberNum);	
		model.addAttribute("memberName", memberName);	
		
		return "qna/qnaInsertForm";
	}
	
	@PostMapping( "/qna/InsertPro")
	public String insertPro(QNABean qnaBean, HttpServletRequest request,MultipartFile[] uploadFile)throws Exception {

	    int qnaSelectKey = qnaService.qnaInsert(qnaBean, request); 
		
		List<ImageBean> imageBeanList = fileUtils.qnaFileUpload(uploadFile);	
		 
		imageService.insertImage(imageBeanList, qnaSelectKey);
		
		/* qnaService.qnaInsert(qnaBean, request); */
		
		return "redirect:/qna/List";
	}
	
	@GetMapping("/qna/Detail")
	public String qnaDetail(@RequestParam("qnaNum") int qnaNum, Model model, HttpSession session) {
		
		qnaService.updateQNAcnt(qnaNum);
		
		MemberBean memberBean = (MemberBean)session.getAttribute("loginUser");
		if(memberBean != null) {
			int memberNum = memberBean.getMemberNum();
			
			model.addAttribute("memberNum", memberNum);	
	    }
			
		
		model.addAttribute("detail", qnaService.qnaDetail(qnaNum));
		log.info("member가져옴???????????????///" + qnaService.qnaDetail(qnaNum));
		//고객문의 이미지 리스트
		model.addAttribute("image", imageService.selectQNAImage(qnaNum));
		
		log.info("이미지 잘가져오는지 ========================================" + imageService.selectQNAImage(qnaNum));
		
		return "qna/qnaDetail";
	}
	
	@PostMapping("/qna/Delete")
	public String qnaDelete(QNABean qnaBean) {
		qnaService.qnaDelete(qnaBean);
		
		return "redirect:/qna/List";
	}
	
	//답변글 등록폼
	@RequestMapping("/qna/rewriteForm")
	public String openrewrite(@RequestParam("qnaNum") int qnaNum, Model model,HttpSession session) {
		
		model.addAttribute("re", qnaService.selectInfo(qnaNum));
		log.info("등록폼 받아오는거=======================" + qnaService.selectInfo(qnaNum));
		
		// (2) 세션 정보 확인
		log.info("---------- (2) 세션 정보 확인 ----------");
		MemberBean memberBean = (MemberBean)session.getAttribute("loginUser");
		int memberNum = memberBean.getMemberNum();
		log.info("memberNum: " + memberNum);
		String memberName = memberBean.getMemberName();
		log.info("memberName: " + memberName);

		model.addAttribute("memberNum", memberNum);
		model.addAttribute("memberName", memberName);
	    
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
			
			//고객문의 이미지 리스트
			model.addAttribute("image", imageService.selectQNAImage(qnaNum));

			return "qna/qnaModifyForm";
		}
	 
	 //수정하기
	 @PostMapping("/qna/modifyPro")
		public String qnaModifyPro(Model model,QNABean qnaBean, MultipartFile[] uploadFile)throws Exception {
		 
		 int qnaNum = qnaBean.getQnaNum();
		 
		 log.info("===== 상품 수정 처리 =====");
		 List<ImageBean> imageBeanList = fileUtils.qnaFileUpload(uploadFile);
		 
		 qnaService.qnaModifyPro(qnaBean);
		 
		 log.info("---------- (6) 이미지파일 정보 DB 저장 ----------");
		 log.info("이미지 쿼리 동작하기 전 imageBeanList: " + imageBeanList);
		 imageService.updateImage(imageBeanList, qnaNum);
		 
		 
		   return "redirect:/qna/List";
		}
	 


}