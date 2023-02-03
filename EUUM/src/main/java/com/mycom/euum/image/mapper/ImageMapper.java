package com.mycom.euum.image.mapper;

import com.mycom.euum.image.bean.ImageBean;

public interface ImageMapper {

	/** 선민: 이미지 등록 - 새로운 이미지 데이터를 DB에 삽입하기 */
	void insertImage(ImageBean imageBean) throws Exception;

}
