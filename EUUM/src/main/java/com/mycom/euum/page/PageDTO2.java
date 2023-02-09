package com.mycom.euum.page;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class PageDTO2 {
	
	private int startPage;  //시작페이지 
	private int endPage;    //끝페이지 
	private boolean prev, next;  //이전, 다음 
	
	private int total;  //총 데이터 개수  
	private Criteria2 cri;  //Criteria 선언 
	private String sortCom;  //정렬 

	
	public PageDTO2(Criteria2 cri, int total) {  //pageMaker  
		
		this.cri=cri;
		this.total=total;  //전체페이지  
		
		this.endPage = (int)(Math.ceil(cri.getPageNum()/10.0))*10;  //페이지 끝 번호  
		
		this.startPage = this.endPage - 9;  //페이지 시작 번호  
		
		int realEnd = (int)(Math.ceil((total*1.0)/cri.getAmount())); //진짜 끝 페이지 
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;  //끝페이지가 진짜끝페이지보다 크다면, 끝페이지는 진짜끝페이지가 되야함  
		}
		
		this.prev = this.startPage >1;       //이전 
		this.next = this.endPage <realEnd;   //다음 
	}
}
