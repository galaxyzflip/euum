package com.mycom.euum.order.bean;

import java.util.List;

import lombok.Data;

@Data
public class OrderOptionBean {

	private String goodsOptName;
	private String goodsOptPrice;
	
	private List<OrderOptionBean> optionList;
}
