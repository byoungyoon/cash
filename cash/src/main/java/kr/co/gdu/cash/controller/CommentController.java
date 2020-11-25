package kr.co.gdu.cash.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.gdu.cash.restservice.CommentService;
import kr.co.gdu.cash.vo.Comment;
import kr.co.gdu.cash.vo.Notice;

@Controller
public class CommentController {
	@Autowired CommentService commentService;
	
	@PostMapping("/admin/addCommentList")
	public String addCommentList(Comment comment) {
		commentService.getAddCommentList(comment);
		return "redirect:/admin/noticeOneList/" + comment.getNoticeId();
	}
	
	@GetMapping("/admin/deleteCommentList/{noticeId}/{commentId}")
	public String deleteCommentList(
			@PathVariable(name="noticeId") int noticeId
			,@PathVariable(name="commentId") int commentId) {
		commentService.getDeleteCommentList(commentId);
		
		return "redirect:/admin/noticeOneList/" + noticeId;
	}
}
