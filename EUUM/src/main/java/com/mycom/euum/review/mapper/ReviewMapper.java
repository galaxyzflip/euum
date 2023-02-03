package com.mycom.euum.review.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mycom.euum.page.RCriteria;
import com.mycom.euum.review.bean.ReviewBean;

public interface ReviewMapper {
	
	public List<ReviewBean> reviewList(RCriteria rcri);
	
//	public List<ReviewBean> reviewList(@Param("goodsNum") String goodsNum, @Param("pageNum") int pageNum, @Param("amount") int amount);
	
	public void reviewInsert(ReviewBean reviewBean);
	
	public int reviewModify(int reviewNum);
	
	public int reviewDelete(int reviewNum);
	
	public ReviewBean reviewDetail(int reviewNum);
	
	
	public int getTotalCount(RCriteria rcri);

}
