package com.mycom.euum.order.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mycom.euum.goods.bean.GoodsBean;
import com.mycom.euum.image.bean.ImageBean;
import com.mycom.euum.image.service.ImageService;
import com.mycom.euum.member.bean.MemberBean;
import com.mycom.euum.order.bean.OrderBean;
import com.mycom.euum.order.bean.OrderOptionBean;
import com.mycom.euum.order.service.OrderService;
import com.mycom.euum.page.OrderCriteria;
import com.mycom.euum.page.OrderPageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class OrderController {

	private OrderService orderService;
	private ImageService imageService;

	
	//goodsDetail.jsp 에서 주문시 처리하는 메소드... 주문폼 띄워주는 메소드
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
	public String orderPro(OrderOptionBean optionList, OrderBean orderBean, HttpSession session, RedirectAttributes rttr) {

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
		rttr.addFlashAttribute("order", order);

		return "redirect:/order/orderSuccess";
	}
	
	//주문완료 화면... 상품명, 옵션명, 금액 추력해줌
	@GetMapping("order/orderSuccess")
	public String orderSuccess() {
		
		
		return "order/orderSuccess";
	}
	
	//회원용 내 주문 보기
	@GetMapping("myPage/orderList")
	public String myOrderList(Model model, HttpSession session, OrderCriteria cri) {
		
		MemberBean member = (MemberBean)session.getAttribute("loginUser");
		cri.setMemberNum(member.getMemberNum());
		
		List<OrderBean> orderList = orderService.selectOrderListByMember(cri);
		for(OrderBean order : orderList) {
			log.info("오더리스트 : " + order);
		}
		
		int totalCount = orderService.selectOrderCountByMember(cri);
		model.addAttribute("orderList", orderList);
		model.addAttribute("pageMaker", new OrderPageDTO(cri, totalCount));
		
		return "order/myOrderList";
	}
	
	
	//회원용 내 주문 보기(myOrderList.jsp) 에서 옵션 추가 처리하는 메소드
	
	
	
	//회원용 추가주문 하기 (myOrderList 에서...)
	@ResponseBody
	@PostMapping(value="order/addOrder", produces=MediaType.APPLICATION_JSON_VALUE)
	public OrderBean addOrder(OrderBean orderBean, HttpSession session) {
		
		MemberBean loginUser = (MemberBean)session.getAttribute("loginUser");
		orderBean.setMemberNum(loginUser.getMemberNum());
		
		log.info("추가주문 빈 확인 : " + orderBean);
		
		OrderBean newOrder = orderService.addOrder(orderBean);
		
		log.info("입력된 주문 : " + newOrder);
		
		return newOrder;
	}
	
	// 셀러용 의뢰받은 주문 리스트
	@GetMapping("seller/orderList")
	public String sellerOrderList(Model model, HttpSession session, OrderCriteria cri) {

		MemberBean loginUser = (MemberBean) session.getAttribute("loginUser");
		cri.setSellerNum(loginUser.getMemberNum());
		List<OrderBean> orderList = orderService.selectOrderListBySeller(cri);

		for (OrderBean order : orderList) {
			log.info("받은 오더리스트 : " + order);
		}
		
		int totalCount = orderService.selectOrderCountBySeller(cri);
		
		model.addAttribute("pageMaker", new OrderPageDTO(cri, totalCount));
		model.addAttribute("orderList", orderList);
		
		return "sellerOrder/sellerOrderList";
	}
	
	
	//회원용 주문 취소하기
	@ResponseBody
	@PostMapping(value="order/cancleOrder", produces=MediaType.APPLICATION_JSON_VALUE)
//	@PostMapping(value="/order/cancleOrder",consumes = "application/json", produces=MediaType.APPLICATION_JSON_VALUE)
	public OrderBean cancleOrder(OrderBean orderBean) {
		
		int check = orderService.cancleOrder(orderBean);
		log.info("update count : " + check);
		
		orderBean = orderService.selectOrder(orderBean.getOrderNum());
		
		
		return orderBean;
	}
	
	//주문상태 변경하기...
	@PostMapping("order/transferOrderStatus")
	public String transferOrderStatus(OrderBean orderBean) {
		
		log.info("주문변경 ajax controller 받은 빈 : "+ orderBean.toString());
		log.info("주문변경 ajax controller 받은 빈 : "+ orderBean.toString());
		log.info("주문변경 ajax controller 받은 빈 : "+ orderBean.toString());
		
		orderService.updateOrderStatus(orderBean);
		
		return "redirect:/seller/orderList";
	}
	
	//ajax 로 주문상태 변경하는 메소드...
	@ResponseBody
	@PostMapping(value = "order/transferOrderStatusAjax", produces=MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<OrderBean> updateOrderStatus(OrderBean orderBean) throws Exception {
//		public String updateOrderStatus(OrderBean orderBean) throws Exception {

		log.info("파일다운 orderBean 내용 : " + orderBean.toString());

		return orderService.updateOrderStatus(orderBean) == 1 
				? new ResponseEntity<OrderBean>(orderBean, HttpStatus.OK)
				: new ResponseEntity<OrderBean>(HttpStatus.INTERNAL_SERVER_ERROR);

	}
	
	//ajax 로 파일 업로드... 판매자가 작업 완료되었을때 파일업로드 처리함
	@ResponseBody
	@PostMapping(value="order/fileUpload")
	public String fileUpload(OrderBean orderBean) throws Exception {
		
		orderService.uploadFile(orderBean.getUploadFile(), orderBean.getOrderKeyNum());
		orderService.updateOrderStatus(orderBean);
		
		return "upload success";
	}
	
	
	//최창선 : 주문에서 파일목록 불러오는 메소드
	@ResponseBody
	@PostMapping(value="order/getFile", produces=MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<ImageBean> getFile(ImageBean imageBean){
		
		log.info("이미지 가져오기 빈 확인 : " + imageBean);
		List<ImageBean> fileList = imageService.getImageList(imageBean);
		
		for(ImageBean file : fileList) {
			String fileName = file.getImageFileName();
			String OrifileName =  fileName.substring(fileName.indexOf("_") + 1);
			log.info("실제 파일이름 : " + OrifileName);
			file.setOriginalFileName(OrifileName);
			log.info("이미지 빈 내용 : " + file.toString());
		}
		
		
		return new ResponseEntity<>(fileList.get(0), HttpStatus.OK);
		
		
	}

	
}
