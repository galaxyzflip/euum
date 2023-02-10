package com.mycom.euum.image.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mycom.euum.image.bean.ImageBean;

public interface ImageMapper {

	/** 선민: 이미지 등록 - 새로운 이미지 데이터를 DB에 삽입하기 */
	void insertImage(ImageBean imageBean) throws Exception;
	
	/** 선민: 이미지 수정 - 수정된 이미지만 데이터를 DB에 업데이트 */
	void updateImage(ImageBean imageBean) throws Exception;
	
	/** 선민: 이미지 삭제 - 기존 이미지 데이터를 DB에서 삭제하기 */
	void deleteImage(@Param("imageUse") String imageUse, @Param("imageUseNum") String imageUseNum) throws Exception;
    
	/** 의종: 고객문의 이미지 가져오기*/
	public List<ImageBean> selectQNAImage(int qnaNum);
	
	/** 의종: 상품문의 이미지 가져오기*/
	public List<ImageBean> selectGoodsQNAImage(int goodsQNANum);

}
