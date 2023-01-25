package com.mycom.euum.order.service;

import com.mycom.euum.goods.bean.GoodsBean;
import com.mycom.euum.order.bean.OrderBean;
import com.mycom.euum.order.bean.OrderOptionBean;

public interface OrderService {

	public GoodsBean getGoodsInfo(int goodsNum);
	
	public String orderPro(OrderOptionBean optionList, OrderBean orderBean);
	
	public OrderBean selectOrder(String orderNum);
}
