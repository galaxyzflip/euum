package com.mycom.euum.comment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.mycom.euum.comment.bean.CommentBean;
import com.mycom.euum.comment.service.CommentService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class CommentController {
	
	private CommentService commentService;
	
	@PostMapping("/comment/goodsQNAInsert")
	public String goodsCommentInsert(CommentBean commentBean) {
		
		 commentService.goodsCommentInsert(commentBean);
		 
		 return "redirect:/goodsQNA/List";
	}

}
