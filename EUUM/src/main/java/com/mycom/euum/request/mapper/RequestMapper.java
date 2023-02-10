package com.mycom.euum.request.mapper;

import java.util.List;

import com.mycom.euum.page.RqCriteria;
import com.mycom.euum.request.bean.RequestBean;

public interface RequestMapper {
	
	public void requestInsert(RequestBean requestBean);
	
	public List<RequestBean> requestList(RqCriteria rqcri);

}
