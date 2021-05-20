package com.ssaragibyul.history.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ssaragibyul.common.Search;
import com.ssaragibyul.history.service.HistoryService;
import com.ssaragibyul.independence.service.IndependenceService;

@Controller
public class HistoryController {
	
	@Autowired
	private HistoryService hService;

	@RequestMapping(value="historyList.do", method=RequestMethod.GET)
	public ModelAndView historyListView(ModelAndView mv) {
		
		return mv;
	}
	@RequestMapping(value="historyDetail.do", method=RequestMethod.GET)
	public String historyDetail(@RequestParam("historyNo") int noticeNo, Model model) {
		return "";
	}
	
	@RequestMapping(value="historySearch.do", method=RequestMethod.GET)
	public String historySearch(@ModelAttribute Search search, Model model) {
		
		// 2개의 값을 하나에 담아서 보내는 방법
		// 1. Domain(VO) 클래스 이용
		// 2. HashMap 사용하기

		return "";
	}
}
