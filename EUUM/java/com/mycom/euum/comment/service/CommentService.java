package com.mycom.euum.comment.service;

import java.util.List;

import com.mycom.euum.comment.bean.CommentBean;

public interface CommentService {
	
	public void goodsCommentInsert(CommentBean commentBean);
	
	public List<CommentBean> selectGqnaComment(int goodsQNANum);

}
