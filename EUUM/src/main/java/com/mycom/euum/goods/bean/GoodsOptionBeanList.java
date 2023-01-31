package com.mycom.euum.goods.bean;

import java.util.List;

import lombok.Data;

@Data
public class GoodsOptionBeanList {

	private List<GoodsOptionBean> goodsOptions;

	@Override
	public String toString() {
		return "GoodsOptionBeanList [goodsOptions=" + goodsOptions + "]";
	}

}