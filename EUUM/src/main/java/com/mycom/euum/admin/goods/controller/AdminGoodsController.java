package com.mycom.euum.admin.goods.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.mycom.euum.admin.goods.service.AdminGoodsService;
import com.mycom.euum.goods.bean.GoodsBean;
import com.mycom.euum.goods.bean.GoodsOptionBean;
import com.mycom.euum.goods.service.GoodsService;
import com.mycom.euum.page.Criteria2;
import com.mycom.euum.page.PageDTO2;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class AdminGoodsController {

	private AdminGoodsService adminGoodsService;
	private GoodsService goodsService;

	/* ---------------------------- 상품 리스트 ---------------------------- */
	/** 은정: 관리자 상품 리스트 - 전체 상품 리스트(검색,정렬,페이징) */
	@GetMapping(value = "/admin/adminGoodsList")
	public String adminGoodsList(Model model, Criteria2 cri) throws Exception {
		log.info("===== 상품 리스트 =====");

		System.out.println("cri 내용 : " + cri.toString());
		System.out.println("cri 내용 : " + cri.toString());
		System.out.println("cri 내용 : " + cri.toString());
		System.out.println("cri 내용 : " + cri.toString());

		List<GoodsBean> goodsList = adminGoodsService.adminGoodsList(cri);
		log.info("상품 리스트: " + goodsList);
		model.addAttribute("goodsList", goodsList);

		// int total=goodsService.getTotal(cri);
		int total = adminGoodsService.getTotal(cri);

		model.addAttribute("pageMaker", new PageDTO2(cri, total));

		return "admin/goods/adminGoodsList";

	}

//	// 선민: 임시용 관리자 상품 리스트
//	@GetMapping("/admin/adminGoodsList")
//	public String adminGoodsList(Model model) throws Exception {
//		List<GoodsBean> list = goodsService.selectAdminGoodsList();
//		model.addAttribute("list", list);
//		log.info("관리자굿즈리스트ㅇㅇㅇㅇㅇ");
//		return "admin/goods/adminGoodsList";
//	}

	// 선민: 관리자 상품관리 팝업창
	@PostMapping("/admin/adminGoodsManager")
	public String adminGoodsManager(String goodsNum, Model model) throws Exception {
		log.info("goodsNum: " + goodsNum);
		GoodsBean goodsBean = goodsService.selectGoodsInfo(goodsNum);
		int optionCount = goodsService.selectGoodsOptionCount(goodsNum);
		log.info("옵션의 개수: " + optionCount);
		List<List<GoodsOptionBean>> optionList = goodsService.selectGoodsOptionContent(goodsNum, optionCount);

		model.addAttribute("goodsBean", goodsBean);
		model.addAttribute("optionList", optionList);
		model.addAttribute("optionCount", optionCount);

		return "admin/goods/adminGoodsManager";
	}

	// 선민: 관리자 상품상태 변경
	@PostMapping("/admin/goodsStatusModifyPro")
	public String goodsStatusModifyPro(String goodsNum, String goodsStatus, Model model) throws Exception {
		log.info("goodsNum: " + goodsNum);
		log.info("goodsStatus: " + goodsStatus);

		goodsService.updateAdminGoodsStatus(goodsNum, goodsStatus);
//		rttr.addFlashAttribute("goodsNum", goodsNum);  (RedirectAttributes rttr)

		return adminGoodsManager(goodsNum, model);
//		return "redirect:/admin/adminGoodsManager";
	}

}