package com.mycom.euum.goodsQNA.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.mycom.euum.goodsQNA.bean.GoodsQNABean;
import com.mycom.euum.goodsQNA.service.GoodsQNAService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@AllArgsConstructor
public class GoodsQNAController {
	
	private GoodsQNAService goodsQNAService;
	
	
	@GetMapping("goodsQNA/List")
	public String goodsQNAList(Model model) {
		
		model.addAttribute("list" , goodsQNAService.goodsQNAList());

		 	
		return "goodsQNA/goodsQNAList";
	}

	@GetMapping("/goodsQNA/InsertForm")
	public String open(Model model) {
		
		return "goodsQNA/goodsQNAInsertForm";
	}
	
	@PostMapping("/goodsQNA/InsertPro")
	public String goodsQNAInsert(GoodsQNABean goodsQNABean) {
		
		goodsQNAService.goodsQNAInsert(goodsQNABean);
		
		return "redirect:/goodsQNA/List";
	}
	
	@PostMapping("/goodsQNA/InsertComment")
	public String insertGoodsQNAComment(GoodsQNABean goodsQNABean) {
		
		goodsQNAService.insertGqnaComment(goodsQNABean);
		
		return "redirect:/goodsQNA/List";
	}
	
	
	
	
}
