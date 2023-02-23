package com.mycom.euum.admin.goodsQNA.service;

import java.util.List;

import com.mycom.euum.goodsQNA.bean.GoodsQNABean;
import com.mycom.euum.image.bean.ImageBean;

public interface AdminGoodsQNAService {
	
	public List<GoodsQNABean> getAdminGQNAList();
	
	public void cancelGdelete(GoodsQNABean goodsQNABean);
	
	/**어드민용 이미지 가져오기 */
	public List<ImageBean> getAdminQimage(int goodsQNANum);

}
