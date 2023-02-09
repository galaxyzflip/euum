package com.mycom.euum.goodsQNA.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.mycom.euum.goodsQNA.bean.GoodsQNABean;
import com.mycom.euum.goodsQNA.mapper.GoodsQNAMapper;
import com.mycom.euum.page.Criteria;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class GoodsQNAServiceImpl implements GoodsQNAService{
    

	private GoodsQNAMapper goodsQNAMapper;
	
	
	
	  @Override 
	  public List<GoodsQNABean> goodsQNAList(String goodsNum,int pageNum,int amount) {
	  
	      return goodsQNAMapper.goodsQNAList(goodsNum, pageNum, amount); 
	  
	  }
	 
	  
	/*
	 * @Override public List<GoodsQNABean> goodsQNAList(Map<String, Object> map) {
	 * 
	 * return goodsQNAMapper.goodsQNAList(map); }
	 */ 
	 

	@Override
	public void goodsQNAInsert(GoodsQNABean goodsQNABean) {
		
		goodsQNAMapper.goodsQNAInsert(goodsQNABean);
	}
	
	@Override
	public void insertGqnaComment(GoodsQNABean goodsQNABean) {
		
		goodsQNAMapper.insertGqnaComment(goodsQNABean);
	}
	
	@Override
	public int getGoodsQNATotalCount(Criteria cri, String goodsNum) {
	
		return goodsQNAMapper.getGoodsQNATotalCount(cri, goodsNum);
	}
	

}
