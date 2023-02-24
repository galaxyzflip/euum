package com.mycom.euum.member.controller;

import java.util.Random;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mycom.euum.member.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

@RestController
@Log4j
@AllArgsConstructor
public class JoinAuthController {

	final DefaultMessageService messageService;
	
	public JoinAuthController() {
        // 반드시 계정 내 등록된 유효한 API 키, API Secret Key를 입력해주셔야 합니다!
        this.messageService = NurigoApp.INSTANCE.initialize("NCSUVN6GBPRZ0MUA", "LJTMUTVB2WTWEX686NS7RJH6JSFMVRE4", "https://api.coolsms.co.kr");
    }
	
	

	 @GetMapping("/member/joinAuthAjax")
	 public String sendOne(@RequestParam(value="mobno") String mobno) {
		 Random rand = new Random(); 
		 String numStr = "";
		 
		 for(int i=0; i<4; i++) {
				String ran = Integer.toString(rand.nextInt(10)); 
				numStr += ran;
			}
		 
		 System.out.println(numStr);
		 Message message = new Message();
	        // 발신번호 및 수신번호는 반드시 01012345678 형태로 입력되어야 합니다.

	        message.setFrom("01062826010");

	        message.setTo(mobno);
	        message.setText("[EUUM] 이음 회원 인증번호는 " + numStr + "입니다.");

	        SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
	        System.out.println(response);

	        return numStr;
	    }

	 
	 
}
