package com.spring.springPrac01.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		return "redirect:boardList";
//		return "redirect:simpleBoardList";
	}
	
	@RequestMapping(value = "/boardList")
	public String boardList(@RequestParam(name = "onePageViewCount", defaultValue = "10") int onePageViewCount,
							@RequestParam(name = "currentPageNumber" , defaultValue = "1") int currentPageNumber,
							@RequestParam(name = "searchKeyword", defaultValue = "total") String searchKeyword,
							@RequestParam(name = "searchWord", defaultValue = "") String searchWord,
							Model model) throws Exception {
		
		// 페이지 시작 게시글 인덱스
		int startBoardIdx = (currentPageNumber - 1) * onePageViewCount;
		
		Map<String, Object> searchInfo = new HashMap<String, Object>();
		searchInfo.put("onePageViewCount", onePageViewCount);
		searchInfo.put("startBoardIdx", startBoardIdx);
		searchInfo.put("searchKeyword", searchKeyword);
		searchInfo.put("searchWord", searchWord);
		List<BoardDTO> boardList = boardService.getSearchBoard(searchInfo);
		
		Map<String, String> searchCountInfo = new HashMap<String, String>();
		searchCountInfo.put("searchKeyword", searchKeyword);
		searchCountInfo.put("searchWord", searchWord);
		
		int totalBoardCount = boardService.getAllBoardCount(searchCountInfo);
		int addPage = totalBoardCount % onePageViewCount == 0? 0 : 1;
		int totalPageCount = totalBoardCount / onePageViewCount + addPage;
		
		int startPage = 1;
		if(currentPageNumber % 10 == 0)	
			startPage = (currentPageNumber / 10 - 1) * 10 + 1;
		else
			startPage = (currentPageNumber / 10) * 10 + 1;
		
		int endPage = startPage + 9;
		
		if(endPage > totalPageCount)
			endPage = totalPageCount;
		
		if(onePageViewCount > totalBoardCount) {
			startPage = 1;
			endPage = 0;
		}
		
		model.addAttribute("startPage" , startPage);
		model.addAttribute("endPage" , endPage);
		model.addAttribute("totalBoardCount" , totalBoardCount);
		model.addAttribute("onePageViewCount" , onePageViewCount);
		model.addAttribute("currentPageNumber" , currentPageNumber);
		model.addAttribute("searchKeyword" , searchKeyword);
		model.addAttribute("searchWord" , searchWord);
		model.addAttribute("boardList",boardList);	
		
		return "boardPrac01/bList";
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
		return "redirect:boardList";
	}
	
	@RequestMapping(value = "/boardInfo", method = RequestMethod.GET)
	public String boardInfo(@RequestParam("num") int num, Model model) throws Exception{
		model.addAttribute("bdto", boardService.getOneBoard(num));
		return "boardPrac01/bInfo";
	}
	@RequestMapping(value="/boardUpdate", method = RequestMethod.GET)
	public String boardUpdate(@RequestParam("num") int num, Model model) throws Exception {
		model.addAttribute("bdto", boardService.getOneBoardNoIncrease(num));
		return "boardPrac01/bUpdate";
	}
	
	@RequestMapping(value="/boardUpdate", method = RequestMethod.POST)
	public String boardUpdate(BoardDTO bdto, Model model) throws Exception{
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
	
	@RequestMapping(value = "/boardReplyWrite", method = RequestMethod.GET)
	public String boardReplyWrite(@RequestParam("num") int num, Model model) throws Exception{
		model.addAttribute("bdto", boardService.getOneBoardNoIncrease(num));
		return "boardPrac01/bReply";
	}
	
	@RequestMapping(value = "/boardReplyWrite", method = RequestMethod.POST)
	public String boardReplyWrite(Model model, BoardDTO bdto) throws Exception {
		boardService.insertReplyBoard(bdto);
		return "redirect:boardList";
	}
	
}
