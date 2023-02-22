package com.mycom.euum.admin.order.service;

import java.util.List;

import com.mycom.euum.order.bean.OrderBean;
import com.mycom.euum.page.OrderCriteria;

public interface AdminOrderService {

	public List<OrderBean> adminOrderList(OrderCriteria cri);
	
	public int selectAdminOrderCount(OrderCriteria cri);
}
