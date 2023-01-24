package com.mycom.euum.order.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import com.mycom.euum.goods.bean.GoodsBean;
import com.mycom.euum.order.bean.OrderBean;
import com.mycom.euum.order.bean.OrderOptionBean;
import com.mycom.euum.order.service.OrderService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class OrderController {

	private OrderService orderService;

	@PostMapping("/order/orderForm")
	public String orderStart(OrderOptionBean optionList, Model model) {

		List<OrderOptionBean> list = optionList.getOptionList();
		int totalPrice = 0;
				
		for (int i = 0; i < list.size(); i++) {
			log.info("테스트 : " + list.get(i).toString());
			totalPrice += Integer.parseInt(list.get(i).getGoodsOptPrice());

		}
		GoodsBean goodsInfo = orderService.getGoodsInfo(Integer.parseInt(list.get(0).getGoodsNum()));
		log.info("셀러정보 레알 브런치: " + goodsInfo.toString());
		log.info("셀러정보 : " + goodsInfo.toString());
		log.info("셀러정보 : " + goodsInfo.toString());
		log.info("셀러정보 : " + goodsInfo.toString());
		log.info("셀러정보 : " + goodsInfo.toString());
		
		 
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("orderList", list);
		model.addAttribute("goodsInfo", goodsInfo);

		return "order/orderForm";
	}

	@PostMapping("/order/orderPro")
	public String orderPro(OrderOptionBean optionList, OrderBean orderBean) {

		log.info("orderBean 내용 :" + orderBean.toString());
		
		List<OrderOptionBean> list = optionList.getOptionList();

		for (int i = 0; i < list.size(); i++) {
			log.info("테스트 : " + list.get(i).toString());

		}

		return "null";
	}

}
