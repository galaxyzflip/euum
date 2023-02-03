package com.mycom.euum.image.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycom.euum.commons.FileUtils;
import com.mycom.euum.image.bean.ImageBean;
import com.mycom.euum.image.service.ImageServiceImpl;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class ImageController {

	private ImageServiceImpl imageService;
	private FileUtils fileUtils;
	
	@RequestMapping(value = "/image/imageInsertPro")
	public String imageInsertPro(ImageBean imageBean) throws Exception {
		
		imageBean.setImageFileName("test-fileName");
		imageBean.setImageFileType("i");
		imageBean.setImageUploadPath("test-uploadPath");
		imageBean.setImageUse("test-use");
		imageBean.setImageUseNum(999);
		imageBean.setImageUUID("test-uuid");
		
		imageService.insertImage(imageBean);
		
		return "main_layout";
	}
//	insertImage
	
	
}
