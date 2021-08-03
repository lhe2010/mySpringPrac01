package com.spring.springPrac01.service;

import java.util.List;
import java.util.Map;

import com.spring.springPrac01.dto.BoardDTO;

public interface BoardService {

	public void makeDummyData() throws Exception;
	public List<BoardDTO> getAllBoard() throws Exception;
	public void insertBoard(BoardDTO bdto) throws Exception;
	public BoardDTO getOneBoard(int num) throws Exception;
	public boolean updateBoard(BoardDTO bdto) throws Exception;
	public BoardDTO getOneBoardNoIncrease (int num) throws Exception;
	public boolean deleteBoard(BoardDTO bdto) throws Exception;
	public void insertReplyBoard(BoardDTO bdto) throws Exception;
	public List<BoardDTO> getSearchBoard(Map<String, Object> searchInfo) throws Exception;
	
}
