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
		int sequence = 1;

		for (ImageBean imageBean : imageBeanList) {

			if (!imageBean.isNew()) { // 파일을 업로드 하지 않았을 때
				if (imageBean.getImageUse().equals("goods")) {
					sequence++;
				}
				continue;
			}
			imageBean.setImageUseNum(imageUseNum);
			imageBean.setImageSequence(sequence);
			imageMapper.insertImage(imageBean);
			sequence++;
		}
		log.info("imageBeanList: " + imageBeanList);
	}

	/** 선민: 이미지 수정 - 수정된 이미지만 데이터를 DB에 업데이트 */
	@Override
	public void updateImage(List<ImageBean> imageBeanList, int imageUseNum) throws Exception {
		int sequence = 1;

		for (ImageBean imageBean : imageBeanList) {
			if (!imageBean.isNew()) { // 파일을 업로드 하지 않았을 때
				imageBean.setImageSequence(sequence);
				sequence++;
				continue;
			}
			imageBean.setImageUseNum(imageUseNum);
			imageBean.setImageSequence(sequence);

			int ExistingSequence = imageMapper.selectExistingSequence(imageBean);

			switch (ExistingSequence) {
			case 0:
				imageMapper.insertImage(imageBean);
				break;
			case 1:
				imageMapper.updateImage(imageBean);
				break;
			}
			sequence++;
			log.info(imageBean.getImageSequence() + "번째 이미지 수정");
		}
		log.info("imageBeanList: " + imageBeanList);
	}

	/** 선민: 이미지 전체 삭제 - 기존 이미지 데이터를 DB에서 삭제하기 */
	@Override
	public void deleteImage(String imageUse, int imageUseNum) throws Exception {
		imageMapper.deleteImage(imageUse, Integer.toString(imageUseNum));
	}

	/** 이미지 삭제 - 이미지 데이터 DB에서 삭제 */
	@Override
	public void deleteImage(List<ImageBean> imageBeanList, int imageUseNum) throws Exception {
		for (ImageBean imageBean : imageBeanList) {
			if (imageBean.getImageFileName().equals("")) {
				continue;
			} // 파일을 업로드 하지 않았을 때
			imageBean.setImageUseNum(imageUseNum);
			imageMapper.deleteImage(imageBean);
		}
		log.info("imageBeanList: " + imageBeanList);
	}
	
	/** 최창선 : 이미지 리스트 가져오기 Bean의 imageUse, imageUseNum 조건으로 리스트 가져오기 */
	@Override
	public List<ImageBean> getImageList(ImageBean imageBean) {

		return imageMapper.selectImageList(imageBean);
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

	/** 선민: 이미지 등록 - 새로운 이미지 데이터를 DB에 삽입하기 */
	/** 주문 파일 업로드에 사용하니 지우지 마시오!!*/
	@Override
	public void insertImage(ImageBean imageBean) throws Exception {

		imageMapper.insertImage(imageBean);
	}

	
	/** 의종: 고객문의 이미지 가져오기*/
	@Override
	public List<ImageBean> selectQNAImage(int qnaNum) {
		
		return imageMapper.selectQNAImage(qnaNum);
	}
    
	/** 의종: 상품문의 이미지 가져오기*/
	@Override
	public List<ImageBean> selectGoodsQNAImage(int goodsQNANum) {
		
		return imageMapper.selectGoodsQNAImage(goodsQNANum);
	}


	@Override
	public void insertImage(ImageBean imageBean) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
