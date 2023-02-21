package com.mycom.euum.admin.review.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mycom.euum.admin.review.mapper.AdminReviewMapper;
import com.mycom.euum.review.bean.ReviewBean;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class AdminReviewServiceImpl implements AdminReviewService{
	
	private AdminReviewMapper adminReivewMapper;
	
	@Override
	public List<ReviewBean> getAdminReviewList() {
		
		return adminReivewMapper.getAdminReviewList();
	}

	@Override
	public void deleteAdminReview(ReviewBean reviewBean) {
		
		adminReivewMapper.deleteAdminReview(reviewBean);
	}

	@Override
	public void cancelRdelete(ReviewBean reviewBean) {
		
		adminReivewMapper.cancelRdelete(reviewBean);
	}
	
	
	
	
	
	

}
