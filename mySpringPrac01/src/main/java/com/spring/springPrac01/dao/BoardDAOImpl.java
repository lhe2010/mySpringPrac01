package com.spring.springPrac01.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.springPrac01.dto.BoardDTO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Inject
	private SqlSession session;

	@Override
	public void makeDummyData(List<BoardDTO> dummyDataList) throws Exception {
		session.insert("com.spring.mapper.BoardMapper.makeDummyData", dummyDataList);
	}

	@Override
	public List<BoardDTO> getAllBoard() throws Exception {
		return session.selectList("com.spring.mapper.BoardMapper.getAllBoard");
	}

	@Override
	public void insertBoard(BoardDTO bdto) throws Exception {
		session.insert("com.spring.mapper.BoardMapper.insertBoard", bdto);		
	}
}
