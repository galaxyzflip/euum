package com.mycom.euum.admin.request.service;

import java.util.List;

import com.mycom.euum.request.bean.RequestBean;

public interface AdminRequestService {
	
	public List<RequestBean> getAdminRList();
	
	public void updateRstatus(RequestBean requestBean);
	
	public void deleteAdminRequest(RequestBean requestBean);
	
	public void cancelRdelete(RequestBean requestBean);

}
