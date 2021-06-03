package com.ssaragibyul.point.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.donation.domain.DonationLog;
import com.ssaragibyul.funding.domain.FundingLog;
import com.ssaragibyul.member.domain.Member;
import com.ssaragibyul.message.domain.Message;
import com.ssaragibyul.message.domain.PaginationMsg;
import com.ssaragibyul.message.domain.SearchMsg;
import com.ssaragibyul.point.domain.MyPoint;
import com.ssaragibyul.point.domain.Point;
import com.ssaragibyul.point.domain.PointAndProject;
import com.ssaragibyul.point.domain.PointForChart;
import com.ssaragibyul.point.service.PointService;
import com.ssaragibyul.visit.domain.Visit;

@Controller
public class PointController {

	@Autowired
	private PointService pntService;
	
	//<insert>
	//결제정보 insert / 포인트 충전 insert (내가)
	//펀딩사용 insert(펀딩참여 메소드 내부에서 호출) (다른사람 메소드에서)
	//기부사용 insert(기부참여 메소드 내부에서 호출) (다른사람 메소드에서)
	//펀딩취소(상쇄) insert(펀딩참여 취소 메소드 내부에서 호출) (다른사람 메소드에서)
	//기부취소(상쇄) insert(펀딩참여 취소 메소드 내부에서 호출) (다른사람 메소드에서)
	//방문인증적립 insert (다른사람 메소드에서)
	//선물함 insert(해당쪽지번호 같이 insert) (내가)
	//선물받음 insert(해당쪽지번호 같이 insert) (내가)
	
	//충전하기 화면 이동
	@RequestMapping(value="chargePointView.do", method=RequestMethod.GET)
	public ModelAndView chargePointView(ModelAndView mv,
										HttpSession session) {
		//message: 공지외-receiverId, msgType / 공지-msgType
		if(session != null && (Member)session.getAttribute("loginUser") != null) {
			mv.setViewName("point/chargePointView");
		} else {
			mv.setViewName("member/login");
		}
		return mv;
	}
	
	//포인트내역 등록-충전용
	@ResponseBody
	@RequestMapping(value="chargePoint.do", method=RequestMethod.POST)
	public String chargePointRegister(@ModelAttribute Point point) {
		
		point.setEventCode(0);
		point.setVarType(0);
		int result = pntService.registerChargePoint(point);
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	//포인트 사용내역 출력(전체, 펀딩, 기부, 선물, 방문인증, 충전)
	@RequestMapping(value="pointList.do", method=RequestMethod.GET)
	public ModelAndView PointList(ModelAndView mv,
								HttpSession session,
								@RequestParam(value="page", required=false) Integer page) {
		if(session != null && (Member)session.getAttribute("loginUser") != null) {		
			String userId = ((Member)session.getAttribute("loginUser")).getUserId();
			int currentPage = (page != null)? page : 1;
			int listCount = pntService.getListCount(userId);
			PageInfo pi = PaginationMsg.getPageInfo(currentPage, listCount);
			ArrayList<PointAndProject> ppList = pntService.printAll(pi, userId);
			
			if(!ppList.isEmpty()) {
				mv.addObject("pointList", ppList);
				mv.addObject("flag", 9);
			}else {
				mv.addObject("tblMsg", "포인트 내역이 없습니다.");
				mv.addObject("flag", 9);
			}
			mv.addObject("pi", pi);
			mv.setViewName("point/pointListView");
		}else {
			mv.addObject("msg", "로그인이 필요합니다.");
			mv.setViewName("member/login");
		}
		return mv;
	}
	
	@RequestMapping(value="pointSearch.do", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView PointListSearch(HttpSession session,
								HttpServletResponse response,
								ModelAndView mv,
								@ModelAttribute SearchMsg search,
								@RequestParam(value="page", required=false) Integer page) throws JsonIOException, IOException {
		/* Gson gson = new Gson(); */
		if(session != null && (Member)session.getAttribute("loginUser") != null) {		
			String userId = ((Member)session.getAttribute("loginUser")).getUserId();
			search.setUserId(userId);
			int currentPage = (page != null)? page : 1;
			int listCount = pntService.getSearchListCount(search);
			PageInfo pi = PaginationMsg.getPageInfo(currentPage, listCount);
			ArrayList<PointAndProject> ppList = pntService.printSearchList(pi, search);
			
			if(!ppList.isEmpty()) {
					mv.addObject("pointList", ppList);
					mv.addObject("search", search);
					mv.addObject("flag", ppList.get(0).getEventCode());
				}else {
					mv.addObject("search", search);
					mv.addObject("tblMsg", "포인트 내역이 없습니다.");
					mv.addObject("flag", 9);
				}
				mv.addObject("pi", pi);
				mv.setViewName("point/pointListView");
			}else {
				mv.addObject("msg", "로그인이 필요합니다.");
				mv.setViewName("member/login");
			}
			return mv;
			
//			if(!ppList.isEmpty()) {
//				HashMap<String, Object> searchList = new HashMap<String, Object>();
//				searchList.put("pointList", ppList);
//				searchList.put("pi", pi);
//				gson.toJson(searchList, response.getWriter());
//			}else {
//				String tblMsg = "포인트 사용내역이 없습니다.";
//				gson.toJson(tblMsg, response.getWriter());
//			}
//		}else {
//			String msg = "로그인이 필요합니다.";
//			gson.toJson(msg, response.getWriter());
//		}
		
	}
	
	//로그인 시 상단표시: 로그인 메소드에서 호출하여 session에 같이 담기
	//펀딩/기부 참여하기 버튼 누를 때 최대금액 체크 기능
	//마이페이지 왼쪽, 포인트내역 페이지 왼쪽
	
	//잔여포인트 출력 //펀딩-기부 UNIONALL
	//조건 더 걸어서 정말 차감된것만 반영되게 해야함
	//펀딩은 목표금액<누적금액 조건 들어감/기부는 금액조건 안들어감!!! 주의!!!
	@ResponseBody
	@RequestMapping(value="myPoint.do", method= {RequestMethod.GET, RequestMethod.POST})
	public void getMyPoint(HttpSession session, HttpServletResponse response) throws JsonIOException, IOException {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getUserId();
		MyPoint myPoint = pntService.getMyPoint(userId);
		session.setAttribute("myPoint", myPoint);
		
		Gson gson = new Gson();
		gson.toJson(myPoint, response.getWriter());
	}
	
	@RequestMapping(value="pointChart.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView getPointForChart(HttpSession session, ModelAndView mv) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		System.out.println(loginUser.toString());
		String userId = loginUser.getUserId();
		PointForChart pointForChart = pntService.getPointForChart(userId);
		if(pointForChart != null) {
			mv.addObject("pointForChart", pointForChart);
			mv.setViewName("point/pointChart");
		}
		return mv;
	}
	
}
