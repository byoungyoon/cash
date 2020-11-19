package kr.co.gdu.cash.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.gdu.cash.service.NoticeService;
import kr.co.gdu.cash.vo.Notice;

@Controller
public class NoticeController {
	@Autowired private NoticeService noticeService;
	// 공지 목록
	@GetMapping("/admin/noticeList")
	public String noticeList(Model model,
							@RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {
		
		int rowPerPage = 10;
		Map<String, Object> map = noticeService.getNoticeListByPage(currentPage, rowPerPage);
		List<Notice> noticeList = (List)map.get("noticeList");
		currentPage = (Integer)map.get("currentPage");
		int lastPage = (Integer)map.get("lastPage");
		
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);

		return "noticeList";
	}
	
	// 공지 입력 폼
	@GetMapping("/admin/addNoticeList")
	public String addNotice() {
		return "addNoticeList";
	}
	
	// 공지 입력 액션
	@PostMapping("/admin/addNoticeList")
	public String addNotice(Notice notice) {
		noticeService.getInsertNoticeList(notice);
		
		return "redirect:/admin/noticeList";
	}
	// 공지 상세 보기
	@GetMapping("/admin/noticeOneList/{noticeId}")
	public String noticeOne(Model model, 
			@PathVariable(name = "noticeId") int noticeId) {
		Notice notice = noticeService.getNoticeOneList(noticeId);
		model.addAttribute(notice);
		
		return "noticeOneList";
	}
	// 공지 삭제
	@GetMapping("/admin/deleteNoticeList/{noticeId}")
	public String deleteNoticeList(@PathVariable(name = "noticeId") int noticeId) {
		noticeService.getDeleteNoticeList(noticeId);
		return "redirect:/admin/noticeList";
	}
	
	// 공지 수정 폼
	@GetMapping("/admin/updateNoticeList/{noticeId}")
	public String updateNoticeList(Model model, 
			@PathVariable(name = "noticeId") int noticeId) {
		Notice notice = noticeService.getNoticeOneList(noticeId);
		model.addAttribute("notice", notice);
		
		return "updateNoticeList";
	}
	// 공지 수정 액션
	@PostMapping("admin/updateNoticeList")
	public String updateNoticeList(Notice notice) {
		noticeService.getUpdateNoticeList(notice);
		return "redirect:/admin/noticeOneList/" +notice.getNoticeId();
	}
}


















