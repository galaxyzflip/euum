package com.mycom.euum.admin.order.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.mycom.euum.admin.order.service.AdminOrderService;
import com.mycom.euum.order.bean.OrderBean;
import com.mycom.euum.page.OrderCriteria;
import com.mycom.euum.page.OrderPageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class AdminOrderConroller {
	
	private AdminOrderService adminOrderService;

	
	//최창선 : admin용 주문목록 
	@GetMapping("admin/orderList")
	public String adminOrderList(OrderCriteria cri, Model model) {
		
		int totalCount = adminOrderService.selectAdminOrderCount(cri);
		List<OrderBean> orderList = adminOrderService.adminOrderList(cri);
		
		log.info("뭐가 들었길래" + cri.toString());
		log.info("뭐가 들었길래" + cri.toString());
		log.info("뭐가 들었길래" + cri.toString());
		log.info("뭐가 들었길래" + cri.toString());
		 
		
		for(OrderBean order : orderList) {
			log.info("관리자 오더 리스트 : " + order.toString());
		}
		OrderPageDTO pageMaker = new OrderPageDTO(cri, totalCount);
		
		log.info("페이지메이커 : " + pageMaker);
		log.info("페이지메이커 : " + pageMaker);
		log.info("페이지메이커 : " + pageMaker);
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("pageMaker", pageMaker);
		
		return "admin/order/orderList";
	}
}
