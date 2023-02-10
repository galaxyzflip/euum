package com.mycom.euum.admin.order.mapper;

import java.util.List;

import com.mycom.euum.order.bean.OrderBean;

public interface AdminOrderMapper {

	public List<OrderBean> selectAdminOrderList();
}
