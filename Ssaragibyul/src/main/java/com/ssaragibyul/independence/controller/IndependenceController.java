package com.ssaragibyul.independence.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssaragibyul.common.Search;
import com.ssaragibyul.independence.service.IndependenceService;

@Controller
public class IndependenceController {

	@Autowired
	private IndependenceService nService;

	@RequestMapping(value="independenceList.do", method=RequestMethod.GET)
	public String independenceList() {
		
		return "independence/independenceList";
	}
	
	@RequestMapping(value="independenceDetail.do", method=RequestMethod.GET)
	public String independenceDetail(@RequestParam("independenceNo") int independenceNo, Model model) {
		return "";
	}
	
	@RequestMapping(value="independenceSearch.do", method=RequestMethod.GET)
	public String independenceSearch(@ModelAttribute Search search, Model model) {
		
		// 2개의 값을 하나에 담아서 보내는 방법
		// 1. Domain(VO) 클래스 이용
		// 2. HashMap 사용하기

		return "";
	}
}
