package com.spring.springPrac01.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.springPrac01.dao.BoardDAO;
import com.spring.springPrac01.dto.BoardDTO;

@Service
public class BoardServiceImpl implements BoardService {
	@Inject
	private BoardDAO boardDAO;

	@Override
	public void makeDummyData() throws Exception {
		Random ran = new Random();
		List<BoardDTO> dummyDataList = new ArrayList<>();
		
		String[] word = {"가","나","다","라","마","바","사","아","자","차","카","타","파","하"};
		BoardDTO tempDTO = null;
		
		for(int i=100; i<=300; i++) {
			
			String writer = "";     
			String email = "";      
			String subject = "";    
			String password = "1111";   
			String content = "";    
			
			for(int j = 0; j < 7; j++) {
				writer += word[ran.nextInt(word.length)];
				subject += word[ran.nextInt(word.length)];
				content += word[ran.nextInt(word.length)];
				if(j<4)
					email += word[ran.nextInt(word.length)];
			}
			email += "@naver.com";
			
			tempDTO = new BoardDTO();
			tempDTO.setNum(i);
			tempDTO.setWriter(writer);
			tempDTO.setEmail(email);
			tempDTO.setSubject(subject);
			tempDTO.setPassword(password);
			tempDTO.setRef(i);
			tempDTO.setReLevel(1);
			tempDTO.setReStep(1);
			tempDTO.setReadCount(0);
			tempDTO.setContent(content);
//			System.out.println(tempDTO);
			
			dummyDataList.add(tempDTO);
		}
		boardDAO.makeDummyData(dummyDataList);
	}

	@Override
	public List<BoardDTO> getAllBoard() throws Exception {
		return boardDAO.getAllBoard();
	}

	@Override
	public void insertBoard(BoardDTO bdto) throws Exception {
		boardDAO.insertBoard(bdto);		
	}

	@Override
	public BoardDTO getOneBoard(int num) throws Exception {
		boardDAO.increaseReadCount(num);
		return boardDAO.getOneBoard(num);
	}
}
