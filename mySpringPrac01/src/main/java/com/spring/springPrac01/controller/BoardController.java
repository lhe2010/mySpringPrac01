package com.spring.springPrac01.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@RequestMapping(value = "/boardInfo", method = RequestMethod.GET)
	public String boardInfo(@RequestParam("num") int num, Model model) throws Exception{
		model.addAttribute("bdto", boardService.getOneBoard(num));
		return "boardPrac01/bInfo";
	}
	@RequestMapping(value="/boardUpdate", method = RequestMethod.GET)
	public String boardWrite(@RequestParam("num") int num, Model model) throws Exception {
		model.addAttribute("bdto", boardService.getOneBoardNoIncrease(num));
		return "boardPrac01/bUpdate";
	}
	
	@RequestMapping(value="/boardUpdate", method = RequestMethod.POST)
	public String boardWrite(BoardDTO bdto, Model model) throws Exception{
		if(boardService.updateBoard(bdto)) 
			model.addAttribute("success", true);
		else
			model.addAttribute("success", false);
		return "boardPrac01/bUpdatePro";
	}
	
	@RequestMapping(value = "/boardDelete", method = RequestMethod.GET)
	public String boardDelete(@RequestParam("num")int num, Model model) throws Exception{
		model.addAttribute("bdto", boardService.getOneBoardNoIncrease(num));
		return "boardPrac01/bDelete";
	}
	
	@RequestMapping(value = "/boardDelete", method = RequestMethod.POST)
	public String boardDelete(BoardDTO bdto, Model model) throws Exception{
		if(boardService.deleteBoard(bdto))
			model.addAttribute("success", true);
		else
			model.addAttribute("success", false);
		return "boardPrac01/bDeletePro";
	}
}
