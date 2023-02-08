package com.mycom.euum.member.controller;




import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.mycom.euum.commons.FileUtils;
import com.mycom.euum.member.bean.MemberBean;
import com.mycom.euum.member.bean.SellerBean;
import com.mycom.euum.member.service.MyPageService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@AllArgsConstructor
public class MyPageController {
	
	MyPageService myPageService;
	private FileUtils fileUtils;

	// 찜목록
	@GetMapping("/myPage/sellerList")
	public String test() {
		return "myPage/sellerList";
	}
	
	
	// 회원정보 상세보기 겸 수정 창
	@GetMapping("/myPage/modifyForm")
	public String memberDetail(Model model, HttpServletRequest request) {

		HttpSession session = request.getSession();
	
		
		MemberBean loginUser = (MemberBean)session.getAttribute("loginUser");
		loginUser = myPageService.getMember(loginUser.getMemberNum());
		model.addAttribute("memberDetail", loginUser);
		log.info("------------------" + loginUser.toString());

		return "myPage/memberDetail";
	}
	
	// 회원정보 수정 처리
	@PostMapping("/myPage/modifyPro")
	public String modifyMember(MemberBean bean) {
		
		myPageService.updateMember(bean);
		
		return "redirect:/myPage/modifyForm";
	}
	
	// 비밀번호 변경 창
	@GetMapping("/myPage/modifyPassForm")
	public String modifyPassForm(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
	
		
		MemberBean loginUser = (MemberBean)session.getAttribute("loginUser");
		loginUser = myPageService.getMember(loginUser.getMemberNum());
		model.addAttribute("member", loginUser);
		log.info("------------------" + loginUser.toString());
		
		return "myPage/modifyPass";
	}
	
	// 비밀번호 변경 처리
	@PostMapping("/myPage/modifyPassPro")
	public String modifyPassPro(MemberBean bean) {
		
		myPageService.updatePassword(bean);
		
		return "redirect:/myPage/modifyForm";
	}
	
	// 회원 탈퇴 창
	@GetMapping("/myPage/leaveForm")
	public String leaveForm(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
	
		
		MemberBean loginUser = (MemberBean)session.getAttribute("loginUser");
		loginUser = myPageService.getMember(loginUser.getMemberNum());
		model.addAttribute("member", loginUser);
		log.info("------------------" + loginUser.toString());
		
		return "myPage/leaveMember";
	}
	
	// 회원 탈퇴 처리
	@PostMapping("/myPage/leavePro")
	public String leavePro(String memberNum, String sellerNum, HttpServletRequest request) {

		myPageService.secessionMember(memberNum);
		
		
//		myPageService.secessionSeller(sellerNum);

		HttpSession session = request.getSession();
		
		session.invalidate();
		
		return "redirect:/main";
	}
	
	// 전문가 등급 회원으로 전환 처리
	@PostMapping("/myPage/transSeller")
	public String transSeller(SellerBean sellerBean, MemberBean memberBean) {
		
		myPageService.updateMemberClass(memberBean);
		myPageService.insertSeller(sellerBean);
		
		return "redirect:/myPage/modifyForm";
	}
	
	// 전문가 내 프로필 상세보기 겸 수정 창
	@GetMapping("/myPage/modifySellerForm")
	public String modifySellerInfo(Model model, HttpServletRequest request, String sellerNum) {
		
		HttpSession session = request.getSession();
	
		MemberBean loginUser = (MemberBean)session.getAttribute("loginUser");
		loginUser = myPageService.getMember(loginUser.getMemberNum());
		model.addAttribute("member", loginUser);
		log.info("------------------" + loginUser.toString());
		SellerBean seller = myPageService.getSeller(loginUser.getMemberNum());
		model.addAttribute("seller", seller);
		
		return "myPage/sellerDetail";
	}
	
	// 전문가 프로필 수정 처리
	@PostMapping("/myPage/modifySellerPro")
	public String modifySellerInfoPro(MultipartFile[] uploadFile, SellerBean sellerBean) {
			
		log.info("---------------------------------");
		log.info("uploadFile: " + uploadFile);
		log.info("uploadFile: " + uploadFile.length);
		log.info("index 0: " + uploadFile[0].getOriginalFilename());
		
		List<String> profile = new ArrayList<String>();
			
		/* profile = fileUtils.fileUpload(uploadFile); */
		
		sellerBean.setSellerImage(profile.get(0));
		
		myPageService.updateSeller(sellerBean);
		
		return "redirect:/myPage/modifySellerForm";
	}
	
	// 전문가 프로필 이미지 업로드
}
