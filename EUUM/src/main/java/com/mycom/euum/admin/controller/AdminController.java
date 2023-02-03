package com.mycom.euum.admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class AdminController {
	
	@GetMapping("/admin")
	public String adminMain(HttpServletRequest request) {
		return"admin/main/main";
	}
	
}
