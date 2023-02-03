package com.mycom.euum.page;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class RPageDTO {
	
	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total;
	private RCriteria rcri;
	
	public RPageDTO(RCriteria rcri, int total) {
		
		this.rcri=rcri;
		this.total=total;
		
		this.endPage = (int)(Math.ceil(rcri.getPageNum()/10.0))*10;
		
		this.startPage = this.endPage - 9;
		
		int realEnd = (int)(Math.ceil((total*1.0)/rcri.getAmount()));
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage >1;
		
		this.next = this.endPage <realEnd;
	}

}
