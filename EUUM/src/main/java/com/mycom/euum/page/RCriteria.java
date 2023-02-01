package com.mycom.euum.page;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RCriteria {
	
	private int pageNum;
	private int amount;
	
	private int goodsNum;
	
	private String type;
	private String keyword;
	
	public RCriteria() {
		this(1,10);
	}
	
	public RCriteria(int pageNum, int amount) {
		this.pageNum=pageNum;
		this.amount=amount;
	}
	
	public String[] getTypeArr() {
		return type ==null? new String[] {} : type.split("");
	}

}
