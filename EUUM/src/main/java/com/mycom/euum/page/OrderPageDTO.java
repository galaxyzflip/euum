package com.mycom.euum.page;

import lombok.Data;

@Data
public class OrderPageDTO {

	private int startPage;
	private int endPage;
	private boolean prev, next;

	private int total;
	private OrderCriteria cri;

	public OrderPageDTO(OrderCriteria cri, int total) {

		final int amount = (cri.getAmount() != 0) ? cri.getAmount() : 10; 
		
		this.cri = cri;
		this.total = total;

		this.endPage = (int) (Math.ceil(cri.getPageNum() / (double) amount)) * amount;

		this.startPage = this.endPage - (amount-1);

		int realEnd = (int) (Math.ceil((total * 1.0) / amount));

		if (realEnd < this.endPage) {
			this.endPage = realEnd;
		}

		this.prev = this.startPage > 1;

		this.next = this.endPage < realEnd;
	}
}
