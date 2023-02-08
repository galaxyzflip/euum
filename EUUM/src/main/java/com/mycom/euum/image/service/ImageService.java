package com.mycom.euum.image.service;

import java.util.List;

import com.mycom.euum.image.bean.ImageBean;

public interface ImageService {
	
	/** 선민: 이미지 등록 - 새로운 이미지 데이터를 DB에 삽입하기 */
	public void insertImage(List<ImageBean> imageBeanList, int imageUseNum) throws Exception;
	
	public void deleteImage(List<ImageBean> imageBeanList, int imageUseNum) throws Exception;
	
	public void insertSellerImage(int imageUseNum) throws Exception;
	
	public ImageBean getSellerImage(int imageUseNum) throws Exception;

}
