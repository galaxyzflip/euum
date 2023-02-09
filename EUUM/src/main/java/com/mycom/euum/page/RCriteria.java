package com.mycom.euum.page;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RCriteria {
	
	private int rpageNum;
	private int ramount;
	
	private int goodsNum;
	
	private String type;
	private String keyword;
	
	public RCriteria() {
		this(1,5);
	}
	
	public RCriteria(int rpageNum, int ramount) {
		this.rpageNum=rpageNum;
		this.ramount=ramount;
	}
	
	public String[] getTypeArr() {
		return type ==null? new String[] {} : type.split("");
	}

}
