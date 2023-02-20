package com.mycom.euum.member.controller;

import java.io.IOException;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.mycom.euum.member.bean.MemberBean;
import com.mycom.euum.member.bean.SellerBean;
import com.mycom.euum.member.service.KakaoService;
import com.mycom.euum.member.service.MemberService;
import com.mycom.euum.naver.NaverLoginBO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class MemberController {

	private MemberService memberService;
	private NaverLoginBO naverLoginBO;
	private KakaoService ks;
	
    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }
    
    
    //카카오로그인 콜백 메소드, 카카오 로그인 화면에서 로그인 후 아래 메소드로 콜백
    @GetMapping("/kakaoLoginCallback")
    public String getCI(@RequestParam String code, Model model, HttpServletRequest request) throws IOException {
        System.out.println("code = " + code);
        String access_token = ks.getToken(code); 
        Map<String, Object> userInfo = ks.getUserInfo(access_token);
        
        log.info("userInfo : " + userInfo.toString());
        
        @SuppressWarnings("unchecked")
		Map<String, Object> account =  (Map<String, Object>) userInfo.get("kakao_account");
        
        @SuppressWarnings("unchecked")
		String ninkname = (String) ((Map<String, Object>)account.get("profile")).get("nickname");
        String email = (String)account.get("email");
        String id = (String) userInfo.get("id"); 
        
        log.info("닉네임 : " + ninkname);
        log.info("이메일 : " + email);
        log.info("아이디 : " + id);
        
        
        
        //카카오 로그인한 이용자 정보를 kakaoResultInfo bean 에 담는다... 카카오는 테스트단계에서 회원의 핸드폰번호를 못받아오는것같음...
        //핸드폰번호는 joinForm3.jsp 에서 받음
        MemberBean kakaoResultInfo = new MemberBean();
        kakaoResultInfo.setMemberName(ninkname);
        kakaoResultInfo.setMemberEmail(email);
        kakaoResultInfo.setMemberJoinApi("KAKAOAPI");
        kakaoResultInfo.setMemberJoinDi(id);
        
        
        //카카오 로그인 이용자정보를 세션에 저장해둠... 이 세션은 약관동의 핸드폰번호 받은후 memberService.insertMember 에서 꺼내서 사용함
        HttpSession session = request.getSession();
        session.setAttribute("kakaoResultInfo", kakaoResultInfo);
        
        //카카오 계정으로 회원가입된 회원인지 조회함
        MemberBean loginUser = memberService.checkAPIJoinInfo(kakaoResultInfo);
	    
        //이메일 중복 체크
	    int check = memberService.selectByEmail(email);
	    
	    	
		if (loginUser != null) {
			// 결과가 있다면 가입한 이용자이므로 세션 설정하고 메인으로 보내기
			log.info("카카오 로그인 성공");
			session.setAttribute("loginUser", loginUser);
			return "redirect:/main";
	
	    //회원가입으로 이동
	    }else{
	    	
	    	log.info("카카오 가입 안함");
	    	//아이디 중복
		    if(check == 1) {
		    	log.info("카카오로 가입하려는데 아이디가 중복임...");
		    	model.addAttribute("message", "duplicateId");
		    	return "redirect:/member/loginForm";
		    	
		    //로그인 성공	
		    } 
	    	
	    	//결과가 없으면 가입시켜야 하므로 회원가입폼으로 보내기
	    	//받은 정보는 저장해서 약관동의만 하도록 하기
	    	model.addAttribute("kakaoResultInfo",kakaoResultInfo);
	    	return "/member/joinForm1";
	    }

    }
	
	@RequestMapping(value ="/member/loginForm", method= {RequestMethod.GET, RequestMethod.POST})
	public String home(Model model, HttpSession session) {
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		model.addAttribute("url", naverAuthUrl);
		
		return "member/loginForm";
	}
	
	
	//네아로(네이버아이디로그인) 콜백함수... 네아로 화면에서 로그인되면 아래 함수로 콜백
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
    public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
            throws IOException {
		
		String apiResult;
		
		OAuth2AccessToken oauthToken;
	    oauthToken = naverLoginBO.getAccessToken(session, code, state);
	    //1. 로그인 사용자 정보를 읽어온다.
	    apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터
	    //2. String형식인 apiResult를 json형태로 바꿈
	    JSONParser parser = new JSONParser();
	    Object obj = null;
	    try {
	        obj = parser.parse(apiResult);
	    } catch (org.json.simple.parser.ParseException e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
	    }
	    JSONObject jsonObj = (JSONObject) obj;
	    //3. 데이터 파싱
	    //Top레벨 단계 _response 파싱
	    JSONObject response_obj = (JSONObject)jsonObj.get("response");
	    //response의 nickname값 파싱
	    String user_code = (String)response_obj.get("id");
	    String user_name = (String)response_obj.get("name");
	    String user_id = (String)response_obj.get("email");
	    String user_phone =(String)response_obj.get("mobile");
	    
	    log.info(apiResult);
	    log.info("고유키" + user_code);
	    log.info("유저명" + user_name);
	    log.info("아이디" + user_id);
	    log.info("핸드폰" + user_phone);
	    
	    //네아로 로그인 정보를 아래 빈에 담음
	    MemberBean naverResultInfo = new MemberBean();
	    naverResultInfo.setMemberJoinDi(user_code);
	    naverResultInfo.setMemberJoinApi("NAVERAPI");
	    naverResultInfo.setMemberEmail(user_id);
	    naverResultInfo.setMemberMobile(user_phone.replace("-",""));
	    naverResultInfo.setMemberName(user_name);
	    
	    //네아로 로그인 정보 세션에 저장해둠
	    session.setAttribute("naverResultInfo", naverResultInfo);
	    
	    
	    //네아로를 통해 회원가입한 회원인지 체크
	    MemberBean loginUser = memberService.checkAPIJoinInfo(naverResultInfo);
	    
	    
	    //아이디 중복체크용
	    int check = memberService.selectByEmail(user_id);
	    
	    	
		if (loginUser != null) {
			// 결과가 있다면 가입한 이용자이므로 세션 설정하고 메인으로 보내기
			log.info("네아로 로그인 성공");
			session.setAttribute("loginUser", loginUser);
			return "redirect:/main";
	
	    //회원가입으로 이동
	    }else{
	    	
	    	log.info("네아로 가입 안함");
	    	//아이디 중복
		    if(check == 1) {
		    	log.info("네아로 가입하려는데 아이디가 중복임...");
		    	model.addAttribute("message", "duplicateId");
		    	return "redirect:/member/loginForm";
		    	
		    //로그인 성공	
		    } 
	    	
	    	//결과가 없으면 가입시켜야 하므로 회원가입폼으로 보내기
	    	//받은 정보는 저장해서 약관동의만 하도록 하기
	    	model.addAttribute("naverResultInfo",naverResultInfo);
	    	return "/member/joinForm1";
	    }
	    
    }
	
	@GetMapping("/member/joinFormForNaver1")
	public String joinFormNaver1() {
		return "/member/joinForm1";
	}

	@GetMapping("/member/joinFormForNaver2")
	public String joinFormNaver2() {
		return "/member/joinForm2";
	}
	
	@PostMapping("/member/joinFormForKakao")
	public String joinFormKakao() {
		return "/member/joinForm3";
	}
	
	
	@GetMapping("/main")
	public String test(HttpServletRequest request) {

		return "main/main";

	}

	//
	// 로그인 폼 로드
	/*
	 * @GetMapping("/member/loginForm") public String loginForm() {
	 * 
	 * return "member/loginForm"; }
	 */
	

	@PostMapping("/member/loginPro")
	public String loginPro(MemberBean bean, HttpServletRequest request,
			RedirectAttributes rttr) {
		HttpSession session = request.getSession();

		MemberBean loginUser = memberService.loginService(bean);

		if (loginUser != null) {
			SellerBean loginSeller = memberService.getSeller(loginUser.getMemberNum());
			session.setAttribute("loginUser", loginUser);
			log.info("일반회원, loginUser 세션 정보 : " + loginUser.toString());

			if (loginSeller != null) {
				session.setAttribute("loginUser", loginUser);
				session.setAttribute("loginSeller", loginSeller); // "seller" -> "loginSeller"
				session.setMaxInactiveInterval(60 * 30);
				log.info("셀러회원, loginUser 세션 정보 : " + loginUser.toString() + ", loginSeller 세션 정보 : " + loginSeller.toString());
				return "redirect:/main";
			}
			session.setMaxInactiveInterval(60 * 30);
			return "redirect:/main";
		} else {

			rttr.addFlashAttribute("result", "loginFail");
			return "redirect:/member/loginForm";
		}
	}

	// ajax 로그인 처리

	@ResponseBody
	@PostMapping("/member/loginProAjax")
	public String loginProAjax(MemberBean bean, HttpServletRequest request) {
		HttpSession session = request.getSession();
		log.info("받아온 bean 출력 : " + bean.toString());
		MemberBean loginUser = memberService.loginService(bean);

		if (loginUser != null) {
			session.setAttribute("loginUser", loginUser);
			session.setMaxInactiveInterval(60 * 30);

			return "loginSuccess";

		} else {

			return "loginFail";
		}

	}

	@GetMapping("/member/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();

		return "redirect:/main";
	}

	// 계정찾기 폼 로드... 인증은 어떻게 할 것인가...

	@GetMapping("/member/findAccountForm")
	public String findAccountForm() {

		return "member/findAccountForm";
	}

	// 계정찾기 처리... 하나의 메소드로 처리할것인가 나눠서 작업할것인가...
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
	public String resetPassPro(MemberBean bean, @RequestParam("memberPassword_check") String memberPassword_check,
			RedirectAttributes rttr) {

		int result = memberService.resetPassword(bean, memberPassword_check);

		if (result == 1) {
			rttr.addFlashAttribute("result", "resetSuccess");
		} else {
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
		return "./member/joinForm1";
	}

	@GetMapping("/member/joinForm2")
	public String joinForm2() {
		return "./member/joinForm2";
	}
	
	

	@PostMapping("/member/joinPro")
	public String joinPro(MemberBean memberBean, HttpServletRequest request) {
		System.out.println(memberBean + "------------controller");
		
		memberService.insertMember(memberBean, request);
		log.info("회원가입 성공");
		return "redirect:/member/joinOk";

	}
	
	@PostMapping("/member/joinProKakao")
	public String joinProKakao(MemberBean memberBean, HttpServletRequest request) {
		System.out.println(memberBean + "------------controller");
		
		HttpSession session = request.getSession();
		MemberBean sessionMmemberBean = (MemberBean) session.getAttribute("kakaoResultInfo");
		sessionMmemberBean.setMemberMobile(memberBean.getMemberMobile());
		
		memberService.insertMember(sessionMmemberBean, request);
		log.info("회원가입 성공");
		return "redirect:/member/joinOk";

	}

	@ResponseBody
	@GetMapping(value = "/member/emailCheck")
	public String idCheck(@RequestParam("email") String email) {

		System.out.println("email = " + email);
		int result = memberService.selectByEmail(email);
		if (result == 0) {
			return "Y";
		} else {
			return "N";
		}

	}

	@GetMapping("/member/joinOk")
	public String joinOk() {
		return "./member/joinOk";
	}

	@ResponseBody
	@GetMapping(value = "/member/pwCheck")
	public String pwCheck(@RequestParam("email") String email, @RequestParam("pw") String pw) {

		System.out.println("------------------ email = " + email);
		System.out.println("------------------ pw = " + pw);
		Pattern passPattern1 = Pattern.compile("^(?=.*[a-zA-Z])(?=.*\\d)(?=.*\\W).{8,16}$");
		Matcher passMatcher1 = passPattern1.matcher(pw);

		if (!passMatcher1.find()) {
			return "1";
		} else if (pw.length() < 9) {
			return "2";
		} else if (pw.length() < 11) {
			return "3";
		} else if (10 < pw.length() & pw.length() < 17) {
			return "4";
		}
		return "0";

	}

}
