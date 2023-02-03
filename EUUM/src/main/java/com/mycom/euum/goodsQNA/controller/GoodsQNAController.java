package com.mycom.euum.goodsQNA.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.mycom.euum.goodsQNA.bean.GoodsQNABean;
import com.mycom.euum.goodsQNA.service.GoodsQNAService;
import com.mycom.euum.page.Criteria;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@AllArgsConstructor
public class GoodsQNAController {
	
	private GoodsQNAService goodsQNAService;
	
	
	/*
	 * @GetMapping("/goodsQNA/List") public String goodsQNAList(String goodsNum,
	 * Model model, HttpServletRequest request,Criteria cri) {
	 * 
	 * model.addAttribute("list" , goodsQNAService.goodsQNAList(goodsNum,cri));
	 * 
	 * 
	 * return "goodsQNA/goodsQNAList"; }
	 */

	@GetMapping("/goodsQNA/InsertForm")
	public String open(Model model, HttpServletRequest request) {
		
		model.addAttribute("goodsNum",request.getParameter("goodsNum"));
				
		log.info("================상품번호==============" + request.getParameter("goodsNum"));
		
		return "goodsQNA/goodsQNAInsertForm";
	}
	
	@PostMapping("/goodsQNA/InsertPro")
	public String goodsQNAInsert(GoodsQNABean goodsQNABean, HttpServletRequest request) {
		
		goodsQNAService.goodsQNAInsert(goodsQNABean);
		
		return "redirect:/goods/goodsDetail?goodsNum=" + request.getParameter("goodsNum");
	}
	
	@PostMapping("/goodsQNA/InsertComment")
	public String insertGoodsQNAComment(GoodsQNABean goodsQNABean, HttpServletRequest request) {
		
		goodsQNAService.insertGqnaComment(goodsQNABean);
		
		return "redirect:/goods/goodsDetail?goodsNum=" + request.getParameter("goodsNum");
	}
	
	
	
	
}
