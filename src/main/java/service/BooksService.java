package service;

import java.util.List;

import vo.BooksVO;


public interface BooksService {
	List<BooksVO> allList();
	BooksVO selectOne(BooksVO vo);
	public int insert(BooksVO vo);
}
