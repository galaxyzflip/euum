package com.mycom.euum.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mycom.euum.member.bean.MemberBean;
import com.mycom.euum.member.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class MemberController {
	
	private MemberService memberService;

	//테스트용... 임시 사용
	@GetMapping("/main")
	public String test() {
		return "main/main";
	}
	
	
	//로그인 폼 로드
	@GetMapping("/member/loginForm")
	public String loginForm() {
		
		return "member/loginForm";
	}
	
	
	//로그인 처리
	@PostMapping("/member/loginPro")
	public String loginPro(MemberBean bean, HttpServletRequest request, RedirectAttributes rttr) {
		HttpSession session = request.getSession();
	
		MemberBean loginUser = memberService.loginService(bean); 
		
		if(loginUser != null) {
			session.setAttribute("loginUser", loginUser);
			session.setMaxInactiveInterval(60 * 30);
			
			return "redirect:/main";
			
		}else {
			rttr.addFlashAttribute("result", "loginFail");
			return "redirect:/member/loginForm";
		}
		
	}
	
	//로그아웃...
	@GetMapping("/member/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		
		return "redirect:/main";
	}
	
	//계정찾기 폼 로드... 인증은 어떻게 할 것인가...
	@GetMapping("/member/findAccountForm")
	public String findAccountForm() {
		
		return "member/findAccountForm";
	}
	
	//계정찾기 처리... 하나의 메소드로 처리할것인가 나눠서 작업할것인가...
	@PostMapping("/member/findIdPro")
//	public String findAccountPro(MemberBean bean, @RequestParam("target") String target) {
	public String findIdPro(MemberBean bean, Model model) {
		
		Map<String, Object> resultMap = memberService.findId(bean);
		log.info("findId resultMap 결과 : " + resultMap.toString());
		log.info(resultMap.toString());
		
		
		model.addAttribute("resultMap", resultMap);
		
		return "member/findAccountPro";
	}
	
	
	@PostMapping("/member/findPwPro")
	public String findPwPro(MemberBean bean, Model model) {
		
		Map<String, Object> resultMap = memberService.findId(bean);
		
		model.addAttribute("resultMap", resultMap);
		
		return "member/resetPassword";
	}
	
	
	@PostMapping("/member/resetPass")
	public String resetPassPro(MemberBean bean, @RequestParam("memberPassword_check") String memberPassword_check, RedirectAttributes rttr) {
		
		int result = memberService.resetPassword(bean, memberPassword_check);
		
		if(result == 1) {
			rttr.addFlashAttribute("result", "resetSuccess");
		}else {
			rttr.addFlashAttribute("result", "resetError");
		}
		
		return "redirect:/member/loginForm";
	}
	
	@GetMapping("/member/leaveForm")
	public void leaveForm() {
		
	}
	
	@PostMapping("member/leavePro")
	public String leavePro(MemberBean bean, @RequestParam("memberPassword_check") String memberPassword_check) {
		
		
		
		return null;
	}
	

	
}
