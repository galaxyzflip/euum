package com.mycom.euum.request.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycom.euum.page.RqCriteria;
import com.mycom.euum.request.bean.RequestBean;
import com.mycom.euum.request.mapper.RequestMapper;

import lombok.Setter;

@Service
public class RequestServiceImpl implements RequestService {



	@Setter(onMethod_ = @Autowired)
	private RequestMapper requestMapper;
	
	@Override
	public void requestInsert(RequestBean requestBean) {
		// TODO Auto-generated method stub
		requestMapper.requestInsert(requestBean);
	}

	@Override
	public List<RequestBean> requestList(RqCriteria rqcri) {
		// TODO Auto-generated method stub
		return requestMapper.requestList(rqcri);
	}

	@Override
	public int getTotal(RqCriteria rqcri) {
		// TODO Auto-generated method stub
		return requestMapper.getTotalCount(rqcri);
	}

	@Override
	public RequestBean requestDetail(int requestNum) {
		// TODO Auto-generated method stub
		return requestMapper.requestDetail(requestNum);
	}
	
	@Override
	public RequestBean requestModifyForm(int requestNum) {
		// TODO Auto-generated method stub
		return requestMapper.requestModify(requestNum);
	}

	@Override
	public int requestModifyPro(RequestBean requestBean) {
		// TODO Auto-generated method stub
		return requestMapper.requestModifyPro(requestBean);
	}
	
	@Override
	public List<RequestBean> requestCategoryChange(RqCriteria rqcri) {
		// TODO Auto-generated method stub
		return requestMapper.requestCategoryChange(rqcri);
	}
	

}
