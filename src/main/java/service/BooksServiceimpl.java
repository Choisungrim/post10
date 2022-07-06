package service;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapperInterface.BooksMapper;
import vo.BooksVO;
@Service
public class BooksServiceimpl implements BooksService {
	
	@Autowired
	BooksMapper mapper;
	
	@Override
	public BooksVO selectOne(BooksVO vo) {
		// TODO Auto-generated method stub
		return mapper.selectOne(vo);
	}
	
	@Override
	public List<BooksVO> allList() {
		// TODO Auto-generated method stub
		return mapper.allList();
	}
	
	@Override
	public int insert(BooksVO vo) {
		return mapper.insert(vo);
	}
}
