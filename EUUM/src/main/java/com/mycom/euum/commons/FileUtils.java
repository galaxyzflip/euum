
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
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
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

		List<ImageBean> imageBeanList = new ArrayList<ImageBean>();
		
		// (1) 경로 및 폴더 생성
		String uploadFolderPath = request.getRealPath("") + "resources/img";
		log.info("---------- (1) 경로 및 폴더 생성 ----------");
		log.info("request.getRealPath(): " + request.getRealPath(""));
		log.info("uploadFolderPath: " + uploadFolderPath);

		File uploadPath = new File(uploadFolderPath, getFolder()); // 폴더 경로를 지정 및 생성할 File 객체 생성

		if (uploadPath.exists() == false) { // 해당 경로가 존재하는지 검사 후 존재하지 않으면 년/월/일의 폴더 신규 생성
			uploadPath.mkdirs(); //
		}

		// (2) 저장할 파일 이름 지정
		String fileDate = getFolder() + "/";

		for (MultipartFile multipartFile : uploadFile) {
			if (multipartFile.getOriginalFilename().equals("")) {
				log.info("---------- (2) 업로드 요청된 파일이 없음 ----------");
				ImageBean imageBean = new ImageBean();
				imageBean.setImageFileName("");
				imageBean.setImageUploadPath(fileDate);
				imageBeanList.add(imageBean);
				continue;
			}

			String uploadFileName = multipartFile.getOriginalFilename();
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("/") + 1); // IE의 경로 설정을 위한 부분

			log.info("---------- (2-1) 파일 이름 지정 ----------");
			UUID uuid = UUID.randomUUID(); // 파일 이름 중복 방지를 위한 uuid 생성
			uploadFileName = uuid.toString() + "_" + uploadFileName;

			log.info("업로드 요청된 파일 이름: " + multipartFile.getOriginalFilename());
			log.info("저장할 폴더 경로: " + uploadPath);
			log.info("저장할 이름: " + uploadFileName);
			log.info("파일 최종 경로: " + uploadPath + uploadFileName);

			// (2-2) 이미지 테이블에 저장할 데이터 세팅
			String fileName = uploadFileName;
			ImageBean imageBean = new ImageBean();

			imageBean.setImageFileName(fileName);
			imageBean.setImageUploadPath(fileDate);
			imageBean.setImageUUID(uuid.toString());
			imageBean.setImageUse(fileUse);
			log.info("---------- (2-2) 이미지 테이블에 저장할 데이터 세팅 ----------");
			log.info("imageFileName: " + fileName);
			log.info("imageUploadPath: " + fileDate);
			log.info("imageUUID " + uuid.toString());
			log.info("imageUse: " + fileUse);
			// imageBean.setImageUseNum(); -> 각 기능마다 각자의 Controller에서 글번호 삽입
			// ex) 상품 등록 시 첨부한 이미지파일인 경우 GoodsController에서
			// imageBean.setImageUseNum(goodsNum);

			// (2-3) 세팅된 정보를 바탕으로 파일을 서버에 생성
			log.info("---------- (2-3) 업로드된 파일을 서버 파일 디렉토리에 생성 ----------");
			try {
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile); // 업로드된 파일이 서버 내에 실제로 생성 되는 지점

				if (checkImageType(saveFile)) { // contentType이 image인지 검사
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName)); // 썸네일
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 160, 160);
					thumbnail.close();
					imageBean.setImageFileType("i"); // 파일타입을 i로 지정
				}else {
					imageBean.setImageFileType("f"); // 최창선 : 이미지 아닐 경우 f로 저장, 없으면 디비저장 에러
				}
			} catch (Exception e) {
				log.error(e.getMessage());
			}
			imageBeanList.add(imageBean);
		}

		// (3) 이미지 테이블에 저장할 데이터를 List로 반환
		log.info("---------- (3) 이미지 테이블에 저장할 데이터를 List에 담아 반환 ----------");
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

	/*
	 * ---------------------------- 각 기능단 fileUpload() ----------------------------
	 */

	/**
	 * 예시 입니다.
	 * 
	 * public List<ImageBean> ____FileUpload(MultipartFile[] uploadFile) throws
	 * Exception { HttpServletRequest request =
	 * ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
	 * List<ImageBean> imageBeanList = new ArrayList<ImageBean>(); imageBeanList =
	 * fileUpload(uploadFile, request, "____");
	 * 
	 * return imageBeanList; }
	 * 
	 */

	// 상품
	public List<ImageBean> goodsFileUpload(MultipartFile[] uploadFile) throws Exception {

		
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		

		List<ImageBean> imageBeanList = new ArrayList<ImageBean>();
		
		imageBeanList = fileUpload(uploadFile, request, "goods");

		return imageBeanList;
	}

	// 회원
	public List<ImageBean> memberFileUpload(MultipartFile[] uploadFile) throws Exception {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes())
				.getRequest();
		List<ImageBean> imageBeanList = new ArrayList<ImageBean>();
		imageBeanList = fileUpload(uploadFile, request, "member");

		return imageBeanList;
	}

	
	// 전문가
	public List<ImageBean> sellerFileUpload(MultipartFile[] uploadFile) throws Exception {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		List<ImageBean> imageBeanList = new ArrayList<ImageBean>();
		imageBeanList = fileUpload(uploadFile, request, "seller");
		
		return imageBeanList;
	}
	
	// 마이페이지
	public List<ImageBean> myPageFileUpload(MultipartFile[] uploadFile) throws Exception {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		List<ImageBean> imageBeanList = new ArrayList<ImageBean>();
		imageBeanList = fileUpload(uploadFile, request, "myPage");
		
		return imageBeanList;
	}
	

	// 리뷰
	public List<ImageBean> reviewFileUpload(MultipartFile[] uploadFile) throws Exception {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes())
				.getRequest();
		List<ImageBean> imageBeanList = new ArrayList<ImageBean>();
		imageBeanList = fileUpload(uploadFile, request, "review");

		return imageBeanList;
	}

	// 주문
	public List<ImageBean> orderFileUpload(MultipartFile[] uploadFile) throws Exception {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		List<ImageBean> imageBeanList = new ArrayList<ImageBean>();
		imageBeanList = fileUpload(uploadFile, request, "order");

		return imageBeanList;
	}
	
	// 공지사항
	public List<ImageBean> noticeFileUpload(MultipartFile[] uploadFile) throws Exception {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		List<ImageBean> imageBeanList = new ArrayList<ImageBean>();
		imageBeanList = fileUpload(uploadFile, request, "notice");
		
		return imageBeanList;
	}
	
	// QnA
	public List<ImageBean> qnaFileUpload(MultipartFile[] uploadFile) throws Exception {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		List<ImageBean> imageBeanList = new ArrayList<ImageBean>();
		imageBeanList = fileUpload(uploadFile, request, "qna");
		
		return imageBeanList;
	}
	
	// 상품 QnA
	public List<ImageBean> gQnaFileUpload(MultipartFile[] uploadFile) throws Exception {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		List<ImageBean> imageBeanList = new ArrayList<ImageBean>();
		imageBeanList = fileUpload(uploadFile, request, "gQna");
		
		return imageBeanList;
	}
	
	// request
	public List<ImageBean> requestFileUpload(MultipartFile[] uploadFile) throws Exception {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		List<ImageBean> imageBeanList = new ArrayList<ImageBean>();
		imageBeanList = fileUpload(uploadFile, request, "request");
		
		return imageBeanList;
	}
	



}