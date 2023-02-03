package com.mycom.euum.commons;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.mycom.euum.image.bean.ImageBean;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

/** 선민: 파일 업로드에 관련된 메소드를 모아놓은 Class */
@Service
@Log4j
public class FileUtils {

	/** 선민: 첨부파일 업로드 처리 (Form) */
	public List<ImageBean> fileUpload(MultipartFile[] uploadFile, HttpServletRequest request, String fileUse) {
		log.info("===== 첨부파일 업로드 =====");
		
<<<<<<< HEAD
		List<String> fileInfoList = new ArrayList<String>();
		
		// *** 각자의 경로로 변경해주세요 ***
//		String uploadFolder = "C:\\Aisu\\stsApp\\EUUM\\src\\main\\webapp\\resources\\img";
//		String uploadFolder = "C:/Aisu/stsApp/EUUM/src/main/webapp/resources/img";
//		String uploadFolder = "C:/Users/AISU/git/repository/EUUM/src/main/webapp/resources/img";
		String uploadFolder = "./resources/img";
		log.info("---------------------------------");
		log.info("uploadFolder: " + uploadFolder);
		log.info("uploadFile: " + uploadFile);
		log.info("index length: " + uploadFile.length);
		log.info("index 0: " + uploadFile[0].getOriginalFilename());
		log.info("index 1: " + uploadFile[1].getOriginalFilename());
		log.info("index 2: " + uploadFile[2].getOriginalFilename());
=======
		List<ImageBean> imageBeanList = new ArrayList<ImageBean>();
>>>>>>> refs/remotes/euum/kms_dev



		
		// 02. 저장할 파일 이름 지정
		String fileDate = getFolder() + "/";

		for (MultipartFile multipartFile : uploadFile) {
			String uploadFileName = multipartFile.getOriginalFilename();

			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("/") + 1); // IE의 경로 설정을 위한 부분

			UUID uuid = UUID.randomUUID(); // 파일 이름 중복 방지를 위한 uuid 생성
			uploadFileName = uuid.toString() + "_" + uploadFileName;

			log.info("---------- 02. 저장할 파일 이름 지정 ----------");
			log.info("업로드된 파일 이름: " + multipartFile.getOriginalFilename());
			log.info("저장할 폴더 경로: " + uploadPath);
			log.info("저장할 파일 이름: " + uploadFileName);
			log.info("파일 최종 경로: " + uploadPath + uploadFileName);

			
			// 03. 이미지 테이블에 저장할 데이터 세팅
			String fileName = uploadFileName;

			ImageBean imageBean = new ImageBean();

			imageBean.setImageFileName(fileName);
			imageBean.setImageUploadPath(fileDate);
			imageBean.setImageUUID(uuid.toString());
			imageBean.setImageUse(fileUse);
			log.info("---------- 03. 이미지 테이블에 저장할 데이터 세팅 ----------");
			log.info("imageFileName: " + fileName);
			log.info("imageUploadPath: " + fileDate);
			log.info("imageUUID " + uuid.toString());
			log.info("imageUse: " + fileUse);
			// imageBean.setImageUseNum(); -> 각 기능마다 각자의 Controller에서 글번호 삽입
			// ex) 상품 등록 시 첨부한 이미지파일인 경우 GoodsController에서 imageBean.setImageUseNum(goodsNum);

			
			// 04. 세팅된 정보를 바탕으로 파일을 서버에 생성
			log.info("---------- 04. 업로드된 파일을 서버에 생성 ----------");
			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile); // 업로드된 파일이 서버 내에 실제로 생성 되는 지점

				if (checkImageType(saveFile)) { // contentType이 image인지 검사
					// 썸네일 생성
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 160, 160);
					thumbnail.close();

					// 파일타입을 i로 지정
					imageBean.setImageFileType("i");
				}
			} catch (Exception e) {
				log.error(e.getMessage());
			}

			imageBeanList.add(imageBean);
		} // for
		
		
		// 05. 이미지 테이블에 저장할 데이터를 List로 반환
		log.info("---------- 05. 이미지 테이블에 저장할 데이터를 List로 반환 ----------");
		return imageBeanList;
	}

	/** 선민: 오늘날짜(년/월/일)의 경로를 문자열로 생성 (경로 구분자: /) */
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);

//		return str.replace("-", File.separator);  (경로 구분자: \)
		return str.replace("-", "/");
	}

	/** 선민: 업로드된 파일이 이미지 타입인지 검사 */
	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			log.info("업로드된 파일 ContentType: " + contentType);
			return contentType.startsWith("image");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}

}