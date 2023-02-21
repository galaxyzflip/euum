package com.mycom.euum.admin.request.controller;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycom.euum.admin.request.service.AdminRequestService;
import com.mycom.euum.request.bean.RequestBean;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class AdminRequestController {
	
	private AdminRequestService adminRequestService;
	
	@RequestMapping("admin/requestList")
	public String openRequest(Model model){
		
		model.addAttribute("list", adminRequestService.getAdminRList());
		
		log.info("가져옴?????????????" + adminRequestService.getAdminRList());
		
		return "admin/request/requestList";
	}
	
	@PostMapping("/updateRstatus")
	public String updateStatus(RequestBean requestBean) {
		
		System.out.println("됨?");
		 adminRequestService.updateRstatus(requestBean);
		System.out.println("되냐"); 
		 return "redirect:admin/requestList"; 
		
	}
	
	@PostMapping("/deleteRequestAdmin")
	public String deleteRequestAdmin(RequestBean requestBean) {
		
		adminRequestService.deleteAdminRequest(requestBean);
		
		return "redirect:admin/requestList";
	}
	
	@PostMapping("/cancelRequestDelete")
	public String cancelRdelete(RequestBean requestBean) {
		
		adminRequestService.cancelRdelete(requestBean);
		
		return "redirect:admin/requestList"; 
	}

}
