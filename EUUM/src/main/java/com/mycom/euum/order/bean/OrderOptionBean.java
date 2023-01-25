package com.mycom.euum.order.bean;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class OrderOptionBean {
	
	private String orderOptNum;
	private String orderNum;
	private String goodsNum;
	//private String goodsOptContentNum;
	private String orderOptPrice;
	private String orderOptCount;
	private Date orderOptDate;
	private Date orderOptCancleDate;
	private String orderOptStatus;
	//private String orderOptRequest;
	private String orderOptPayType;
	private String orderOptName;
	
	private List<OrderOptionBean> optionList;
}
