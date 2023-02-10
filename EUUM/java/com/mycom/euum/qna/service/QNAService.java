package com.mycom.euum.qna.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.mycom.euum.page.Criteria;
import com.mycom.euum.qna.bean.QNABean;

public interface QNAService {
	
	public List<QNABean> qnaList(Criteria cri);
	
	public int qnaInsert(QNABean qnaBean,HttpServletRequest request);
    
	public QNABean qnaDetail(int qnaNum);
	
	/* 문의글 삭제처리*/
	public void qnaDelete(QNABean qnaBean);
	
	//답변글
	public void rewrite(QNABean qnaBean);
	
	//답변글 순서증가
	public int updateOrder(int qnaNid,int qnaOrdered);
	
	/* 부모글 정보 가져오기 */
	public QNABean selectInfo(int qnaNum);
	
	public void qnaModifyPro(QNABean qnaBean);
	
	public int getQNATotalCount(Criteria cri);
	
	public int updateQNAcnt(int qnaNum);
}
