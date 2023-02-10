package com.mycom.euum.order.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.mycom.euum.goods.bean.GoodsBean;
import com.mycom.euum.member.bean.MemberBean;
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

		// 로그찍기용
		/*
		 * for (OrderOptionBean bean : list) { log.info("옵션리스트 정보 : " +
		 * bean.toString()); }
		 */

		GoodsBean goodsInfo = orderService.getGoodsInfo(Integer.parseInt(list.get(0).getGoodsNum()));
		log.info("상품정보 : " + goodsInfo.toString());

		model.addAttribute("orderList", list);
		model.addAttribute("goodsInfo", goodsInfo);

		return "order/orderForm";
	}

	@PostMapping("/order/orderPro")
	public String orderPro(OrderOptionBean optionList, OrderBean orderBean, HttpSession session, Model model) {

		// memberNum을 세션에서 가져와서 주문처리시 사용
		MemberBean member = (MemberBean) session.getAttribute("loginUser");
		orderBean.setMemberNum(member.getMemberNum());

		log.info("orderBean 내용 :" + orderBean.toString());

		// optionList는 OrderOptionBean 에 선언된 List<OrderOptionBean> optionList에 담아서 가져옴
		// 로그 찍어보고 싶으면 아래 주석을 푸시오
		List<OrderOptionBean> list = optionList.getOptionList();
	
		for (OrderOptionBean bean : list) {
			log.info("테스트 : " + bean.toString());
		}

		// insert된 order option 개수 출력해보기...
		String orderNum = orderService.orderPro(optionList, orderBean);

		//주문결과 보여주기 위한 작업
		OrderBean order = orderService.selectOrder(orderNum);
		model.addAttribute("order", order);

		return "order/orderSuccess";
	}

	/*
	 * @GetMapping("order/orderTest") public String orderTest(Model model) {
	 * OrderBean order = orderService.selectOrder("20230126-0047");
	 * model.addAttribute("order", order);
	 * 
	 * return "order/orderSuccess"; }
	 */
	
	/*
	 * @GetMapping("order/orderListTest") public String orderListTest() {
	 * 
	 * List<OrderBean> orderList = orderService.selectOrderListByMember(1);
	 * 
	 * for(OrderBean order : orderList) { log.info("불러온 오더 정보 : " +
	 * order.toString()); }
	 * 
	 * return null; }
	 */
	
	@GetMapping("order/myOrderList")
	public String myOrderList(Model model, HttpSession session) {
		
		MemberBean member = (MemberBean)session.getAttribute("loginUser");
		
		List<OrderBean> orderList = orderService.selectOrderListByMember(member.getMemberNum());
		
		model.addAttribute("orderList", orderList);
		return "order/myOrderList";
	}

}
