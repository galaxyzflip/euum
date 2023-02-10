package com.mycom.euum.admin.order.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mycom.euum.order.bean.OrderBean;
import com.mycom.euum.order.mapper.OrderMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Service
@Log4j
@AllArgsConstructor
public class AdminOrderServiceImpl implements AdminOrderService {
	
	
	private OrderMapper orderMapper;

	@Override
	public List<OrderBean> adminOrderList() {
		
		return orderMapper.selectAdminOrderList();
	}
	

}
