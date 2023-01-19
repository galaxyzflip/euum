package com.mycom.euum.order.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.mycom.euum.order.bean.OrderOptionBean;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class OrderController {

	@PostMapping("/order/order")
	public void test111(OrderOptionBean optionList) {
		
		List<OrderOptionBean> list = optionList.getOptionList();
		
		for(int i=0;i<list.size();i++) {
			log.info("테스트 : " + list.get(i));
			
		}
	}
	
	
}
