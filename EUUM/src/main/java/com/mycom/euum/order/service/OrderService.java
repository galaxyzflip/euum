package com.mycom.euum.order.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.mycom.euum.goods.bean.GoodsBean;
import com.mycom.euum.order.bean.OrderBean;
import com.mycom.euum.order.bean.OrderOptionBean;

public interface OrderService {

	public GoodsBean getGoodsInfo(int goodsNum);
	
	public String orderPro(OrderOptionBean optionList, OrderBean orderBean);
	
	public OrderBean selectOrder(String orderNum);
	
	public List<OrderBean> selectOrderListByMember(int memberNum);
	
	public List<OrderBean> selectOrderListBySeller(int sellerNum);
	
	public OrderBean addOrder(OrderBean orderBean);
	
	public int cancleOrder(OrderBean orderBean);
	
	public int updateOrderStatus(OrderBean orderBean);
	
	public void uploadFile(MultipartFile[] multipart, int orderKeyNum)  throws Exception;
	
	public String selectSellerOrder1(int sellerNum);
	
	public String selectSellerOrder2(int sellerNum);
	
	public String selectSellerOrder3(int sellerNum);
	
	public String selectSellerOrder4(int sellerNum);
	
	public String selectSellerOrder11(int sellerNum);
	
	public String selectSellerOrder22(int sellerNum);
	
	public String selectSellerOrder33(int sellerNum);
	
	public String selectSellerOrder44(int sellerNum);
	
}
