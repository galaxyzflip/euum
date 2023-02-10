package com.mycom.euum.page;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class RqPageDTO {
	
	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total;
	private RqCriteria rqcri;
	
	public RqPageDTO(RqCriteria rqcri, int total) {
		
		this.rqcri=rqcri;
		this.total=total;
		
		this.endPage = (int)(Math.ceil(rqcri.getRqpageNum()/10.0))*10;
		
		this.startPage = this.endPage - 9;
		
		int realEnd = (int)(Math.ceil((total*1.0)/rqcri.getRqamount()));
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage >1;
		
		this.next = this.endPage <realEnd;
	}

}
