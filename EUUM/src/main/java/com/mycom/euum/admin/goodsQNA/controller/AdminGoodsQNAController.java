package com.mycom.euum.admin.goodsQNA.controller;

import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycom.euum.admin.goodsQNA.service.AdminGoodsQNAService;
import com.mycom.euum.goodsQNA.bean.GoodsQNABean;
import com.mycom.euum.goodsQNA.service.GoodsQNAService;
import com.mycom.euum.image.bean.ImageBean;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class AdminGoodsQNAController {
	
	private AdminGoodsQNAService adminGoodsQNAService;
    private GoodsQNAService goodsQNAService;
	
	@RequestMapping("admin/goodsQNAList")
	public String opengoodsQNA(Model model){
		
		model.addAttribute("list", adminGoodsQNAService.getAdminGQNAList()); 
		
		System.out.println("gqna뭐 가져옴??????????????/" + adminGoodsQNAService.getAdminGQNAList()); 

		return "admin/goodsQNA/adminGoodsQNAList";
	}
	
	  @PostMapping("/deleteAdminGqna") 
	  public String deleteGqna(GoodsQNABean goodsQNABean) {
	  
	  goodsQNAService.deleteGQNA(goodsQNABean);
	  
	  return "redirect:admin/goodsQNAList"; 
	  }
	 
	
	@PostMapping("/cancelGdelete")
	public String cancelGdelete(GoodsQNABean goodsQNABean) {

		adminGoodsQNAService.cancelGdelete(goodsQNABean);

		return "redirect:admin/goodsQNAList"; 
	}
	
	
	  @RequestMapping(value="/getQImageAjax", produces=MediaType.APPLICATION_JSON_VALUE)
	  public List<ImageBean> getQimgae(int goodsQNANum) {
	   
	  List<ImageBean> qImage = adminGoodsQNAService.getAdminQimage(goodsQNANum);
		  
	  return qImage;
			  
	  }
	 

}
