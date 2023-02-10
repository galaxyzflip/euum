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
	 
	@Override
	public int goodsQNAInsert(GoodsQNABean goodsQNABean) {
			
		goodsQNAMapper.goodsQNAInsert(goodsQNABean);
		
		int goodsQNASelectKey = goodsQNABean.getGoodsQNANum();	
		
		System.out.println("========서비스 goodsqna값 받아오는지======" + goodsQNABean.getGoodsQNANum());
		
        return goodsQNASelectKey;	
	}
	
	@Override
	public void insertGqnaComment(GoodsQNABean goodsQNABean) {
		
		goodsQNAMapper.insertGqnaComment(goodsQNABean);
	}
	
	@Override
	public int getGoodsQNATotalCount(Criteria cri, String goodsNum) {
	
		return goodsQNAMapper.getGoodsQNATotalCount(cri, goodsNum);
	}
	
	/** 마이페이지 상품 문의 내역 */
	@Override
	public List<GoodsQNABean> myGoodsQNAList(int memberNum, int pageNum, int amount) {
		
		return goodsQNAMapper.myGoodsQNAList(memberNum, pageNum, amount);
	}
    
	/** 마이페이지문의 총 개수 */
	@Override
	public int getmyGQNATotalCount(Criteria cri, int memberNum) {
		
		return goodsQNAMapper.getmyGQNATotalCount(cri, memberNum);
	}
	
	/**마이페이지 상품문의 삭제 */
	@Override
	public void deleteGQNA(GoodsQNABean goodsQNABean) {
		
		goodsQNAMapper.deleteGQNA(goodsQNABean);
	}
    
	/**마이페이지 상품문의 수정 */
	@Override
	public void modifyGQNA(GoodsQNABean goodsQNABean) {
		
		goodsQNAMapper.modifyGQNA(goodsQNABean);
	}
	
	
	
	
	

}
