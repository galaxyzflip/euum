/**
 * 작성일 : 2023-01-20
 * 용도 : 파일(이미지) Bean
 * 작성자 : 김선민
 * 
 */

package com.mycom.euum.image.bean;

import lombok.Data;

@Data
public class ImageBean {
	int imageNum;
	String imageUUID;
	String imageUploadPath;
	String imageFileName;
	String imageFileType;
	String imageUse;
	int imageUseNum;
	String originalFileName;
}
