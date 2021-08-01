package com.spring.springPrac01.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.springPrac01.dto.BoardDTO;
import com.spring.springPrac01.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main() {
//		return "redirect:boardList";
		return "redirect:simpleBoardList";
	}
	
	@RequestMapping(value = "/simpleBoardList", method = RequestMethod.GET)
	public String simpleBoardList(Model model) throws Exception {
		model.addAttribute("boardList", boardService.getAllBoard());
		return "boardPrac01/bList";
	}
	
	@RequestMapping(value = "/makeDummyData")
	public String makeDummyData() throws Exception {
		boardService.makeDummyData();		
		return "redirect:SimpleBoardList";
	}
	
	@RequestMapping(value = "/boardWrite", method = RequestMethod.GET)
	public String boardWrite() throws Exception {
		return "boardPrac01/bWrite";
	}
	
	@RequestMapping(value = "/boardWrite", method = RequestMethod.POST)
	public String boardWrite(Model model, BoardDTO bdto) throws Exception {
		boardService.insertBoard(bdto);
		return "redirect:simpleBoardList";
	}
	
}
