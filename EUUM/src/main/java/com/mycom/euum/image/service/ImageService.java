
package com.mycom.euum.image.service;

import java.util.List;

import com.mycom.euum.image.bean.ImageBean;

public interface ImageService {

	/** 선민: 이미지 등록 - 새로운 이미지 데이터를 DB에 삽입하기 */
	public void insertImage(List<ImageBean> imageBeanList, int imageUseNum) throws Exception;

	/** 선민: 이미지 수정 - 수정된 이미지만 데이터를 DB에 업데이트 */
	public void updateImage(List<ImageBean> imageBeanList, int imageUseNum) throws Exception;

	/** 선민: 이미지 전체 삭제 - 기존 이미지 데이터를 DB에서 삭제하기 */
	public void deleteImage(String imageUse, int imageUseNum) throws Exception;

	
	
	public void insertImage(ImageBean imageBean) throws Exception;

	public List<ImageBean> getImageList(ImageBean imageBean);

	public void deleteImage(List<ImageBean> imageBeanList, int imageUseNum) throws Exception;

	public void insertSellerImage(int imageUseNum) throws Exception;

	public ImageBean getSellerImage(int imageUseNum) throws Exception;

}
