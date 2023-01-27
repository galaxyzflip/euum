package com.mycom.euum.comment.mapper;

import java.util.List;

import com.mycom.euum.comment.bean.CommentBean;


public interface CommentMapper {
	
	public void goodsCommentInsert(CommentBean commentBean);
	
	public List<CommentBean> selectGqnaComment(int goodsQNANum);

}
