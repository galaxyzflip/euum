package com.mycom.euum.qna.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mycom.euum.page.Criteria;
import com.mycom.euum.qna.bean.QNABean;

public interface QNAMapper {
	
	public List<QNABean> qnaList(Criteria cri);
	
	public int qnaInsert(QNABean qnaBean);
	
	public QNABean qnaDetail(int qnaNum);
	
	/* ���Ǳ� ����ó��*/
	public void qnaDelete(QNABean qnaBean);
	
	/* ��۾��� */
	public void rewrite(QNABean qnaBean);
	
	/* ��ۼ������� */
	public int updateOrder(@Param("qnaNid")int qnaNid, @Param("qnaOrdered")int qnaOrdered);
	
	/* �θ�� ���� �������� */
	public QNABean selectInfo(int qnaNum);
	
	public void qnaModifyPro(QNABean qnaBean);
	
	/* �� �Խñۼ� �������� */
	public int getQNATotalCount(Criteria cri);
	
    public int updateQNAcnt(int qnaNum);
	

}
