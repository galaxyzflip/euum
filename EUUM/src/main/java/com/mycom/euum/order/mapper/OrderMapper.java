package com.mycom.euum.order.mapper;

import java.util.List;

import com.mycom.euum.goods.bean.GoodsBean;
import com.mycom.euum.order.bean.OrderBean;
import com.mycom.euum.order.bean.OrderOptionBean;
import com.mycom.euum.page.OrderCriteria;

public interface OrderMapper {

	public GoodsBean getGoodsInfo(int goodsNum);
	
	
	/** 작성자 : 최창선, orderKeyNum 시퀀스 1개 받아오기*/
	public int getOrderKeyNum();
	
	public int insertOrder(OrderBean orderBean);
	
	public int insertOrderOpt(OrderOptionBean optionBean);
	
	public OrderBean selectOrder(String orderNum);
	
	
	/** 작성자 : 최창선, 용도 : 회원번호 조건으로 주문리스트 불러오기*/
	public List<OrderBean> selectOrderListByMember(int memberNum);
	
	public List<OrderBean> selectOrderListBySeller(int sellerNum);
	
	public List<OrderBean> selectAdminOrderList(OrderCriteria cri);
	
	public int selectAdminOrderCount(OrderCriteria cri);
	
	public int updateOrderStatus(OrderBean orderBean);
	
	public int updateOrderCancel(OrderBean orderBean);
	
	
	/** 주문 상태에 따른 건 수와 가격 */
	public String selectSellerOrder1(int sellerNum);
	
	public String selectSellerOrder2(int sellerNum);
	
	public String selectSellerOrder3(int sellerNum);
	
	public String selectSellerOrder4(int sellerNum);
	
	public String selectSellerOrder11(int sellerNum);
	
	public String selectSellerOrder22(int sellerNum);
	
	public String selectSellerOrder33(int sellerNum);
	
	public String selectSellerOrder44(int sellerNum);
	
}
