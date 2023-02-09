package com.mycom.euum.notice.service;

import java.util.List;

import com.mycom.euum.notice.bean.NoticeBean;
import com.mycom.euum.page.Criteria;

public interface NoticeService {
	
	public List<NoticeBean> noticeList(Criteria cri);
	

	
	public List<NoticeBean> FAQList();
	
	public int category();
	
	public void noticeInsert(NoticeBean noticeBean);
	
	public NoticeBean noticeDetail(int noticeNum);
	
	public NoticeBean noticeModify(int noticeNum);
	
	public int noticeModifyPro(NoticeBean noticeBean);
	
	public int noticeDelete(NoticeBean noticeBean);
	
	public int getTotal(Criteria cri);
}
