package kr.co.gdu.cash.restservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.mapper.CommentMapper;
import kr.co.gdu.cash.vo.Comment;

@Service
@Transactional
public class CommentService {
	@Autowired CommentMapper commentMapper;
	
	public void getAddCommentList(Comment comment) {
		commentMapper.insertCommentList(comment);
	}
	
	public List<Comment> getCommentList(int noticeId){
		return commentMapper.selectCommentList(noticeId);
	}
	
	public void getDeleteCommentList(int commentId) {
		commentMapper.deleteCommentList(commentId);
	}
	
	public int getCommentListCount(int noticeId) {
		return commentMapper.selectCommentListCount(noticeId);
	}
	
	public void getDeleteCommentListByNotice(int noticeId) {
		commentMapper.deleteCommentListByNotice(noticeId);
	}
}
