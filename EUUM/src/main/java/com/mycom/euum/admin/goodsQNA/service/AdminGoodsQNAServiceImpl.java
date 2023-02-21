package com.mycom.euum.admin.goodsQNA.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mycom.euum.admin.goodsQNA.mapper.AdminGoodsQNAMapper;
import com.mycom.euum.goodsQNA.bean.GoodsQNABean;
import com.mycom.euum.image.bean.ImageBean;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class AdminGoodsQNAServiceImpl implements AdminGoodsQNAService{
	
	private AdminGoodsQNAMapper adminGoodsQNAMapper;
	
	@Override
	public List<GoodsQNABean> getAdminGQNAList() {
	
		return adminGoodsQNAMapper.getAdminGQNAList();
	}

	@Override
	public void cancelGdelete(GoodsQNABean goodsQNABean) {
		
		adminGoodsQNAMapper.cancelGdelete(goodsQNABean);
	}

	@Override
	public List<ImageBean> getAdminQimage(int goodsQNANum) {
		
		return adminGoodsQNAMapper.getAdminQimage(goodsQNANum);
	}
	
	
	
	

}
