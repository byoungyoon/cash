package kr.co.gdu.cash.restmapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Cashbook;

@Mapper
public interface CashbookRestMapper {
	Map<String, Object> selectYearChartToIn(int year);
	Map<String, Object> selectYearChartToOut(int year);
	List<Cashbook> selectTopMonthChartToIn(Map<String, Object> map);
	List<Cashbook> selectTopMonthChartToOut(Map<String, Object> map);
	List<Cashbook> selectLowerMonthChartToIn(Map<String, Object> map);
	List<Cashbook> selectLowerMonthChartToOut(Map<String, Object> map);
}
