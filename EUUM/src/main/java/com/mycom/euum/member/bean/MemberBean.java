/**
 * 작성일 : 2023-01-13
 * 용도 : 회원 공통 Bean
 * 작성자 : 최창선, 김명식, 김병찬
 *
 * */

package com.mycom.euum.member.bean;

import java.sql.Date;
import lombok.Data;

@Data
public class MemberBean {

	private int memberNum;
	private String memberName;
	private String memberEmail;
	private String memberPassword;
	private String memberMobile;
	private String memberClass;
	private String memberGrade;
	private int memberPoint;
	private String memberZipcode;
	private String memberAddress;
	private String memberDetailAddress;

	private Date MemberRegDate;
	private Date MemberModifyDate;
	private String memberJoinApi;
	private String memberJoinDi;
	
}
