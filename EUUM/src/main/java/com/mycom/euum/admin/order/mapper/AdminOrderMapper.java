package com.mycom.euum.admin.order.mapper;

import java.util.List;

import com.mycom.euum.order.bean.OrderBean;
import com.mycom.euum.page.OrderCriteria;

public interface AdminOrderMapper {

	public List<OrderBean> selectAdminOrderList(OrderCriteria cri);
	
	public int selectAdminOrderCount(OrderCriteria cri);
}
