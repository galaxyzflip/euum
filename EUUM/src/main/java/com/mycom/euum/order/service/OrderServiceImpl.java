package com.mycom.euum.order.service;

import org.springframework.stereotype.Service;

import com.mycom.euum.goods.bean.GoodsBean;
import com.mycom.euum.order.mapper.OrderMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@AllArgsConstructor
@Log4j
public class OrderServiceImpl implements OrderService{

	private OrderMapper orderMapper;
	
	@Override
	public GoodsBean getGoodsInfo(int goodsNum) {
		
		log.info("서비스 getsellerInfo");
		log.info("서비스 getsellerInfo");
		log.info("서비스 getsellerInfo");
		log.info("서비스 getsellerInfo");
		log.info("서비스 getsellerInfo");
		
		return orderMapper.getGoodsInfo(goodsNum);
	}

}
