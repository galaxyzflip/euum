package com.mycom.euum.goodsQNA.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.mycom.euum.commons.FileUtils;
import com.mycom.euum.goodsQNA.bean.GoodsQNABean;
import com.mycom.euum.goodsQNA.service.GoodsQNAService;
import com.mycom.euum.image.bean.ImageBean;
import com.mycom.euum.image.service.ImageService;
import com.mycom.euum.member.bean.MemberBean;
import com.mycom.euum.member.bean.SellerBean;
import com.mycom.euum.page.Criteria;
import com.mycom.euum.page.PageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@AllArgsConstructor
public class GoodsQNAController {

	private ImageService imageService;
	private FileUtils fileUtils;
	private GoodsQNAService goodsQNAService;

	/*
	 * @GetMapping("/goodsQNA/List") public String goodsQNAList(String goodsNum,
	 * Model model, HttpServletRequest request,Criteria cri) {
	 * 
	 * model.addAttribute("list" , goodsQNAService.goodsQNAList(goodsNum,cri));
	 * 
	 * 
	 * return "goodsQNA/goodsQNAList"; }
	 */

	@GetMapping("/goodsQNA/InsertForm")
	public String open(Model model, HttpServletRequest request, HttpSession session) {

		model.addAttribute("goodsNum", request.getParameter("goodsNum"));
		log.info("================상품번호==============" + request.getParameter("goodsNum"));	
		
		// (2) 세션 정보 확인
		log.info("---------- (2) 세션 정보 확인 ----------");
		MemberBean memberBean = (MemberBean)session.getAttribute("loginUser");
		int memberNum = memberBean.getMemberNum();
		log.info("memberNum: " + memberNum);
		String memberName = memberBean.getMemberName();
		log.info("memberName: " + memberName);

		model.addAttribute("memberNum", memberNum);
		model.addAttribute("memberName", memberName);		

		return "goodsQNA/goodsQNAInsertForm";
	}

	@PostMapping("/goodsQNA/InsertPro")
	public String goodsQNAInsert(GoodsQNABean goodsQNABean, HttpServletRequest request, MultipartFile[] uploadFile)
			throws Exception {

		/* 이미지 등록 */
		int goodsQNASelectKey = goodsQNAService.goodsQNAInsert(goodsQNABean);

		List<ImageBean> imageBeanList = fileUtils.goodsQNAFileUpload(uploadFile);

		imageService.insertImage(imageBeanList, goodsQNASelectKey);

		return "redirect:/goods/goodsDetail?goodsNum=" + request.getParameter("goodsNum");
	}

	@PostMapping("/goodsQNA/InsertComment")
	public String insertGoodsQNAComment(GoodsQNABean goodsQNABean, HttpServletRequest request) {

		goodsQNAService.insertGqnaComment(goodsQNABean);

		return "redirect:/goods/goodsDetail?goodsNum=" + request.getParameter("goodsNum");
	}
	
	// 나의 상품문의 내역 가져오기
	@GetMapping("myPage/goodsQNA")
	public String myGQNA(Model model, HttpSession session, Criteria cri) {
        
		// 세션 정보 가져오기
		MemberBean memberBean = (MemberBean)session.getAttribute("loginUser");
		int memberNum = memberBean.getMemberNum();
		String memberName = memberBean.getMemberName();	
		
		//페이징 정보 가져오기
		int pageNum = cri.getPageNum();
		int amount = cri.getAmount();
		int total = goodsQNAService.getmyGQNATotalCount(cri,memberNum);

		model.addAttribute("memberNum", memberNum);
		model.addAttribute("memberName", memberName);				
		model.addAttribute("list" , goodsQNAService.myGoodsQNAList(memberNum, pageNum, amount));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		log.info("나의 상품내역" + goodsQNAService.myGoodsQNAList(memberNum, pageNum, amount));
		
		return "goodsQNA/myGoodsQNA";
	}
	
	//마이페이지 상품문의 삭제
	@PostMapping("/goodsQNA/Delete")
	public String deleteGQNA(GoodsQNABean goodsQNABean) {

		goodsQNAService.deleteGQNA(goodsQNABean);
        		
		return "redirect:/myPage/goodsQNA";
	}
	
	//마이페이지 상품문의 수정
	@PostMapping("/goodsQNA/Modify")
	public String modifyGQNA(GoodsQNABean goodsQNABean) {

		goodsQNAService.modifyGQNA(goodsQNABean);
        		
		return "redirect:/myPage/goodsQNA";
	}

}
