package com.mycom.euum.comment.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mycom.euum.comment.bean.CommentBean;
import com.mycom.euum.page.Criteria;


public interface CommentMapper {
	
	public void goodsCommentInsert(CommentBean commentBean);
	
	public List<CommentBean> selectGqnaComment(int goodsQNANum);
	
	public int commentInsert(CommentBean commentBean);
	
	public CommentBean commentRead(int commentNum);
	
	public int commentDelete(CommentBean commentBean);
	
	public int commentModify(CommentBean commentBean);
	
	public List<CommentBean>commentListPaging(@Param("cri") Criteria cri, @Param("commentNum") int CommentNum);
}
