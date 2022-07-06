package mapperInterface;

import java.util.List;

import vo.BooksVO;

public interface BooksMapper {
	List<BooksVO> allList();
	BooksVO selectOne(BooksVO vo);
	public int insert(BooksVO vo);
}
