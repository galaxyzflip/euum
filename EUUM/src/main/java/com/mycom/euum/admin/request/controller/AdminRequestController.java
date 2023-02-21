package com.mycom.euum.admin.request.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycom.euum.admin.order.controller.AdminOrderConroller;
import com.mycom.euum.admin.order.service.AdminOrderService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class AdminRequestController {
	
	@RequestMapping("admin/requestList")
	public String openRequest(){
		
		return "admin/request/requestList";
	}

}
