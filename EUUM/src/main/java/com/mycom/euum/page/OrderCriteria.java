package com.mycom.euum.page;

import java.util.Collections;
import java.util.List;

import lombok.Data;

@Data
public class OrderCriteria extends Criteria{

	private List<String> orderStatus;
	
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
