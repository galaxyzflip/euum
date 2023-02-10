package com.mycom.euum.admin.order.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.mycom.euum.admin.order.service.AdminOrderService;
import com.mycom.euum.order.bean.OrderBean;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class AdminOrderConroller {
	
	private AdminOrderService adminOrderService;

	@GetMapping("admin/order/orderList")
	public void adminOrderList(Model model) {
		
		List<OrderBean> orderList = adminOrderService.adminOrderList();
		
		for(OrderBean order : orderList) {
			log.info("관리자 오더 리스트 : " + order.toString());
		}
		
		model.addAttribute("orderList", orderList);
	}
}
