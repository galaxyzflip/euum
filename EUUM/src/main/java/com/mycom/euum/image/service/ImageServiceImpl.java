package com.mycom.euum.image.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mycom.euum.image.bean.ImageBean;
import com.mycom.euum.image.mapper.ImageMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class ImageServiceImpl implements ImageService {
	
	private ImageMapper imageMapper;

	/** 선민: 이미지 등록 - 새로운 이미지 데이터를 DB에 삽입하기 */
	@Override
	public void insertImage(ImageBean imageBean) throws Exception {
		imageMapper.insertImage(imageBean);
	}
	
	/** 최창선 : 이미지 리스트 가져오기 Bean의 imageUse, imageUseNum 조건으로 리스트 가져오기*/
	@Override
	public List<ImageBean> getImageList(ImageBean imageBean){
		
		return imageMapper.selectImageList(imageBean);
	}

}