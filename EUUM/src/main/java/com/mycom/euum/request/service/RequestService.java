package com.mycom.euum.request.service;

import java.util.List;

import com.mycom.euum.page.RqCriteria;
import com.mycom.euum.request.bean.RequestBean;

public interface RequestService {
	
	public void requestInsert(RequestBean requestBean);
	
	public List<RequestBean> reviewList(RqCriteria rqcri);

}