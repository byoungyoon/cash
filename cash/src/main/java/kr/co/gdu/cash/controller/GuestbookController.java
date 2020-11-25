package kr.co.gdu.cash.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.gdu.cash.restservice.GuestbookService;
import kr.co.gdu.cash.vo.Guestbook;

@Controller
public class GuestbookController {
	@Autowired GuestbookService guestbookSerivce;
	
	@GetMapping("/admin/guestbookList/{currentPage}")
	public String guestbookList(Model model,
			@PathVariable(name="currentPage") int currentPage) {
		
		int limitPage = 4;
		
		Map<String, Object> map = guestbookSerivce.getGuestbookList(currentPage, limitPage);
		
		int lastPage = (Integer)map.get("lastPage");
		List<Guestbook> guestbookList = (List)map.get("guestbookList");
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("guestbookList", guestbookList);
		
		return "guestbookList";
	}
	
	@GetMapping("/admin/addGuestbookList")
	public String addGuestbookList() {
		return "addGuestbookList";
	}
	
	@PostMapping("/admin/addGuestbookList")
	public String addGuestbookList(Guestbook guestbook) {
		guestbookSerivce.getAddGuestbookList(guestbook);
		return "redirect:/admin/guestbookList/" + 1;
	}
}
