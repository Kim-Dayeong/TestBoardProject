package com.rryy.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.rryy.domain.BoardVO;
import com.rryy.domain.Criteria;
import com.rryy.domain.SearchCriteria;
import com.rryy.persistence.BoardDAO;

@Repository
public class BoardServicelmpl implements BoardService{
	
	@Inject
	private BoardDAO dao;
	
	@Override
	public void write(BoardVO vo) throws Exception {
		dao.write(vo);
		
	}
	
	@Override
	public BoardVO read(int bno) throws Exception {
		return dao.read(bno);
	}
	
	@Override
	public void update(BoardVO vo) throws Exception {
		dao.update(vo);
	}
	
	@Override
	public void delete(int bno) throws Exception{
		dao.delete(bno);
	}
	
	@Override
	//목록
	public List<BoardVO> list() throws Exception {
		return dao.list();
	}
	
	
	//목록 + 페이징 
	@Override 
	public List<BoardVO> listPage(Criteria cri) throws Exception {
		return dao.listPage(cri);
	}
	
	// 게시물 총 갯수 
	@Override
	public int listCount() throws Exception {
		return dao.listCount();
	}
	
	// 목록 + 페이징  + 검색 
	@Override
	public List<BoardVO> listSearch(SearchCriteria scri) throws Exception{
		return dao.listSearch(scri);
	}
	
	
	// 검색 결과 갯수 
	@Override
	public int countSearch(SearchCriteria scri) throws Exception{
		return dao.countSearch(scri);
	}
	
	
	
	

}
