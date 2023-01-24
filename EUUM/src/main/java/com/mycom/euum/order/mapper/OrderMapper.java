package com.mycom.euum.order.mapper;

import com.mycom.euum.goods.bean.GoodsBean;

public interface OrderMapper {

	public GoodsBean getGoodsInfo(int goodsNum);
}
