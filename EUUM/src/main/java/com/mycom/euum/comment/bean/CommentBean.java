package com.mycom.euum.comment.bean;

import java.util.Date;

import lombok.Data;

@Data
public class CommentBean {
	
	private int commentNum; //��۹�ȣ
	private int memberNum;  //ȸ����ȣ
	private String commentWriter; //����ۼ���
	private String commentTitle; //��� ����
	private String commentContent; //��� ����
	private Date commentRegdate; //��� ��¥
	private String commentDelete; //��� ��������
	private int commentOriginalNum; //���� ��ȣ
	private int commentNickname; //������ �г���
	private int commentCategory; //��� ī�װ�
	

}
