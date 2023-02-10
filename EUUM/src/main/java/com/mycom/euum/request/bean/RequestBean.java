package com.mycom.euum.request.bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class RequestBean {
	
	private int requestNum;
	private String requestCategory; //디자인,일러 등등
	private String requestUse;  //상업용, 비상업용 등
	private	String requestMoney;
	private String requestStatus; //등록 대기중, 접수중
	private int memberNum;
	private String requestWriter;
	private String requestTitle;
	private String requestContent;
	private Date requestRegDate;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date requestFinish; //접수 마감일
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date requestDead; //희망 마감일
	private String requestDelete;

}