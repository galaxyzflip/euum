package com.mycom.euum.request.bean;

import java.util.Date;

import lombok.Data;

@Data
public class RequestBean {
	
	private int requestNum;
	private int requestCategory; //디자인,일러 등등
	private String requestUse;  //상업용, 비상업용 등
	private int requestMoney;
	private String requestStatus; //등록 대기중, 접수중
	private int memberNum;
	private String requestWriter;
	private String requestTitle;
	private String requestContent;
	private Date requestRegDate;
	private Date requestFinish; //접수 마감일
	private Date requestDead; //희망 마감일
	private String requestDelete;

}