package kr.co.gdu.cash.restservice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.mapper.GuestbookMapper;
import kr.co.gdu.cash.vo.Guestbook;

@Service
@Transactional
public class GuestbookService {
	@Autowired GuestbookMapper guestbookMapper;
	
	public Map<String, Object> getGuestbookList(int currentPage, int limitPage){
		Map<String, Object> map = new HashMap<String, Object>();
		
		int lastPage = guestbookMapper.selectGuestbookListCount();
		if(lastPage % limitPage == 0) {
			lastPage = lastPage / limitPage;
		} else {
			lastPage = lastPage / limitPage + 1;
		}
		
		List<Guestbook> guestbookList = guestbookMapper.selectGuestbookList(limitPage*(currentPage-1), limitPage);
		
		map.put("lastPage", lastPage);
		map.put("guestbookList", guestbookList);
		
		return map;
	}
	
	public void getAddGuestbookList(Guestbook guestbook) {
		guestbookMapper.insertGuestbookList(guestbook);
	}
}
