package com.mycom.euum.cart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.mycom.euum.member.service.MemberService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class CartController {

	@GetMapping("/myPage/favorite")
	public String test() {
		return "myPage/favorite";
	}
	
	
}
