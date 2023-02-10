
package com.mycom.euum.image.mapper;

import java.util.List;

import com.mycom.euum.image.bean.ImageBean;

public interface ImageMapper {

	/** 선민: 이미지 등록 - 새로운 이미지 데이터를 DB에 삽입하기 */
	void insertImage(ImageBean imageBean) throws Exception;
	
	
	/** 최창선 : 이미지 목록 가져오기 bean 의 imageUse, imageUseNum 조건으로 조회*/
	public List<ImageBean> selectImageList(ImageBean imageBean);
  
  void deleteImage(ImageBean imageBean) throws Exception;
	
	void insertSellerImage(int imageUseNum) throws Exception;
	
	ImageBean getSellerImage(int imageUseNum) throws Exception;

}

