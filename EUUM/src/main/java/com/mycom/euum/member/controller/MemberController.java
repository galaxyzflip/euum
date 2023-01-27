package com.mycom.euum.member.controller;

import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public String test(HttpServletRequest request) {
		
		
		//로그인 귀찮아서 임시로 만든것... 세션 저장해줌
		HttpSession session = request.getSession();
		MemberBean loginUser = new MemberBean();
		loginUser.setMemberNum(1);
		loginUser.setMemberName("최창선");
		loginUser.setMemberEmail("sonsun33@naver.com");
		loginUser.setMemberMobile("01041746137");
		session.setAttribute("loginUser", loginUser);
		
		
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
	
	// 회원가입
	
		@GetMapping("/member/joinForm1")
		public String joinForm1() {
			return "member/joinForm1";
		}
		@GetMapping("/member/joinForm2")
		public String joinForm2() {
			return "member/joinForm2";
		}

		@PostMapping("/member/joinPro")
		public String joinPro(MemberBean memberBean) {
			System.out.println(memberBean+ "------------controller");
			memberService.insertMember(memberBean);
			return "redirect:/member/joinOk";
		}

		@GetMapping("/member/joinOk")
		public String joinOk() {
			return "member/joinOk";
		}

		@ResponseBody
		@GetMapping(value = "/member/emailCheck")
		public String idCheck(@RequestParam("email") String email) {
			
			System.out.println("email = " + email );
			int result = memberService.selectByEmail(email);
			if(result==0) {
				return "Y";
			}else {
				return "N";
			}

		}
		
		@ResponseBody
		@GetMapping(value = "/member/pwCheck")
		public String pwCheck(@RequestParam("email") String email,@RequestParam("pw") String pw) {
		
			System.out.println("------------------ email = "+email);
			System.out.println("------------------ pw = "+pw);
			Pattern passPattern1 = Pattern.compile("^(?=.*[a-zA-Z])(?=.*\\d)(?=.*\\W).{8,16}$");
			Matcher passMatcher1 = passPattern1.matcher(pw);
			
			
			
			if(!passMatcher1.find()){
			    return "1";
			}else if(pw.length()<9) {
				return "2";
			}else if(pw.length()<11) {
				return "3";
			}else if(10 < pw.length() & pw.length() < 17) {
				return "4";
			}return "0";
			
		}
		
		/*
		 * @ResponseBody
		 * 
		 * @GetMapping(value = "/member/joinAuth") public String
		 * authCheck(@RequestParam("email") String email,@RequestParam("pw") String pw)
		 * {
		 * 
		 * 
		 * 
		 * }
		 */
	

	
}
