package com.mycom.euum.comment.controller;

import lombok.extern.log4j.Log4j;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.mycom.euum.comment.bean.CommentBean;
import com.mycom.euum.comment.service.CommentService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@Log4j
public class CommentController {
	
	private CommentService commentService;
	
	@PostMapping("/comment/commentInsert")
	public String commentInsert(CommentBean commentBean) {
		
		commentService.commentInsert(commentBean);
		
		log.info("리뷰 등록합니다~~~");
		
		return "comment/commentList";
	}

}
