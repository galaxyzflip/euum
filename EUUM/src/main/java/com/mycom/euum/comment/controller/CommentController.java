package com.mycom.euum.comment.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.mycom.euum.comment.bean.CommentBean;
import com.mycom.euum.comment.service.CommentService;
import com.mycom.euum.page.CCriteria;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@RequestMapping("/comment/")
@RestController
@AllArgsConstructor
@Log4j
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	
	@PostMapping(value="/commentInsert", consumes ="application/json", produces= { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> commentInsert(@RequestBody CommentBean commentBean) {
		
		
		
		log.info("리뷰 등록합니다~~~");
		
		int insertCount = commentService.commentInsert(commentBean);
		
		log.info("리뷰 몇개 등록이냐============================"+insertCount);
		
		
		return insertCount== 1 ? new ResponseEntity<>("succes", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value = "/pages/{requestNum}/{page}", 
				produces= {MediaType.APPLICATION_ATOM_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<CommentBean>> commentList(
										@PathVariable("page") int page, @PathVariable("requestNum") int requestNum){
		
		log.info("리스트 보여주세요=================");
		CCriteria ccri = new CCriteria(page, 10);
		log.info(ccri);
		
		log.info("ddddddddddddddddddddd"+commentService.commentList(ccri, requestNum));
		
		return new ResponseEntity<>(commentService.commentList(ccri, requestNum), HttpStatus.OK);
	}
	
	@GetMapping(value="/{commentNum}", produces= {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<CommentBean> commentRead(@PathVariable("commentNum") int commentNum){
		
		log.info("몇번 읽어오나요>?????=============="+commentNum);
		
		return new ResponseEntity<>(commentService.commentRead(commentNum), HttpStatus.OK);
	}
	
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH}, 
			value="/commentModify/{commentNum}", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> commentModify(@RequestBody CommentBean commentBean, @PathVariable("commentNum") int commentNum){
		
		commentBean.setCommentNum(commentNum);
		
		log.info("댓글번호 입니다======================"+commentNum);
		log.info("수정이 받습니다.======================"+commentBean);
		
		return commentService.commentModify(commentBean)==1 
				? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH}, 
			value="/commentDelete/{commentNum}", consumes="application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> commentDelete(@RequestBody CommentBean commentBean, @PathVariable("commentNum") int commentNum){
		
		commentBean.setCommentNum(commentNum);
		
		log.info("댓글번호 입니다======================"+commentNum);
		log.info("삭제가 받습니다.======================"+commentBean);
		
		return commentService.commentDelete(commentBean)==1
				? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

}
