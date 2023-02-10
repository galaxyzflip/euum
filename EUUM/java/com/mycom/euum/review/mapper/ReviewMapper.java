package com.mycom.euum.review.mapper;

import java.util.List;

import com.mycom.euum.review.bean.ReviewBean;

public interface ReviewMapper {
	
	public List<ReviewBean> reviewList(int goodsNum);

}
