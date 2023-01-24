package com.mycom.euum.order.bean;

import java.sql.Date;

import lombok.Data;

@Data
public class OrderBean {

	private int orderKeyNum;
	private String orderNum;
	private int goodsNum;
	private int memberNum;
	private int sellerNum;
	private String orderStatus;
	private String orderContact;
	private String orderEmail;
	private Date orderDate;
	private Date orderCancleDate;
	private String orderRequest;
	private String orderPayType;
	private String orderName;
	private String orderFormat;
	private String orderResolution;
	private String orderSize;
	private String orderModifyCount;
	private String orderPeriod;
	private String orderImage;
	
	
	
	
	
}
