package com.mycom.euum.page;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CriteriaForGoods {

	private int pageNum1;
	private int amount1;
	private int pageNum2;
	private int amount2;
	private int pageNum3;
	private int amount3;

	private int memberNum;

//	private String type;
//	private String keyword;

	public CriteriaForGoods() {
		this(1, 3, 1, 3, 1, 3);
	}

	public CriteriaForGoods(int pageNum1, int amount1, int pageNum2, int amount2, int pageNum3, int amount3) {
		this.pageNum1 = pageNum1;
		this.amount1 = amount1;
		this.pageNum2 = pageNum2;
		this.amount2 = amount2;
		this.pageNum3 = pageNum3;
		this.amount3 = amount3;
	}

//	public String[] getTypeArr() {
//		return type == null ? new String[] {} : type.split("");
//	}

}
