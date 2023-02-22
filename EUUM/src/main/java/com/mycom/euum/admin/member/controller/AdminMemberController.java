package com.mycom.euum.admin.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.mycom.euum.admin.member.service.AdminMemberService;
import com.mycom.euum.member.bean.MemberBean;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@AllArgsConstructor
public class AdminMemberController {

	private AdminMemberService adminMemberService;
	
	@GetMapping("/admin/memberList")
	public String adminMemberList(Model model, MemberBean memberBean) {
		
		List<MemberBean> memberList = adminMemberService.getMemberList(memberBean);
		model.addAttribute("memberList", memberList);
		
		return "admin/memberList";
	}
	
	// 회원 탈퇴 처리
	@PostMapping("/admin/leavePro")
	public String leavePro(String memberNum, String sellerNum, HttpServletRequest request) {
		
		System.out.println("----------------" + memberNum);
		adminMemberService.secessionMember(memberNum);
		adminMemberService.secessionSeller(sellerNum);
			
		return "redirect:/admin/memberList";
		
		
	}
	
}
