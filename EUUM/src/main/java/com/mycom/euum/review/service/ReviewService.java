package com.mycom.euum.review.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.mycom.euum.image.bean.ImageBean;
import com.mycom.euum.page.Criteria;
import com.mycom.euum.page.RCriteria;
import com.mycom.euum.review.bean.ReviewBean;

public interface ReviewService {
	
	public List<ReviewBean> reviewList(RCriteria rcri);
	
//	public List<ReviewBean> reviewList(String goodsNum, int pageNum, int amount);
	
	public int reviewInsert(ReviewBean reviewBean,HttpServletRequest request); 
	
	public ReviewBean reviewDetail(int reviewNum);
	
	public ReviewBean reviewModifyForm(int reviewNum);
	
	public List<ReviewBean> myReviewList(Criteria cri);
	
	public int reviewModifyPro(ReviewBean reviewBean);
	
	public int reviewDelete(ReviewBean reviewBean);
	
	
	public int getTotal(RCriteria rcri);
	
	public int myGetTotal(Criteria cri);
	
	/** 리뷰 이미지 가져오기 */
	public List<ImageBean> getSelectRimage(int reviewNum);
}
