package com.mycom.euum.page;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CCriteria {
	
	private int cpageNum;
	private int camount;
	
	
	private String ctype;
	private String ckeyword;
	
	public CCriteria() {
		this(1,10);
	}
	
	public CCriteria(int cpageNum, int camount) {
		this.cpageNum=cpageNum;
		this.camount=camount;
	}
	
	public String[] getTypeArr() {
		return ctype ==null? new String[] {} : ctype.split("");
	}

}
