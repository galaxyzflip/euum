package com.mycom.euum.comment.bean;

import java.util.Date;

import lombok.Data;

@Data
public class CommentBean {
	

	private int commentNum; 
	private int memberNum;
	private String commentWriter;
	private String commentTitle;
	private String commentContent;
	private Date commentRegdate;
	private String commentDelete;
	private int requestNum;
	private int commentNickname;
	private int commentCategory;

	

}
