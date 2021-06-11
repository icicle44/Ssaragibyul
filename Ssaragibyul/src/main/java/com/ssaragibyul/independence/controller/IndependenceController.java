package com.ssaragibyul.independence.controller;


import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.common.Search;
import com.ssaragibyul.independence.domain.Independence;
import com.ssaragibyul.independence.domain.Pagination;
import com.ssaragibyul.independence.service.IndependenceService;
import com.ssaragibyul.message.service.MessageService;
import com.ssaragibyul.visit.domain.Visit;


@Controller
public class IndependenceController {

	@Autowired
	private IndependenceService iService;
	@Autowired
	private MessageService mService;
	
	@RequestMapping(value="independenceList.do", method=RequestMethod.GET)
	public ModelAndView independenceList(ModelAndView mv, @RequestParam(value="page", required=false) Integer page) {
		int currentPage = (page != null) ? page : 1;
		int listCount =iService.getListCount();
		// Pagination은 common의 pagination
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount); 
		ArrayList<Independence> iList = iService.printAll(pi);
//		int msgNo = 1;
//		Message message = mService.printOne(msgNo);
//		
//		String userId = "userId";
//		String flag = "rec";
//		
//		HashMap<String, String> cntMap = new HashMap<String, String>();
//		cntMap.put("flag", flag);
//		cntMap.put("userId", userId);
//		
//		int msgCount = mService.getMsgListCount(cntMap);
		
		
		if(!iList.isEmpty()) {
			mv.addObject("iList", iList);
			mv.addObject("pi", pi);
//			mv.addObject("message", message);
//			mv.addObject("messageCount", msgCount);
			mv.setViewName("independence/independenceList");
		}else {
			mv.addObject("msg", "데이터 조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value="independenceSearch.do", method=RequestMethod.GET)
	public String independenceSearch(@RequestParam(value="page", required=false) Integer page, @ModelAttribute Search search, Model model) {
		int currentPage = (page != null) ? page : 1;
		int listCount =iService.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount); 
		ArrayList<Independence> searchList = iService.printSearchAll(search ,pi);
		System.out.println("searchList"+searchList);
		if(!searchList.isEmpty()) {
			model.addAttribute("iList", searchList);
			model.addAttribute("search",search);
			//model.addAttribute("pi",pi);
			return "independence/independenceList";
		}else {
			model.addAttribute("msg", "검색결과가 없습니다");
			return "common/errorPage";
		}
	}
}
