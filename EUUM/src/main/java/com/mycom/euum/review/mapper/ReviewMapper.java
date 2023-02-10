package com.mycom.euum.review.mapper;

import java.util.List;

import com.mycom.euum.page.Criteria;
import com.mycom.euum.page.RCriteria;
import com.mycom.euum.review.bean.ReviewBean;

public interface ReviewMapper {
	
	public List<ReviewBean> reviewList(RCriteria rcri);
	
//	public List<ReviewBean> reviewList(@Param("goodsNum") String goodsNum, @Param("pageNum") int pageNum, @Param("amount") int amount);
	
	public void reviewInsert(ReviewBean reviewBean);
	

	
	public ReviewBean reviewModifyForm(int reviewNum);
	
	public int reviewModifyPro(ReviewBean reviewBean);
	
	public int reviewDelete(ReviewBean reviewBean);
	
	public ReviewBean reviewDetail(int reviewNum);
	
	public List<ReviewBean> myReviewList(Criteria cri);
	
	
	public int getTotalCount(RCriteria rcri);
	
	public int myGetTotal(Criteria cri);

}
