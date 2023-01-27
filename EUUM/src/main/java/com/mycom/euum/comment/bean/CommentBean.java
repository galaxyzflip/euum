package com.mycom.euum.comment.bean;

import java.util.Date;

import lombok.Data;

@Data
public class CommentBean {
	
	private int commentNum; //댓글번호
	private int memberNum;  //회원번호
	private String commentWriter; //댓글작성자
	private String commentTitle; //댓글 제목
	private String commentContent; //댓글 내용
	private Date commentRegdate; //댓글 날짜
	private String commentDelete; //댓글 삭제여부
	private int commentOriginalNum; //원글 번호
	private int commentNickname; //전문가 닉네임
	private int commentCategory; //댓글 카테고리
	

}
