package com.mycom.euum.member.bean;

import java.sql.Date;

import lombok.Data;

@Data
public class CartBean {
	private int cartNum;
	private int goodsNum;
	private int memberNum;
	private Date cartRegdate;
	private Date cartDeleteDate;
	
}
