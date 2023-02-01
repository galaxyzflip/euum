package com.mycom.euum.order.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycom.euum.goods.bean.GoodsBean;
import com.mycom.euum.goods.service.GoodsService;
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
	private GoodsService goodsService;

	
	//goodsDetail.jsp 에서 주문시 처리하는 메소드...
	@PostMapping("/order/orderForm")
	public String orderStart(OrderOptionBean optionList, Model model) {

		List<OrderOptionBean> list = optionList.getOptionList();

		// 로그찍기용
		
		for (OrderOptionBean bean : list) {
			log.info("옵션리스트 정보 : " + bean.toString());
		}
		 

		GoodsBean goodsInfo = orderService.getGoodsInfo(list.get(0).getGoodsNum());
		log.info("상품정보 : " + goodsInfo.toString());

		model.addAttribute("orderList", list);
		model.addAttribute("goodsInfo", goodsInfo);

		return "order/orderForm";
	}

	
	//orderForm.jsp 에서 주문처리시 사용하는 메소드
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
	
	//회원용 내 주문 보기
	@GetMapping("order/myOrderList")
	public String myOrderList(Model model, HttpSession session) {
		
		MemberBean member = (MemberBean)session.getAttribute("loginUser");
		
		List<OrderBean> orderList = orderService.selectOrderListByMember(member.getMemberNum());
		
		for(OrderBean order : orderList) {
			log.info("오더리스트 하나 : " + order);
		}
		
		model.addAttribute("orderList", orderList);
		return "order/myOrderList";
	}
	
//	@GetMapping("order/addOrderOption")
//	public String addOrderOption(@RequestParam("goodsNum") String goodsNum, Model model) throws Exception {
//		
//		int optionCount = goodsService.selectGoodsOptionCount(goodsNum);
//		List<List<GoodsOptionBean>> optionList = new ArrayList<List<GoodsOptionBean>>();
//		for (int i = 1; i <= optionCount; i++) {
//			List<GoodsOptionBean> list = goodsService.selectGoodsOptionContent(goodsNum, Integer.toString(i));
//
//			log.info("---------------------------------");
//			log.info(i + "번째 옵션의 선택항목: " + list);
//			optionList.add(list);
//		}
//		model.addAttribute("optionList", optionList);
//		
//		return "order/addOrderOption";
//	}
	
	//admin용 주문리스트 불러오는 메소드
	@GetMapping("admin/order/orderList")
	public String adminOrderList(Model model) {
		
		List<OrderBean> orderList = orderService.selectAdminOrderList();
		model.addAttribute("orderList", orderList);
		return "admin/order/orderList";
	}
	
	
	//회원용 내 주문 보기(myOrderList.jsp) 에서 옵션 추가 처리하는 메소드
	@ResponseBody
	@PostMapping(value="order/addOrder", consumes = "application/json", produces=MediaType.APPLICATION_JSON_VALUE)
	public OrderBean addOrder(@RequestBody OrderBean orderBean, HttpSession session) {
		
		MemberBean memberBean = (MemberBean)session.getAttribute("loginUser");
		orderBean.setMemberNum(memberBean.getMemberNum());
		
		log.info("추가주문 빈 확인 : " + orderBean);
		
		
		OrderBean newOrder = orderService.addOrder(orderBean);
		
		log.info("입력된 주문 : " + newOrder);
		
		
		return newOrder;
	}
	
	
	
	

}
