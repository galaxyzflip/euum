package com.mycom.euum.member.controller;


import java.util.ArrayList;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mycom.euum.commons.FileUtils;
import com.mycom.euum.image.bean.ImageBean;
import com.mycom.euum.image.service.ImageService;
import com.mycom.euum.member.bean.CartBean;
import com.mycom.euum.member.bean.MemberBean;
import com.mycom.euum.member.bean.SellerBean;
import com.mycom.euum.member.mapper.CartMapper;
import com.mycom.euum.member.service.MyPageService;
import com.mycom.euum.order.service.OrderService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@AllArgsConstructor
public class MyPageController {

	private CartMapper cartMapper;
	private MyPageService myPageService;
	ImageService imageService;
	OrderService orderService;
	private FileUtils fileUtils;

	// 굿즈리스트에서 insert or delete	
	@ResponseBody
	@GetMapping(value = "/myPage/ajaxCartCheck")
	public String CheckCart(@RequestParam("goodsNum") String goodsNum, @RequestParam("memberNum") String memberNum) {
		
		int check = myPageService.checkCart(Integer.parseInt(memberNum),Integer.parseInt(goodsNum));
		log.info("=================== check : " + check+" , check==0 : "+(check==0));

		if(check == 0) {
			cartMapper.addCart(Integer.parseInt(memberNum),Integer.parseInt(goodsNum));
			log.info("============== check true");
			return "Y";
		}else{
			cartMapper.deleteCart(Integer.parseInt(memberNum),Integer.parseInt(goodsNum));
			log.info("============== check flase");
			return "N";
		}
	}
	
	
	// 찜목록
	@GetMapping(value = "/myPage/sellerList")
	public String getCartList(HttpServletRequest request,Model model)throws Exception {
		log.info("==== 찜목록 ====");

		HttpSession session = request.getSession();
		log.info("==== session ====");
		MemberBean memberBean = (MemberBean)session.getAttribute("loginUser");
		log.info("cartBean : " + memberBean);
		int memberNum = memberBean.getMemberNum();
		log.info("memberNum: " + memberNum);

		log.info("==== 리스트 ====");
		List<CartBean> myCart = myPageService.getCartList(memberNum);
		log.info("리스트 : " + myCart);
		model.addAttribute("myCartList", myCart);

		return "myPage/sellerList";
	}

	// 마이페이지 리스트에서 삭제
	@GetMapping(value = "/myPage/delSellerList")
	public String deleteCart(HttpServletRequest request,@RequestParam("goodsNum") String goodsNum) {
		HttpSession session = request.getSession();
		MemberBean memberBean = (MemberBean)session.getAttribute("loginUser");
		int memberNum = memberBean.getMemberNum();

		log.info("memberNum ================== " + memberNum);
		log.info("굿즈넘 ================== " + goodsNum);
		myPageService.deleteCart(memberNum,Integer.parseInt(goodsNum));
		return "redirect:/myPage/sellerList";
	}

	// 회원정보 상세보기 겸 수정 창
	@GetMapping("/myPage/modifyForm")
	public String memberDetail(Model model, HttpServletRequest request) {

		HttpSession session = request.getSession();


		MemberBean loginUser = (MemberBean)session.getAttribute("loginUser");
		loginUser = myPageService.getMember(loginUser.getMemberNum());
		model.addAttribute("memberDetail", loginUser);
		log.info("------------------" + loginUser.toString());

		return "myPage/memberDetail";
	}

	
	
	 // 회원정보 휴대폰 번호 수정 처리
	  
	 @PostMapping("/myPage/modifyMobilePro") 
	 public String modifyMobile(MemberBean bean) {
	  
		myPageService.updateMobile(bean);
	  
		return "redirect:/myPage/modifyForm"; 
	 
	}	
	 

	// 회원정보 수정 처리
	@PostMapping("/myPage/modifyPro")
	public String modifyMember(MemberBean bean) {

		myPageService.updateMember(bean);

		return "redirect:/myPage/modifyForm";
	}

	// 비밀번호 변경 창
	@GetMapping("/myPage/modifyPassForm")
	public String modifyPassForm(Model model, HttpServletRequest request) {

		HttpSession session = request.getSession();


		MemberBean loginUser = (MemberBean)session.getAttribute("loginUser");
		loginUser = myPageService.getMember(loginUser.getMemberNum());
		model.addAttribute("member", loginUser);
		log.info("------------------" + loginUser.toString());

		return "myPage/modifyPass";
	}

	// 비밀번호 변경 처리
	@PostMapping("/myPage/modifyPassPro")
	public String modifyPassPro(MemberBean bean) {

		myPageService.updatePassword(bean);

		return "redirect:/myPage/modifyForm";
	}

	// 회원 탈퇴 창
	@GetMapping("/myPage/leaveForm")
	public String leaveForm(Model model, HttpServletRequest request) {

		HttpSession session = request.getSession();


		MemberBean loginUser = (MemberBean)session.getAttribute("loginUser");
		loginUser = myPageService.getMember(loginUser.getMemberNum());
		model.addAttribute("member", loginUser);
		log.info("------------------" + loginUser.toString());
		SellerBean seller = myPageService.getSeller(loginUser.getMemberNum());
		model.addAttribute("seller", seller);

		return "myPage/leaveMember";
	}

