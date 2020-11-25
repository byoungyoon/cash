package kr.co.gdu.cash.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Comment;

@Mapper
public interface CommentMapper {
	int insertCommentList(Comment comment);
	List<Comment> selectCommentList(int noticeId);
	int deleteCommentList(int commentId);
	int deleteCommentListByNotice(int noticeId);
	int selectCommentListCount(int noticeId);
}
