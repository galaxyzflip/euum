package com.mycom.euum.qna.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mycom.euum.page.Criteria;
import com.mycom.euum.qna.bean.QNABean;

public interface QNAMapper {
	
	public List<QNABean> qnaList(Criteria cri);
	
	public int qnaInsert(QNABean qnaBean);
	
	public QNABean qnaDetail(int qnaNum);
	
	/* 문의글 삭제처리*/
	public void qnaDelete(QNABean qnaBean);
	
	/* 답글쓰기 */
	public void rewrite(QNABean qnaBean);
	
	/* 답글순서증가 */
	public int updateOrder(@Param("qnaNid")int qnaNid, @Param("qnaOrdered")int qnaOrdered);
	
	/* 부모글 정보 가져오기 */
	public QNABean selectInfo(int qnaNum);
	
	public void qnaModifyPro(QNABean qnaBean);
	
	/* 총 게시글수 가져오기 */
	public int getQNATotalCount(Criteria cri);
	
    public int updateQNAcnt(int qnaNum);
	

}
