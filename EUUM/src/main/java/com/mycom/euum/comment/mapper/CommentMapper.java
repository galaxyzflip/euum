package com.mycom.euum.comment.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mycom.euum.comment.bean.CommentBean;
import com.mycom.euum.page.CCriteria;
import com.mycom.euum.page.Criteria;


public interface CommentMapper {
	
	public int commentInsert(CommentBean commentBean);
	
	public List<CommentBean> commentList(@Param("ccri") CCriteria ccri, @Param("requestNum") int requestNum);
	
	public CommentBean commentRead(int commentNum);
	
	public int commentDelete(CommentBean commentBean);
	
	public int commentModify(CommentBean commentBean);
	
	
	
	
}
