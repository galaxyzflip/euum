package com.mycom.euum.order.bean;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class OrderOptionBean {
	private String goodsOptName;
	private String goodsOptPrice;
	private String goodsOptCount;
	
	private String goodsOptNum;
	private String orderNum;
	private String goodsNum;
	private String goodsOptionContentNum;
	private Date orderOptDate;
	private Date orderOptCancleDate;
	private String orderOptStatus;
	private String orderOptRequest;
	private String orderOptPayType;
	
	private List<OrderOptionBean> optionList;
}
