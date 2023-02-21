package com.mycom.euum.admin.request.mapper;

import java.util.List;

import com.mycom.euum.request.bean.RequestBean;

public interface AdminRequestMapper {
	
	public List<RequestBean> getAdminRList();
	
	public void updateRstatus(RequestBean requestBean);
	
	public void deleteAdminRequest(RequestBean requestBean);
	
	public void cancelRdelete(RequestBean requestBean);

}
