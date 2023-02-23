package com.mycom.euum.admin.goods.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mycom.euum.admin.goods.mapper.AdminGoodsMapper;
import com.mycom.euum.goods.bean.GoodsBean;
import com.mycom.euum.page.Criteria2;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;



@Service
@Log4j
@AllArgsConstructor
public class AdminGoodsServiceImpl implements AdminGoodsService {
	
   private AdminGoodsMapper adminGoodsMapper;
	
    /** 관리자 상품 리스트 가져오기 */
	@Override
	public List<GoodsBean> adminGoodsList(Criteria2 cri) {
		
		return adminGoodsMapper.adminGoodsList(cri);
	}
	
	/** 관리자 상품 리스트 페이징,검색,정렬 */
	@Override
	public int getTotal(Criteria2 cri) {
		// TODO Auto-generated method stub
		return adminGoodsMapper.adminGetTotalCount(cri);
	
	}
	
	

}