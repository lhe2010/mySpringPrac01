package com.spring.springPrac01.dao;

import java.util.List;

import com.spring.springPrac01.dto.BoardDTO;

public interface BoardDAO {

	public void makeDummyData(List<BoardDTO> dummyDataList) throws Exception;
	public List<BoardDTO> getAllBoard() throws Exception;
	public void insertBoard(BoardDTO bdto) throws Exception;
	public BoardDTO getOneBoard(int num) throws Exception;
	public void increaseReadCount(int num) throws Exception;
	public void updateBoard(BoardDTO bdto) throws Exception;
	public BoardDTO validateUserCheck(BoardDTO bdto) throws Exception;
	public void deleteBoard(BoardDTO bdto) throws Exception;
}
