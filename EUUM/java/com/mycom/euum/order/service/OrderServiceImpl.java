package com.mycom.euum.order.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.mycom.euum.goods.bean.GoodsBean;
import com.mycom.euum.order.bean.OrderBean;
import com.mycom.euum.order.bean.OrderOptionBean;
import com.mycom.euum.order.mapper.OrderMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class OrderServiceImpl implements OrderService{

	private OrderMapper orderMapper;
	
	/**20230120-0003 식으로 주무넌호 생성해주는 함수*/
	public String getOrderNum(int orderKeyNum) {
		
		String code = String.format("%04d", orderKeyNum);
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		
		String orderNum = sdf.format(date) +"-"+ code;
		
		return orderNum;
	}
	
	@Override
	public GoodsBean getGoodsInfo(int goodsNum) {
		
		log.info("서비스 getsellerInfo");
		log.info("서비스 getsellerInfo");
		log.info("서비스 getsellerInfo");
		log.info("서비스 getsellerInfo");
		log.info("서비스 getsellerInfo");
		
		return orderMapper.getGoodsInfo(goodsNum);
	}

	@Override
	public String orderPro(OrderOptionBean optionBean, OrderBean orderBean) {
	
		int optionInsertCount = 0;
		String orderName="";
		//order_tbl 시퀀스값 하나 받아오기
		int orderKeyNum = orderMapper.getOrderKeyNum();
		//위에서 받은 시퀀스값 조합하여 주문번호 생성 ex) 202301250001
		String orderNum = getOrderNum(orderKeyNum);
		
		orderBean.setOrderKeyNum(orderKeyNum);
		orderBean.setOrderNum(orderNum);

		List<OrderOptionBean> optionList = optionBean.getOptionList();
		
		for (int i=0 ; i<optionList.size() ; i++) {
			
			//옵션주문번호... 주문번호 뒤에 -1, -2 식의 일련번호 추가...
			optionList.get(i).setOrderOptNum(orderNum +"-"+ (i+1));
			optionList.get(i).setOrderNum(orderNum);
			optionList.get(i).setOrderOptPayType(orderBean.getOrderPayType());
			
			log.info("옵션"+i + "파라미터 : "+optionList.get(i).toString());
			
			//옵션주문 처리
			optionInsertCount += orderMapper.insertOrderOpt(optionList.get(i));
			
			if(i+1 < optionList.size()) {
				orderName = orderName+optionList.get(i).getOrderOptName()+" / "+optionList.get(i).getOrderOptCount()+" 개`";
			}else {
				orderName = orderName+optionList.get(i).getOrderOptName()+" / "+optionList.get(i).getOrderOptCount()+" 개";
			}
			
		}
		log.info("입력된 옵션주문 개수 : " + optionInsertCount);
		
		
		// 대표주문 처리
		orderBean.setOrderName(orderName);
		int orderInsertCount = orderMapper.insertOrder(orderBean);
		log.info("주문 insert count : " + orderInsertCount);

		return orderNum;
	}
	
	public OrderBean selectOrder(String orderNum) {
		
		OrderBean order = orderMapper.selectOrder(orderNum);
		log.info("가져온 주문 : " + order.toString());
		
		return order;
	}

	@Override
	public List<OrderBean> selectOrderListByMember(int memberNum) {
		
		return orderMapper.selectOrderListByMember(memberNum);
	}

}