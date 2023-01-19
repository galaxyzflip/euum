package com.mycom.euum.goods.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycom.euum.goods.bean.GoodsOptionBean;
import com.mycom.euum.goods.service.GoodsServiceImpl;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class GoodsController {

//	@Resource(name = "goodsService")
	private GoodsServiceImpl goodsService;

	/* --------------------------------------------------------------- */

	@RequestMapping(value = "/")
	public String test() {
		log.info("start");
		return "main_layout";
	}

	@RequestMapping(value = "/goods/goodsList")
	public String selectGoodsList() throws Exception {
		log.info("===== 테스트 =====");
		log.info(goodsService.selectGoodsList());
		return "goods/goodsList";
	}
	
	@RequestMapping(value = "/goods/goodsRegisterGuide")
	public String goodsRegisterGuide() throws Exception {
		log.info("===== 상품 등록 가이드 =====");
		return "goods/goodsRegisterGuide";
	}
	
	

	@GetMapping(value = "/goods/goodsDetail")
	public String goodsDetail(Model model, String goodsNum) throws Exception {
		log.info("===== 상품 상세보기 =====");
		int optionCount = goodsService.selectGoodsOptionCount(goodsNum);
		List<List<GoodsOptionBean>> optionList = new ArrayList<List<GoodsOptionBean>>();
		log.info("옵션의 개수 == " + optionCount);
		
		// 선민: 상품의 옵션 세부항목이 존재하지 않는다는 것은 상품 자체가 존재하지 않는 것을 의미하므로 상품 리스트로 return
		if (optionCount == 0) {
			return "goods/goodsList";
		}

//		for (int i = 1; i <= optionCount; i++) {
//			List<GoodsOptionBean> list = goodsService.selectGoodsOptionContent(goodsNum, Integer.toString(i));
//			log.info(i + "번째 옵션의 선택항목 == " + list);
//			model.addAttribute("detailOption_" + Integer.toString(i), list);
//		}
		for (int i = 1; i <= optionCount; i++) {
			List<GoodsOptionBean> list = goodsService.selectGoodsOptionContent(goodsNum, Integer.toString(i));
			log.info(i + "번째 옵션의 선택항목 == " + list);
			optionList.add(list);
		}

		model.addAttribute("detail", goodsService.selectGoodsInfo(goodsNum));
		model.addAttribute("optionList", optionList);
		model.addAttribute("optionCount", optionCount);
		
		return "goods/goodsDetail";
	}

}
