
package com.mycom.euum.image.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mycom.euum.image.bean.ImageBean;

public interface ImageMapper {

	/** 선민: 이미지 등록 - 새로운 이미지 데이터를 DB에 삽입하기 */
	void insertImage(ImageBean imageBean) throws Exception;

	/** 선민: 이미지 수정 - 수정된 이미지만 데이터를 DB에 업데이트 */
	void updateImage(ImageBean imageBean) throws Exception;

	/** 선민: 이미지 수정 - 수정하는 sequence에 해당하는 기존 DB 데이터가 있는지 확인 */
	int selectExistingSequence(ImageBean imageBean) throws Exception;

	/** 선민: 이미지 전체 삭제 - 기존 이미지 데이터를 DB에서 삭제하기 */
	void deleteImage(@Param("imageUse") String imageUse, @Param("imageUseNum") String imageUseNum) throws Exception;

	
	
	/** 최창선 : 이미지 목록 가져오기 bean 의 imageUse, imageUseNum 조건으로 조회 */
	public List<ImageBean> selectImageList(ImageBean imageBean);

	void deleteImage(ImageBean imageBean) throws Exception;

	void insertSellerImage(int imageUseNum) throws Exception;

	ImageBean getSellerImage(int imageUseNum) throws Exception;

}
