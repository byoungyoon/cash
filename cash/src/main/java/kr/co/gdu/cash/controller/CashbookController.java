package kr.co.gdu.cash.controller;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.gdu.cash.service.CashbookService;
import kr.co.gdu.cash.service.CategoryService;
import kr.co.gdu.cash.vo.Cashbook;
import kr.co.gdu.cash.vo.Category;

@Controller
public class CashbookController {
	
	@Autowired private CashbookService cashbookService;
	@Autowired private CategoryService categoryService;
	
	@GetMapping("/admin/deleteCashbookList/{cashbookId}")
	public String deleteCashbookList(@PathVariable(name = "cashbookId") int cashbookId) {
		cashbookService.getDeleteCahsbookList(cashbookId);
		return "redirect:/admin/cashbookList/" + 1;
	}
	
	@PostMapping("/admin/updateCashbookList")
	public String updateCashbookList(Cashbook cashbook) {
		cashbookService.getUpdateCashbookList(cashbook);
		return "redirect:/admin/cashbookOneList/"+ cashbook.getCashbookId();
	}
	
	@GetMapping("/admin/updateCashbookList/{cashbookId}")
	public String updateCashbookList(Model model,
			@PathVariable(name = "cashbookId") int cashbookId) {
		Cashbook cashbook = cashbookService.getCashbookOneList(cashbookId);
		List<Category> categoryList = categoryService.getCategoryList();
		
		model.addAttribute("cashbook", cashbook);
		model.addAttribute("categoryList", categoryList);
		
		return "updateCashbookList";
	}
	
	@GetMapping("/admin/cashbookOneList/{cashbookId}")
	public String cashbookOneList(Model model,
			@PathVariable(name = "cashbookId") int cashbookId) {
		Cashbook cashbook = cashbookService.getCashbookOneList(cashbookId);
		model.addAttribute("cashbook", cashbook);
		
		return "cashbookOneList";
	}
	
