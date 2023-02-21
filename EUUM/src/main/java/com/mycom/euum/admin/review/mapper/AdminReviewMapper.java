package com.mycom.euum.admin.review.mapper;

import java.util.List;

import com.mycom.euum.review.bean.ReviewBean;

public interface AdminReviewMapper {
	
	public List<ReviewBean> getAdminReviewList();
	
	public void deleteAdminReview(ReviewBean reviewBean);
	
	public void cancelRdelete(ReviewBean reviewBean);

}
