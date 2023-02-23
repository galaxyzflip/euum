package com.mycom.euum.review.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycom.euum.goodsQNA.bean.GoodsQNABean;
import com.mycom.euum.image.bean.ImageBean;
import com.mycom.euum.notice.bean.NoticeBean;
import com.mycom.euum.page.Criteria;
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
	public int reviewInsert(ReviewBean reviewBean, HttpServletRequest request) {
		
		reviewMapper.reviewInsert(reviewBean);
		
		int reviewSelectKey = reviewBean.getReviewNum();
		
		System.out.println("service selectkey====================" + reviewBean.getReviewNum());
		
		return reviewSelectKey;
	}
	

	@Override
	public int reviewModifyPro(ReviewBean reviewBean) {
		// TODO Auto-generated method stub
		return reviewMapper.reviewModifyPro(reviewBean);
	}

	@Override
	public int reviewDelete(ReviewBean reviewBean) {
		// TODO Auto-generated method stub
		return reviewMapper.reviewDelete(reviewBean);
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
	public int getTotal(RCriteria rcri) {
		// TODO Auto-generated method stub
		return reviewMapper.getTotalCount(rcri);
	}

	@Override
	public List<ReviewBean> myReviewList(Criteria cri) {
		// TODO Auto-generated method stub
		return reviewMapper.myReviewList(cri);
	}

	@Override
	public int myGetTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return reviewMapper.myGetTotal(cri);
	}
    
	/** 리뷰이미지 가져오기 */
	@Override
	public List<ImageBean> getSelectRimage(int reviewNum) {
		
		return reviewMapper.getSelectRimage(reviewNum);
	}
	
	

	

}
