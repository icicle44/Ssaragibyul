package com.ssaragibyul.history.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.common.Search;
import com.ssaragibyul.history.domain.History;
import com.ssaragibyul.history.service.HistoryService;
import com.ssaragibyul.independence.domain.Pagination;

@Controller
public class HistoryController {
	
	@Autowired
	private HistoryService hService;

	@RequestMapping(value="historyList.do", method=RequestMethod.GET)
	public ModelAndView historyListView(ModelAndView mv, @RequestParam(value="page", required=false) Integer page) {
		int currentPage = (page != null) ? page : 1;
		int listCount =hService.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount); 
		ArrayList<History> hList = hService.printAll(pi);

		if(!hList.isEmpty()) {
			mv.addObject("hList", hList);
			mv.addObject("pi", pi);
			mv.setViewName("history/historyList");
		}else {
			mv.addObject("msg", "데이터 조회 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	// 스크롤 페이징
	@RequestMapping(value="historyScroll.do", method=RequestMethod.GET)
	public void historyScroll(HttpServletResponse response, @RequestParam("historyNo") int historyNo) throws Exception{
		Integer historyNoToStart = historyNo;
		int lastNo = checkLastNo();
		List<History> addList = hService.printScroll(historyNoToStart);
		Gson gson = new GsonBuilder().create();
		gson.toJson(addList, response.getWriter());
	}
	public Integer checkLastNo() {
		Integer result = 0;
		result = hService.printLastNo();
		System.out.println("result : " + result);
		return result;
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
	public int getVisitor(int siteNo) {
		
		return 0;
	}
}
