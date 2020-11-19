package kr.co.gdu.cash.restservice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.swing.plaf.basic.BasicInternalFrameTitlePane.SystemMenuBar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.gdu.cash.restmapper.CashbookRestMapper;
import kr.co.gdu.cash.vo.Cashbook;

@Service
@Transactional
public class CashbookRestService {
	@Autowired CashbookRestMapper cashbookRestMapper;
	

	public Map<String, Object> getYearChartToIn(int year){
		return cashbookRestMapper.selectYearChartToIn(year);
	}
	

	public Map<String, Object> getYearChartToOut(int year){
		return cashbookRestMapper.selectYearChartToOut(year);
	}
	
	public List<Cashbook> getTopMonthChartToIn(int year, int month){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("year", year);
		map.put("month", month);	
		return cashbookRestMapper.selectTopMonthChartToIn(map);
	}
	
	public List<Cashbook> getTopMonthChartToOut(int year, int month){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("year", year);
		map.put("month", month);
		return cashbookRestMapper.selectTopMonthChartToOut(map);
	}
	
	public List<Cashbook> getLowerMonthChartToIn(int year, int month){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("year", year);
		map.put("month", month);	
		return cashbookRestMapper.selectLowerMonthChartToIn(map);
	}
	
	public List<Cashbook> getLowerMonthChartToOut(int year, int month){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("year", year);
		map.put("month", month);
		return cashbookRestMapper.selectLowerMonthChartToOut(map);
	}
}
