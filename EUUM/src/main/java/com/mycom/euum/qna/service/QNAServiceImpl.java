package com.mycom.euum.qna.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.mycom.euum.page.Criteria;
import com.mycom.euum.qna.bean.QNABean;
import com.mycom.euum.qna.mapper.QNAMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class QNAServiceImpl implements QNAService{

	private QNAMapper qnaMapper;

	@Override
	public List<QNABean> qnaList(Criteria cri) {
	
		return qnaMapper.qnaList(cri);
	}

	@Override
	public int qnaInsert(QNABean qnaBean, HttpServletRequest request) {
	    
		log.info("qnaBean service==============" + qnaBean);
	    
	    qnaMapper.qnaInsert(qnaBean); 
		
		int qnaSelectKey = qnaBean.getQnaNum();
		
		return qnaSelectKey;
	}

	@Override
	public QNABean qnaDetail(int qnaNum) {
	
		return qnaMapper.qnaDetail(qnaNum);
	}
    
	/* 문의글 삭제처리 */
	@Override
	public void qnaDelete(QNABean qnaBean) {
		
	   qnaMapper.qnaDelete(qnaBean);
	}
	
	//답변글
	@Override
	public void rewrite(QNABean qnaBean) {	   
		
		qnaMapper.rewrite(qnaBean);
		
		/* qnaMapper.updateOrder(qnaOrdered); */

	}
	
    //답변글 순서증가
	@Override
	public int updateOrder(int qnaNid, int qnaOrdered) {
		
		return qnaMapper.updateOrder(qnaNid, qnaOrdered);
	}
    
	//부모글 정보 가져오기
	@Override
	public QNABean selectInfo(int qnaNum) {
		
		return qnaMapper.selectInfo(qnaNum);
	}

	@Override
	public void qnaModifyPro(QNABean qnaBean) {
		
		 qnaMapper.qnaModifyPro(qnaBean);
	}
    
	@Override
	public int getQNATotalCount(Criteria cri) {
	
		return qnaMapper.getQNATotalCount(cri);
	}

	@Override
	public int updateQNAcnt(int qnaNum) {
		
		return qnaMapper.updateQNAcnt(qnaNum);
	}

	
	
}
