/**
 * 작성일 : 2023-01-13
 * 용도 : 상품 정보 Bean
 * 작성자 : 김선민, 이은정
 * 
 */

package com.mycom.euum.goods.bean;

import java.sql.Date;
import lombok.Data;

@Data
public class GoodsBean {
	
	int goodsNum;
	String goodsCategory; 
	String goodsStatus;
	String goodsName;
	String goodsContent;
	int goodsPrice;
	String goodsSellerNickname;
	int memberNum;
	String goodsFormat;
	String goodsResolution;
	String goodsSize;
	String goodsUse;
	String goodsModifyCount;
	Date goodsDate;
	String goodsPeriod;
	String goodsImageDate;
	String goodsImage1;
	String goodsImage2;
	String goodsImage3;
}
