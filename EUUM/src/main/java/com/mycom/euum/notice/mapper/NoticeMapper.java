package com.mycom.euum.notice.mapper;

import java.util.List;

import com.mycom.euum.notice.bean.NoticeBean;
import com.mycom.euum.page.Criteria;

public interface NoticeMapper {
    
	public List<NoticeBean> noticeList(Criteria cri);
	
	public List<NoticeBean> FAQList();
	
	public int category();
	
	public int noticeInsert(NoticeBean noticeBean);
	
	public NoticeBean noticeDetail(int noticeNum);
	
	public NoticeBean noticeModify(int noticeNum);
	
	public int noticeModifyPro(NoticeBean noticeBean);
	
	public int noticeDelete(NoticeBean noticeBean);
	
	public int getTotalCount(Criteria cri);
	
	
}
