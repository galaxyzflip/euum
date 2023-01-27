package com.mycom.euum.goodsQNA.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mycom.euum.goodsQNA.bean.GoodsQNABean;
import com.mycom.euum.goodsQNA.mapper.GoodsQNAMapper;
import com.mycom.euum.qna.bean.QNABean;
import com.mycom.euum.qna.mapper.QNAMapper;
import com.mycom.euum.qna.service.QNAServiceImpl;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class GoodsQNAServiceImpl implements GoodsQNAService{
    
	@Override
	public void insertGqnaComment(GoodsQNABean goodsQNABean) {
		
		goodsQNAMapper.insertGqnaComment(goodsQNABean);
	}

	private GoodsQNAMapper goodsQNAMapper;
	
	@Override
	public List<GoodsQNABean> goodsQNAList() {
	
		return goodsQNAMapper.goodsQNAList();
	}

	@Override
	public void goodsQNAInsert(GoodsQNABean goodsQNABean) {
		
		goodsQNAMapper.goodsQNAInsert(goodsQNABean);
	}
	
	
	
	

}
