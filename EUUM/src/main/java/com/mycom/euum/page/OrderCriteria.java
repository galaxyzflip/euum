package com.mycom.euum.page;

import java.util.List;

import lombok.Data;

@Data
public class OrderCriteria extends Criteria{

	private List<String> orderStatus;
	private String sortType;
	private String sortValue;
	private int sellerNum;
	private int goodsNum;
	
	
	public OrderCriteria() {
		super();
	}
	
	public OrderCriteria(int pageNum, int amount) {
		super(pageNum, amount);
	}
	
	public List<String> getOrderStatus() {
		return orderStatus;
	}

}
