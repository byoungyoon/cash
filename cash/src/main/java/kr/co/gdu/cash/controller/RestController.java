package kr.co.gdu.cash.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RestController {
	
	@GetMapping("/admin/cashStats")
	public String cashStats() {
		return "cashStats.html";
	}
}
