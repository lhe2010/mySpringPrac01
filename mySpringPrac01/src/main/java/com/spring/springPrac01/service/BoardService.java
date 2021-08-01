package com.spring.springPrac01.service;

import java.util.List;

import com.spring.springPrac01.dto.BoardDTO;

public interface BoardService {

	public void makeDummyData() throws Exception;
	public List<BoardDTO> getAllBoard() throws Exception;
	public void insertBoard(BoardDTO bdto) throws Exception;
}
