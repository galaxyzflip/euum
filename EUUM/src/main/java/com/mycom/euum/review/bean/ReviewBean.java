package com.mycom.euum.review.bean;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewBean {
	
	private int reviewNum; 
	private int memberNum;
	private String reviewWriter;
	private String reviewTitle;
	private String reviewContent;
	private Date reviewRegdate;
	private int reviewStar;
	private String reviewDelete;
	private int goodsNum;
	private int orderNum;

}
