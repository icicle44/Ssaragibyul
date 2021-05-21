package com.ssaragibyul.independence.controller;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.common.Pagination;
import com.ssaragibyul.common.Search;
import com.ssaragibyul.independence.domain.Independence;
import com.ssaragibyul.independence.service.IndependenceService;


@Controller
public class IndependenceController {

	@Autowired
	private IndependenceService iService;

	@RequestMapping(value="independenceList.do", method=RequestMethod.GET)
	public ModelAndView independenceList(ModelAndView mv, @RequestParam(value="page", required=false) Integer page) {
		int currentPage = (page != null) ? page : 1;
		int listCount =iService.getListCount();
		// Pagination은 common의 pagination
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount); 
		ArrayList<Independence> iList = iService.printAll(pi);
		if(!iList.isEmpty()) {
			mv.addObject("iList", iList);
			mv.addObject("pi", pi);
			mv.setViewName("independence/independenceList");
		}else {
			mv.addObject("msg", "데이터 조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
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
