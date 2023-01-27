package com.mycom.euum.comment.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mycom.euum.comment.bean.CommentBean;
import com.mycom.euum.comment.mapper.CommentMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class CommentServiceImpl implements CommentService{
    
	private CommentMapper commentMapper;
	
	@Override
	public void goodsCommentInsert(CommentBean commentBean) {
		
		commentMapper.goodsCommentInsert(commentBean);
	}

	@Override
	public List<CommentBean> selectGqnaComment(int goodsQNANum) {
	
		return commentMapper.selectGqnaComment(goodsQNANum);
	}


	
	

}
