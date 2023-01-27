package com.mycom.euum.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycom.euum.review.bean.ReviewBean;
import com.mycom.euum.review.mapper.ReviewMapper;

import lombok.Setter;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Setter(onMethod_ = @Autowired)
	private ReviewMapper reviewMapper;
	
	private ReviewBean reviewBean;

	@Override
	public List<ReviewBean> reviewList(ReviewBean reviewBean) {
		// TODO Auto-generated method stub
		return reviewMapper.reviewList(reviewBean.getGoodsNum());
	}
	
	

}