	// 회원 탈퇴 처리
	@PostMapping("/myPage/leavePro")
	public String leavePro(String memberNum, String sellerNum, HttpServletRequest request) {

		HttpSession session = request.getSession();

		myPageService.secessionMember(memberNum);
		myPageService.secessionSeller(sellerNum);

		session.invalidate();

		return "redirect:/main";


	}

	// 전문가 등급 회원으로 전환 처리
		@PostMapping("/myPage/transSeller")
		public String transSeller(MultipartFile[] uploadFile, HttpServletRequest request, SellerBean sellerBean, MemberBean memberBean, ImageBean imageBean) throws Exception {
			
			HttpSession session = request.getSession();
			
			MemberBean loginUser = (MemberBean)session.getAttribute("loginUser");
			
			myPageService.updateMemberClass(memberBean);
			loginUser.setMemberClass("S");
			session.setAttribute("S", loginUser.getMemberClass());
			myPageService.insertSeller(sellerBean, memberBean.getMemberName());
//			myPageService.insertSeller(sellerBean);

			int selectKeySellerNum = sellerBean.getSellerNum();
			imageService.insertSellerImage(selectKeySellerNum);
			log.info("----------------------------------------------" + selectKeySellerNum);
			
			int selectKeyMemberNum = sellerBean.getMemberNum();
			
			SellerBean loginSeller = myPageService.getSeller(selectKeyMemberNum);
			session.setAttribute("loginSeller", loginSeller);
			log.info("----------------------------------------------" + loginSeller);

			return "redirect:/myPage/modifyForm";
		}

	// 전문가 내 프로필 상세보기 겸 수정 창
	@GetMapping("/myPage/modifySellerForm")
	public String modifySellerInfo(MultipartFile[] uploadFile, Model model, HttpServletRequest request, SellerBean sellerBean) throws Exception {
		

		HttpSession session = request.getSession();

		MemberBean loginUser = (MemberBean)session.getAttribute("loginUser");
		loginUser = myPageService.getMember(loginUser.getMemberNum());
		model.addAttribute("member", loginUser);
		log.info("------------------" + loginUser.toString());
		SellerBean seller = myPageService.getSeller(loginUser.getMemberNum());
		model.addAttribute("seller", seller);

		ImageBean image = imageService.getSellerImage(seller.getSellerNum());

		
		String sellerOrder1 = orderService.selectSellerOrder1(seller.getSellerNum());
		String sellerOrder2 = orderService.selectSellerOrder2(seller.getSellerNum());
		String sellerOrder3 = orderService.selectSellerOrder3(seller.getSellerNum());
		String sellerOrder4 = orderService.selectSellerOrder4(seller.getSellerNum());
		String sellerOrder11 = orderService.selectSellerOrder11(seller.getSellerNum());
		String sellerOrder22 = orderService.selectSellerOrder22(seller.getSellerNum());
		String sellerOrder33 = orderService.selectSellerOrder33(seller.getSellerNum());
		String sellerOrder44 = orderService.selectSellerOrder44(seller.getSellerNum());
		
		model.addAttribute("image", image);
		model.addAttribute("sellerOrder1", sellerOrder1);
		model.addAttribute("sellerOrder2", sellerOrder2);
		model.addAttribute("sellerOrder3", sellerOrder3);
		model.addAttribute("sellerOrder4", sellerOrder4);
		model.addAttribute("sellerOrder11", sellerOrder11);
		model.addAttribute("sellerOrder22", sellerOrder22);
		model.addAttribute("sellerOrder33", sellerOrder33);
		model.addAttribute("sellerOrder44", sellerOrder44);
		

		return "myPage/sellerDetail";
	}

	// 전문가 프로필 수정 처리
	@PostMapping("/myPage/modifySellerPro")
	public String modifySellerInfoPro(SellerBean sellerBean, HttpServletRequest request) {


		log.info("---------------전문가 정보 수정-----------------");
		myPageService.updateSeller(sellerBean);

		return "redirect:/myPage/modifySellerForm";
	}

	// 전문가 프로필 이미지 업로드
	@PostMapping("/myPage/modifySellerFilePro")
	public String modifySellerFilePro(MultipartFile[] uploadFile, SellerBean sellerBean, HttpServletRequest request, Model model) throws Exception {

		log.info("---------------------------------");
		log.info("uploadFile: " + uploadFile);
		log.info("uploadFile: " + uploadFile.length);


		/* List<String> profile = new ArrayList<String>(); */
			

		/* profile = fileUtils.fileUpload(uploadFile); */

		log.info("---------------------------------");
		List<ImageBean> imageBeanList = fileUtils.sellerFileUpload(uploadFile);


		int selectKeySellerNum = sellerBean.getSellerNum();

		log.info("---------------이미지 삭제------------------");
		imageService.deleteImage(imageBeanList, selectKeySellerNum);

		log.info("---------------이미지 저장------------------");
		imageService.insertImage(imageBeanList, selectKeySellerNum);

		log.info("----------------------------------------" + imageBeanList);
		log.info("----------------------------------------" + sellerBean);

		myPageService.updateSellerFile(sellerBean, imageBeanList);
		model.addAttribute("image", imageBeanList);

		return "redirect:/myPage/modifySellerForm";
	}
}
