package com.spring.springPrac01.dao;

import java.util.List;

import com.spring.springPrac01.dto.BoardDTO;

public interface BoardDAO {

	public void makeDummyData(List<BoardDTO> dummyDataList) throws Exception;
	public List<BoardDTO> getAllBoard() throws Exception;
}
