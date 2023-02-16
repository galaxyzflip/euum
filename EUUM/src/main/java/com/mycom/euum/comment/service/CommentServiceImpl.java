package com.mycom.euum.comment.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.mycom.euum.comment.bean.CommentBean;
import com.mycom.euum.comment.mapper.CommentMapper;
import com.mycom.euum.page.CCriteria;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class CommentServiceImpl implements CommentService{
    
	private CommentMapper commentMapper;

	@Override
	public int commentInsert(CommentBean commentBean) {
		// TODO Auto-generated method stub
		return commentMapper.commentInsert(commentBean);
	}

	@Override
	public List<CommentBean> commentList(CCriteria ccri, int commentOriginalNum) {
		// TODO Auto-generated method stub
		return commentMapper.commentList(ccri, commentOriginalNum);
	}

	@Override
	public CommentBean commentRead(int commentNum) {
		// TODO Auto-generated method stub
		return commentMapper.commentRead(commentNum);
	}

	@Override
	public int commentDelete(CommentBean commentBean) {
		// TODO Auto-generated method stub
		return commentMapper.commentDelete(commentBean);
	}

	@Override
	public int commentModify(CommentBean commentBean) {
		// TODO Auto-generated method stub
		return commentMapper.commentModify(commentBean);
	}
	
	

}
