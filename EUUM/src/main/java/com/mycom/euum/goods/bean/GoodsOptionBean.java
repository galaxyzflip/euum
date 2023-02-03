/**
 * 작성일 : 2023-01-13
 * 용도 : 상품 추가옵션 정보 Bean
 * 작성자 : 김선민, 이은정
 * 
 */

package com.mycom.euum.goods.bean;

import lombok.Data;

@Data
public class GoodsOptionBean {
	
	/** 선민: 상품-상품추가옵션 테이블 조인을 위한 key */
	int goodsNum; 
	int goodsOptPrice;
	String goodsOptName;
	int goodsOptNameNum;
	String goodsOptContent;
	int goodsOptContentNum;
	
//	private int goodsNum; 
//	private List<String> goodsOptPrice;
//	private List<String> goodsOptName;
//	private int goodsOptNameNum;
//	private List<String> goodsOptContent;
//	private int goodsOptContentNum;
}
