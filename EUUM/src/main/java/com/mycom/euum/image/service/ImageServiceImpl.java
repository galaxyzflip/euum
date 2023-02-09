
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
	public void insertImage(List<ImageBean> imageBeanList, int imageUseNum) throws Exception {
		for (ImageBean imageBean : imageBeanList) {
			if (imageBean.getImageFileName().equals("")) { continue; } // 파일을 업로드 하지 않았을 때
			imageBean.setImageUseNum(imageUseNum);
			imageMapper.insertImage(imageBean);
		}
		log.info("imageBeanList: " + imageBeanList);
	}

	
	/** 최창선 : 이미지 리스트 가져오기 Bean의 imageUse, imageUseNum 조건으로 리스트 가져오기*/
	@Override
	public List<ImageBean> getImageList(ImageBean imageBean){
		
		return imageMapper.selectImageList(imageBean);
	}
  
  	/** 이미지 삭제 - 이미지 데이터 DB에서 삭제 */
	@Override
	public void deleteImage(List<ImageBean> imageBeanList, int imageUseNum) throws Exception {
		for (ImageBean imageBean : imageBeanList) {
			if (imageBean.getImageFileName().equals("")) { continue; } // 파일을 업로드 하지 않았을 때
			imageBean.setImageUseNum(imageUseNum);
			imageMapper.deleteImage(imageBean);
		}
		log.info("imageBeanList: " + imageBeanList);
	}
	/** 전문가 프로필 전환 시 기본 이미지 등록 */
	@Override
	public void insertSellerImage(int imageUseNum) throws Exception {
		
		imageMapper.insertSellerImage(imageUseNum);
		
	}
	/** 전문가 프로필 이미지 정보 가져오기 */
	@Override
	public ImageBean getSellerImage(int imageUseNum) throws Exception {
		
		return imageMapper.getSellerImage(imageUseNum);
		
	}

	@Override
	public void insertImage(ImageBean imageBean) throws Exception {
		// TODO Auto-generated method stub
		
	}

}

