package kr.co.gdu.cash.restcontroller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import kr.co.gdu.cash.restservice.CashbookRestService;
import kr.co.gdu.cash.vo.Cashbook;

@RestController
public class CashbookRestController {
	@Autowired CashbookRestService cashbookRestService;
	
	@GetMapping("/admin/cashbookInChart/{year}")
	public Map<String, Object> yearChartToIn(@PathVariable(name="year") int year){
		return cashbookRestService.getYearChartToIn(year);
	}
	
	@GetMapping("/admin/cashbookOutChart/{year}")
	public Map<String, Object> yearChartToOut(@PathVariable(name="year") int year){
		return cashbookRestService.getYearChartToOut(year);
	}
	
	@GetMapping("/admin/cashbookTopMonthInChart/{year}/{month}")
	public List<Cashbook> topMonthChartToIn(
			@PathVariable(name="year") int year,
			@PathVariable(name="month") int month){
		return cashbookRestService.getTopMonthChartToIn(year, month);
	}
	
	@GetMapping("/admin/cashbookTopMonthOutChart/{year}/{month}")
	public List<Cashbook> topMonthChartToOut(
			@PathVariable(name="year") int year,
			@PathVariable(name="month") int month){
		
		System.out.println(year);
		System.out.println(month);
		
		return cashbookRestService.getTopMonthChartToOut(year, month);
	}
	
	@GetMapping("/admin/cashbookLowerMonthInChart/{year}/{month}")
	public List<Cashbook> lowerMonthChartToIn(
			@PathVariable(name="year") int year,
			@PathVariable(name="month") int month){
		return cashbookRestService.getLowerMonthChartToIn(year, month);
	}
	
	@GetMapping("/admin/cashbookLowerMonthOutChart/{year}/{month}")
	public List<Cashbook> lowerMonthChartToOut(
			@PathVariable(name="year") int year,
			@PathVariable(name="month") int month){
		
		System.out.println(year);
		System.out.println(month);
		
		return cashbookRestService.getLowerMonthChartToOut(year, month);
	}
}
