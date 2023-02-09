package com.mycom.euum.page;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RqCriteria {

	private int rqpageNum;
	private int rqamount;
	
	private String rqtype;
	private String rqkeyword;
	
	public RqCriteria() {
		this(1,15);
	}
	
	public RqCriteria(int rqpageNum, int rqamount) {
		this.rqpageNum=rqpageNum;
		this.rqamount=rqamount;
	}
	
	public String[] getTypeArr() {
		return rqtype ==null? new String[] {} : rqtype.split("");
	}
}
