package kr.co.gdu.cash.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.mapper.CashbookMapper;
import kr.co.gdu.cash.mapper.NoticeMapper;
import kr.co.gdu.cash.vo.Notice;

@Service 
@Transactional
public class NoticeService {
	@Autowired private NoticeMapper noticeMapper;
	@Autowired private CashbookMapper cashbookMapper;
	
	public int getUpdateNoticeList(Notice notice) {
		return noticeMapper.updateNoticeList(notice);
	}
	
	public int getDeleteNoticeList(int noticeId) {
		return noticeMapper.deleteNoticeList(noticeId);
	}
	
	public int getInsertNoticeList(Notice notice) {
		return noticeMapper.insertNoticeList(notice);
	}
	
	public Notice getNoticeOneList(int noticeId) {
		return noticeMapper.selectNoticeOneList(noticeId);
	}
	 
	public Map<String, Object> getNoticeListByPage(int currentPage, int rowPerPage) {
		int lastPage = noticeMapper.selectNoticeCount();
		if(lastPage % rowPerPage == 0) {
			lastPage = lastPage / rowPerPage;
		} else {
			lastPage = lastPage / rowPerPage + 1;
		}
		
		if(currentPage < 1) {
			currentPage = 1;
		}
		
		if(currentPage > lastPage + 1) {
			currentPage = lastPage + 1;
		}
		
		Map<String, Object> returnMap = new HashMap<>();
		Map<String, Integer> map = new HashMap<>();
		map.put("beginRow", (currentPage-1)*rowPerPage);
		map.put("rowPerPage", rowPerPage);
		List<Notice> noticeList = noticeMapper.selectNoticeListByPage(map);
		
		returnMap.put("currentPage", currentPage);
		returnMap.put("noticeList", noticeList);
		returnMap.put("lastPage", lastPage);
		
		return returnMap;
	}
	
	// issue : noticeList....중복
	public Map<String, Object> getNoticeAndInOutList() { 
		List<Notice> noticeList = noticeMapper.selectLatestNoiceList();
		List<Map<String, Object>> inOutList = cashbookMapper.selectCashInOutList();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("noticeList", noticeList);
		map.put("inOutList", inOutList);
		return map;
	}
	
	public List<Notice> getNoticeList() {
		return noticeMapper.selectLatestNoiceList();
	}
}
