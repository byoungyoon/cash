package kr.co.gdu.cash.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Guestbook;

@Mapper
public interface GuestbookMapper {
	List<Guestbook> selectGuestbookList(int currentPage, int limitPage);
	int selectGuestbookListCount();
	int insertGuestbookList(Guestbook guestbook);
}
