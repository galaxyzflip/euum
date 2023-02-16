package com.mycom.euum.goodsQNA.bean;

import java.util.Date;
import java.util.List;

import com.mycom.euum.image.bean.ImageBean;

import lombok.Data;

@Data
public class GoodsQNABean {
	
	private int goodsQNANum;
	private int goodsNum;
	private int memberNum;
	private String goodsQNAWriter;
	private String goodsQNATitle;
	private String goodsQNAContent;
	private Date goodsQNARegdate;
	private String goodsQNASecret;
	private String goodsQNADelete;
	private String goodsQNAComment;
	private List<ImageBean> imageBean;
	/* private ImageBean imageBean; */

}
