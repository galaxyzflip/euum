package com.mycom.euum.notice.bean;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeBean {
	
	private int noticeNum;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeRegdate;
	private String noticeWriter;
	private String noticeDelete;
	private int noticeCategory;
	private String memberGrade;

}
