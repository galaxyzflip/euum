package com.mycom.euum.qna.bean;

import java.util.Date;

import lombok.Data;

@Data
public class QNABean {
	
	private int qnaNum;
	private int memberNum;
	private String qnaWriter;
	private String qnaTitle;
	private String qnaContent;
	private Date qnaRegdate; 
	private String qnaSecret;
	private String qnaDelete;
	private int qnaNid;
	private int qnaOrdered;
	private int qnaLayer;
	private int qnaHitcount;


}