	@GetMapping("/admin/cashbookList/{currentPage}")
	public String cashbookList(Model model,
			@PathVariable(name = "currentPage", required = true) int currentPage) {
		int rowPerPage = 10;
		int lastPage = cashbookService.getListCount(rowPerPage);
		
		if(currentPage < 1) {
			currentPage = 1;
		}
		if(currentPage > lastPage) {
			currentPage = lastPage;
		}
		
		List<Cashbook> cashbookList = cashbookService.getCashbookListByPage(currentPage, rowPerPage);
		System.out.println(currentPage);
		System.out.println(lastPage);
		model.addAttribute("cashbookList",cashbookList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		return "cashbookList";
	}
	
	
	@PostMapping("/admin/addCashbook")
	public String addCashbook(Cashbook cashbook,
			@RequestParam(name = "currentYear", required = true) int currentYear,
			@RequestParam(name = "currentMonth", required = true) int currentMonth,
			@RequestParam(name = "currentDay", required = true) int currentDay) { // 커맨드객체
		System.out.println(cashbook);
		cashbookService.addCashbook(cashbook);
		return "redirect:/admin/cashbookByDay/now/"+ currentYear+"/"+currentMonth+"/"+currentDay; 
	}
	
	@GetMapping("/admin/addCashbook")
	public String addCashbook(Model model,
			@RequestParam(name = "currentYear", required = true) int currentYear,
			@RequestParam(name = "currentMonth", required = true) int currentMonth,
			@RequestParam(name = "currentDay", required = true) int currentDay) {
		List<Category> categoryList = categoryService.getCategoryList();
		
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("currentYear", currentYear);
		model.addAttribute("currentMonth", currentMonth);
		model.addAttribute("currentDay", currentDay);
		return "addCashbook"; // forward
	}
	
	@GetMapping("/admin/cashbookByDay/{target}/{currentYear}/{currentMonth}/{currentDay}")
	public String cashbookByDay(Model model,
								@PathVariable(name = "target") String target,
								@PathVariable(name = "currentYear", required = true) int currentYear,
								@PathVariable(name = "currentMonth", required = true) int currentMonth,
								@PathVariable(name = "currentDay", required = true) int currentDay) {
		Calendar targetDay = Calendar.getInstance();
		targetDay.set(Calendar.YEAR, currentYear);
		targetDay.set(Calendar.MONTH, currentMonth-1);
		targetDay.set(Calendar.DATE, currentDay);
		if(target.equals("pre")) {
			targetDay.add(Calendar.DATE, -1);
		} else if(target.equals("next")) {
			targetDay.add(Calendar.DATE, 1);
		}
		
		List<Cashbook> cashbookList = cashbookService.getCashbookListByDay(
											targetDay.get(Calendar.YEAR), 
											targetDay.get(Calendar.MONTH)+1, 
											targetDay.get(Calendar.DATE));	
		model.addAttribute("cashbookList", cashbookList);
		model.addAttribute("currentYear", targetDay.get(Calendar.YEAR));
		model.addAttribute("currentMonth", targetDay.get(Calendar.MONTH)+1);
		model.addAttribute("currentDay", targetDay.get(Calendar.DATE));
		return "cashbookByDay";
	}
	
	@GetMapping(value="/admin/cashbookByMonth")
	public String cashbookByMonth(Model model,
			@RequestParam(name = "currentYear", defaultValue = "-1") int currentYear,
			@RequestParam(name = "currentMonth", defaultValue = "-1") int currentMonth) { 
		// 1-1. 요청분석
		Calendar currentDay = Calendar.getInstance(); // 2020년 11월 2일
		// currentYear 넘어오고, currentMonth도 넘어면
		if(currentYear != -1 && currentMonth != -1) {
			if(currentMonth == 0) {
				currentYear -= 1;
				currentMonth = 12;
			}
			if(currentMonth == 13) {
				currentYear += 1;
				currentMonth = 1;
			}
			currentDay.set(Calendar.YEAR, currentYear);
			currentDay.set(Calendar.MONTH, currentMonth-1);
		}
		currentDay.set(Calendar.DATE, 1); // 2020년 11월 1일
		
		currentYear = currentDay.get(Calendar.YEAR);
		currentMonth = currentDay.get(Calendar.MONTH) + 1;
		int lastDay = currentDay.getActualMaximum(Calendar.DATE);
		int firstDayOfWeek = currentDay.get(Calendar.DAY_OF_WEEK);
		// -----------------------------------------------------------------------------
		int sumIn = cashbookService.getSumCashbookPriceByInOut("수입", currentYear, currentMonth);
		int sumOut = cashbookService.getSumCashbookPriceByInOut("지출", currentYear, currentMonth);
		
		// -----------------------------------------------------------------------------
		List<Map<String, Object>> cashList = cashbookService.getCashListByMonth(currentYear, currentMonth);
		// -------------------------------------------------------------------------------
		
		// 3. 뷰 모델 추가
		model.addAttribute("currentYear", currentYear); // 년
		model.addAttribute("currentMonth", currentMonth); // 월
		model.addAttribute("lastDay", lastDay); // 마지막 일
		model.addAttribute("firstDayOfWeek", firstDayOfWeek); // 1일의 요일
		
		model.addAttribute("sumIn", sumIn);
		model.addAttribute("sumOut", sumOut);
		
		model.addAttribute("cashList", cashList);
		
		return "cashbookByMonth";
	}
	
	@GetMapping(value="/admin/cashbookYearChart")
	public String cashbookChart(Model model,
			@RequestParam(name = "currentYear", defaultValue = "-1") int currentYear) { 

		Calendar currentDay = Calendar.getInstance(); 
		if(currentYear != -1) {
			currentDay.set(Calendar.YEAR, currentYear);
		}
		currentDay.set(Calendar.DATE, 1);
		
		currentYear = currentDay.get(Calendar.YEAR);

		model.addAttribute("currentYear", currentYear); 

		return "cashbookYearChart";
	}
	
	@GetMapping(value="/admin/cashbookTopMonthChart")
	public String cashbookTopMonthChart(Model model,
			@RequestParam(name = "currentYear", defaultValue = "-1") int currentYear,
			@RequestParam(name = "currentMonth", defaultValue = "-1") int currentMonth) { 

		Calendar currentDay = Calendar.getInstance(); 

		if(currentYear != -1 && currentMonth != -1) {
			if(currentMonth == 0) {
				currentYear -= 1;
				currentMonth = 12;
			}
			if(currentMonth == 13) {
				currentYear += 1;
				currentMonth = 1;
			}
			currentDay.set(Calendar.YEAR, currentYear);
			currentDay.set(Calendar.MONTH, currentMonth-1);
		}
		currentDay.set(Calendar.DATE, 1); 
		
		currentYear = currentDay.get(Calendar.YEAR);
		currentMonth = currentDay.get(Calendar.MONTH) + 1;

		model.addAttribute("currentYear", currentYear); 
		model.addAttribute("currentMonth", currentMonth); 

		return "cashbookTopMonthChart";
	}
	
	@GetMapping(value="/admin/cashbookLowerMonthChart")
	public String cashbookLowerMonthChart(Model model,
			@RequestParam(name = "currentYear", defaultValue = "-1") int currentYear,
			@RequestParam(name = "currentMonth", defaultValue = "-1") int currentMonth) { 

		Calendar currentDay = Calendar.getInstance(); 

		if(currentYear != -1 && currentMonth != -1) {
			if(currentMonth == 0) {
				currentYear -= 1;
				currentMonth = 12;
			}
			if(currentMonth == 13) {
				currentYear += 1;
				currentMonth = 1;
			}
			currentDay.set(Calendar.YEAR, currentYear);
			currentDay.set(Calendar.MONTH, currentMonth-1);
		}
		currentDay.set(Calendar.DATE, 1); 
		
		currentYear = currentDay.get(Calendar.YEAR);
		currentMonth = currentDay.get(Calendar.MONTH) + 1;

		model.addAttribute("currentYear", currentYear); 
		model.addAttribute("currentMonth", currentMonth); 

		return "cashbookLowerMonthChart";
	}
}