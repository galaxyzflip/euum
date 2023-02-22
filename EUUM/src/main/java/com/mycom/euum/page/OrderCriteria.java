/* 작성자 : 최창선
 * 용도 : 주문리스트에서 정렬 검색에 필요한 변수들 관리
 * Criteria 상속받아서 orderCriteria에 필요한 변수들 추가*/
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
