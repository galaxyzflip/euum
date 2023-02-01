package com.mycom.euum.review.service;

import java.util.List;

import com.mycom.euum.page.RCriteria;
import com.mycom.euum.review.bean.ReviewBean;

public interface ReviewService {
	
	public List<ReviewBean> reviewList(RCriteria rcri);
	
//	public List<ReviewBean> reviewList(String goodsNum, int pageNum, int amount);
	
	public void reviewInsert(ReviewBean reviewBean); 
	
	public ReviewBean reviewDetail(int reviewNum);
	
	public int reviewModify(int reviewNum);
	
	public int reviewDelete(int reviewNum);
	
	
	public int getTotal(RCriteria rcri);
}
