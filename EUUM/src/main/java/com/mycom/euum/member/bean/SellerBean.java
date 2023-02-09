package com.mycom.euum.member.bean;

import java.sql.Date;


import lombok.Data;

@Data
public class SellerBean {

	private int sellerNum;
	private int memberNum;
	private String sellerBankName;
	private String sellerAccountNum;
	private String sellerAccountName;
	private String sellerSpecialty;
	private String sellerDescription;
	private String sellerNickName;
	private String sellerContact1;
	private String sellerContact2;
	private String sellerBuisnessYn;
	private Date sellerRegDate;
	private String sellerImage;
}
