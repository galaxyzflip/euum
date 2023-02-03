/**
 * 작성일 : 2023-01-13
 * 용도 : 회원 공통 Bean
 * 작성자 : 최창선, 김명식, 김병찬
 * 
 * */

package com.mycom.euum.member.bean;

import java.sql.Date;

import lombok.Data;

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

	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMemberPassword() {
		return memberPassword;
	}
	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}
	public String getMemberMobile() {
		return memberMobile;
	}
	public void setMemberMobile(String memberMobile) {
		this.memberMobile = memberMobile;
	}
	public String getMemberClass() {
		return memberClass;
	}
	public void setMemberClass(String memberClass) {
		this.memberClass = memberClass;
	}
	public String getMemberGrade() {
		return memberGrade;
	}
	public void setMemberGrade(String memberGrade) {
		this.memberGrade = memberGrade;
	}
	public int getMemberPoint() {
		return memberPoint;
	}
	public void setMemberPoint(int memberPoint) {
		this.memberPoint = memberPoint;
	}
	public String getMemberZipcode() {
		return memberZipcode;
	}
	public void setMemberZipcode(String memberZipcode) {
		this.memberZipcode = memberZipcode;
	}
	public String getMemberAddress() {
		return memberAddress;
	}
	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}
	public String getMemberDetailAddress() {
		return memberDetailAddress;
	}
	public void setMemberDetailAddress(String memberDetailAddress) {
		this.memberDetailAddress = memberDetailAddress;
	}
	public Date getMemberRegDate() {
		return MemberRegDate;
	}
	public void setMemberRegDate(Date memberRegDate) {
		MemberRegDate = memberRegDate;
	}
	public Date getMemberModifyDate() {
		return MemberModifyDate;
	}
	public void setMemberModifyDate(Date memberModifyDate) {
		MemberModifyDate = memberModifyDate;
	}
}
