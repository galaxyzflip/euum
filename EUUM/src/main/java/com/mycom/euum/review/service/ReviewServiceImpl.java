package com.mycom.euum.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycom.euum.notice.bean.NoticeBean;
import com.mycom.euum.page.RCriteria;
import com.mycom.euum.review.bean.ReviewBean;
import com.mycom.euum.review.mapper.ReviewMapper;

import lombok.Setter;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Setter(onMethod_ = @Autowired)
	private ReviewMapper reviewMapper;
	

	@Override
	public List<ReviewBean> reviewList(RCriteria rcri) {
		// TODO Auto-generated method stub
		return reviewMapper.reviewList(rcri);
	}
	
//	@Override
//	public List<ReviewBean> reviewList(String goodsNum, int pageNum, int amount) {
//		// TODO Auto-generated method 
//		return reviewMapper.reviewList(goodsNum, pageNum, amount);
//	}

	@Override
	public void reviewInsert(ReviewBean reviewBean) {
		// TODO Auto-generated method stub
		reviewMapper.reviewInsert(reviewBean);
	}

	@Override
	public int reviewModifyPro(ReviewBean reviewBean) {
		// TODO Auto-generated method stub
		return reviewMapper.reviewModifyPro(reviewBean);
	}

	@Override
	public int reviewDelete(int reviewNum) {
		// TODO Auto-generated method stub
		return reviewMapper.reviewDelete(reviewNum);
	}

	@Override
	public ReviewBean reviewDetail(int reviewNum) {
		// TODO Auto-generated method stub
		return reviewMapper.reviewDetail(reviewNum);
	}
	

	@Override
	public ReviewBean reviewModifyForm(int reviewNum) {
		// TODO Auto-generated method stub
		return reviewMapper.reviewModifyForm(reviewNum);
	}

	@Override
	public int myReview(int memberNum) {
		// TODO Auto-generated method stub
		return reviewMapper.myReview(memberNum);
	}
	
	@Override
	public int getTotal(RCriteria rcri) {
		// TODO Auto-generated method stub
		return reviewMapper.getTotalCount(rcri);
	}

}
