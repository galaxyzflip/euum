package com.mycom.euum.request.service;

import java.util.List;

import com.mycom.euum.page.RqCriteria;
import com.mycom.euum.request.bean.RequestBean;

public interface RequestService {
	
	public void requestInsert(RequestBean requestBean);
	
	public List<RequestBean> requestList(RqCriteria rqcri);
	
	public List<RequestBean> requestCategoryChange(RqCriteria rqcri);
	
	public RequestBean requestDetail(int requestNum);
	
	public int getTotal(RqCriteria rqcri);

}
