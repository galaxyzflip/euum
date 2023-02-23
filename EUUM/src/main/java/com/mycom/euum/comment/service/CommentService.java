package com.mycom.euum.comment.service;


import java.util.List;

import com.mycom.euum.comment.bean.CommentBean;
import com.mycom.euum.page.CCriteria;

public interface CommentService {
	
	public int commentInsert(CommentBean commentBean);
	
	public List<CommentBean> commentList(CCriteria ccri, int requestNum);
	
	public CommentBean commentRead(int commentNum);
	
	public int commentDelete(CommentBean commentBean);
	
	public int commentModify(CommentBean commentBean);

}

