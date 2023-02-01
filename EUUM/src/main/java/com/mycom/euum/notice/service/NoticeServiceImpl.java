package com.mycom.euum.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycom.euum.notice.bean.NoticeBean;
import com.mycom.euum.notice.mapper.NoticeMapper;
import com.mycom.euum.page.Criteria;

import lombok.Setter;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	

	@Setter(onMethod_ = @Autowired)
	private NoticeMapper noticeMapper;
	
	 @Override
	public List<NoticeBean> noticeList(Criteria cri) {
		
		return noticeMapper.noticeList(cri);
	}
	 
	 @Override
		public List<NoticeBean> FAQList() {
			// TODO Auto-generated method stub
			return noticeMapper.FAQList();
	}

	@Override
	public int category() {
		// TODO Auto-generated method stub
		return noticeMapper.category();
	}

	@Override
	public void noticeInsert(NoticeBean noticeBean) {
		// TODO Auto-generated method stub
		noticeMapper.noticeInsert(noticeBean);
	}

	@Override
	public NoticeBean noticeDetail(int noticeNum) {
		// TODO Auto-generated method stub
		return noticeMapper.noticeDetail(noticeNum);
	}

	@Override
	public NoticeBean noticeModify(int noticeNum) {
		// TODO Auto-generated method stub
		return  noticeMapper.noticeModify(noticeNum);
	}

	@Override
	public int noticeModifyPro(NoticeBean noticeBean) {
		// TODO Auto-generated method stub
		return noticeMapper.noticeModifyPro(noticeBean);
	}

	@Override
	public int noticeDelete(NoticeBean noticeBean) {
		// TODO Auto-generated method stub
		return noticeMapper.noticeDelete(noticeBean);
	}

	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return noticeMapper.getTotalCount(cri);
	}
	 
	 

}
