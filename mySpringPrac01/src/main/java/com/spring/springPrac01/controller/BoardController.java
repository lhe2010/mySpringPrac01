package com.spring.springPrac01.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.springPrac01.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main() {
//		return "redirect:boardList";
		return "redirect:SimpleBoardList";
	}
	
	@RequestMapping(value = "/SimpleBoardList", method = RequestMethod.GET)
	public String SimpleBoardList(Model model) throws Exception {
		model.addAttribute("boardList", boardService.getAllBoard());
		return "boardPrac01/bList";
	}
	
	@RequestMapping(value = "/makeDummyData")
	public String makeDummyData() throws Exception {
		boardService.makeDummyData();		
		return "redirect:SimpleBoardList";
	}
	
	
}
