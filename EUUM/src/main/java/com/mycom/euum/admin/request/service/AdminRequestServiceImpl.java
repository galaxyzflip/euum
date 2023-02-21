package com.mycom.euum.admin.request.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mycom.euum.admin.request.mapper.AdminRequestMapper;
import com.mycom.euum.request.bean.RequestBean;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class AdminRequestServiceImpl implements AdminRequestService{
    
	private AdminRequestMapper adminRequestMapper;
	
	@Override
	public List<RequestBean> getAdminRList() {
		
		return adminRequestMapper.getAdminRList();
	}

	@Override
	public void updateRstatus(RequestBean requestBean) {
		
	   adminRequestMapper.updateRstatus(requestBean);
	}

	@Override
	public void deleteAdminRequest(RequestBean requestBean) {
		
		adminRequestMapper.deleteAdminRequest(requestBean);
	}

	@Override
	public void cancelRdelete(RequestBean requestBean) {
		
		adminRequestMapper.cancelRdelete(requestBean);
	}
	
	
	
	
	
	
	
	

}
