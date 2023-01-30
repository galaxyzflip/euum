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

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

/** 선민: 파일 업로드에 관련된 메소드를 모아놓은 Class */
@Service
@Log4j
public class FileUtils {

	/** 선민: 첨부파일 업로드 처리 (Form) */
	public List<String> fileUpload(MultipartFile[] uploadFile) {
		
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

		// 폴더 객체 생성
		File uploadPath = new File(uploadFolder, getFolder());
//		log.info("---------------------------------");
//		log.info("getFolder() 결과: " + getFolder());
//		log.info("업로드 경로 이름: " + uploadPath);

		// 해당 경로가 존재하는지 검사 후 존재하지 않으면 새로 생성
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs(); // 년월일의 폴더 생성
		}
		
		// 파일이 저장될 경로를 문자열로 생성하여 리스트의 인덱스 0번에 저장 
		String fileDate = getFolder() + "/"; 
		fileInfoList.add(fileDate);
		
		log.info("---------------------------------");
		log.info(fileInfoList);
		log.info(fileInfoList.get(0));
		
		for (MultipartFile multipartFile : uploadFile) {
			log.info("---------------------------------");
			log.info("업로드한 파일 이름: " + multipartFile.getOriginalFilename());
			log.info("파라미터 이름: " + multipartFile.getName());
			log.info("업로드 파일 크기: " + multipartFile.getSize());

			String uploadFileName = multipartFile.getOriginalFilename();

			// IE의 경로 설정을 위한 부분
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("/") + 1);

			// 파일 이름 중복 방지를 위한 uuid 생성
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			
			log.info("업로드 폴더 경로: " + uploadPath);
			log.info("업로드되는 파일 이름: " + uploadFileName);
			log.info("파일 최종 경로: " + uploadPath + uploadFileName);
			
			// DB에 삽입할 파일 저장명을 리스트에 저장
			String fileName = uploadFileName;
			fileInfoList.add(fileName);
			log.info("*** fileDate: " + fileDate);
			log.info("*** fileName: " + fileName);
			log.info("*** fileInfoList: " + fileInfoList);

			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile); // 업로드된 파일이 서버 내에 생성 되는 지점

				// contentType이 image인지 검사
				if (checkImageType(saveFile)) {
					// 썸네일 생성
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 160, 160);
					thumbnail.close();
				}
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		} // for
		return fileInfoList;
	}

	/** 선민: 오늘날짜(년월일)의 경로를 문자열로 생성 (경로 구분자: /) */
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);

//		return str.replace("-", File.separator); // (경로 구분자: \)
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