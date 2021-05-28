package com.ssaragibyul.message.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.member.domain.Member;
import com.ssaragibyul.message.domain.Message;
import com.ssaragibyul.message.domain.MessageAndNick;
import com.ssaragibyul.message.domain.PaginationMsg;
import com.ssaragibyul.message.domain.SearchMsg;
import com.ssaragibyul.message.service.MessageService;
import com.ssaragibyul.point.service.PointService;

//추가할 것: 페이징, 읽음여부 업데이트 메소드, httpsession
@Controller
public class MessageController {

	@Autowired
	private MessageService msgService;
	
	@Autowired
	private PointService pntService;
	
	//insert, update(delete용), delete, select, searchselect
	//insert1: 1대1 쪽지, insert2: 관리자공지 쪽지
	//select: 받은쪽지함용, 보낸쪽지함용, 공지용(받은쪽지함 상단에 뿌려줌), count용(받은쪽지), search용
	//update: 받은쪽지함용, 보낸쪽지함용
	//detail + update(읽음여부)
	
	////////////쪽지유형 jsp에서 넘겨줄 것!!!
	
	
////////////완!!!
	//쪽지작성 화면으로 이동(일반회원/관리자(공지 전체에게 보내기 포함) 같이 사용)
	//작성화면으로 넘어갈 때 자동으로 받는사람 아이디, 닉네임(관리자는 관리자로) 뜨도록 넘겨줄 것(message에 담아서)
	@RequestMapping(value="msgWriterView.do", method=RequestMethod.GET)
	public ModelAndView messageWriterView(ModelAndView mv,
										@ModelAttribute Message message,
										@RequestParam(value="nickName", required=false) String nickName,
										HttpSession session) {
		//message: 공지외-receiverId, msgType / 공지-msgType
		if(session != null && (Member)session.getAttribute("loginUser") != null) {
			Member loginUser = (Member)session.getAttribute("loginUser");
			message.setSenderId(loginUser.getUserId());
			mv.addObject("message", message);
			/* 쪽지 받을 사람 닉네임 */
			mv.addObject("nickName", nickName);
			mv.setViewName("message/messageWriteForm");
		} else {
			mv.addObject("msg", "로그인이 필요합니다.");
			mv.setViewName("member/login");
		}
		return mv;
	}
	
	//완
	//1:1 쪽지 등록(회원, 관리자 모두 사용)
	@ResponseBody
	@RequestMapping(value="registerMemMsg.do", method=RequestMethod.POST)
	public String registerMemMessage(@ModelAttribute Message message
										, ModelAndView mv) {
		
		int msgResult = msgService.registerMemMessage(message);
		if(msgResult >0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
///////////////////////완!!!(관리자 마이페이지와 조율 및 연동!!!)
	//관리자의 공지 쪽지 등록
	@ResponseBody
	@RequestMapping(value="registerNotiMsg.do", method=RequestMethod.POST)
	public String registerNotiMessage(@ModelAttribute Message message
										, HttpSession session
										, ModelAndView mv) {
		int result = msgService.registerNotiMessage(message);
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
		
	//받은 쪽지 삭제(다중선택)
	@ResponseBody
	@RequestMapping(value="recMsgDelete.do", method=RequestMethod.POST)
	public String receivedMsgDelete(@RequestParam(value = "msgNoArr[]") List<Integer> msgNoArr, ModelAndView mv) {
		//배열에 해당하는 쪽지의 삭제표시컬럼 update
		int upResult = msgService.deleteReceivedMsg(msgNoArr);
		System.out.println(upResult);
		if(upResult > 0) {
			//완전삭제
			int delResult = msgService.removeMsgComplete(msgNoArr);
			System.out.println(delResult);
			return "success";
		} else {
			return "fail";			
		}
	}
	
	//공지쪽지는 무조건 삭제할거면 메소드 별도로 구성, 아니면 이 메소드 쓰면 update만 되니까 괜찮음
	//보낸 쪽지 삭제(다중선택)
	@ResponseBody
	@RequestMapping(value="sendMsgDelete.do", method=RequestMethod.POST)
	public String sendMsgDelete(@RequestParam(value = "msgNoArr[]") List<Integer> msgNoArr, ModelAndView mv) {
		//배열에 해당하는 쪽지의 삭제표시컬럼 update
		int upResult = msgService.deleteSendMsg(msgNoArr);
		System.out.println(upResult);
		if(upResult > 0) {
			//완전삭제
			int delResult = msgService.removeMsgComplete(msgNoArr);
			System.out.println(delResult);
			return "success";
		} else {
			return "fail";			
		}
	}
	
	/*
	 * //쪽지 완전 삭제(내부 호출용) //@RequestMapping(value="", method=RequestMethod.GET)
	 * public int msgDeleteComplete(List<Integer> msgNoArr) { //삭제표시용 컬럼 둘다 Y &
	 * 선물포인트 NULL이면 DELETE int result = msgService.removeMsgComplete(msgNoArr);
	 * return 0; }
	 */
	
////////////완!!!(쪽지 리스트 jsp에 ajax 연결!!!!!!!!!!!!!!)
	//공지 쪽지리스트 출력(별도 페이지 구성)
	//사용처: 관리자의 보낸 쪽지 리스트, 사용자의 받은 쪽지 리스트
	@RequestMapping(value="noticeMsgList.do", method=RequestMethod.GET)
	public ModelAndView noticeMessageList(ModelAndView mv,
										HttpSession session,
										@RequestParam(value="page", required=false) Integer page) { 

		if(session != null && (Member)session.getAttribute("loginUser") != null) {
			int currentPage = (page != null)? page : 1;
			int listCount = msgService.getNoticeListCount();
			PageInfo pi = PaginationMsg.getPageInfo(currentPage, listCount);
			ArrayList<Message> nMList = msgService.printAllnMsg(pi);
			if(!nMList.isEmpty()) {
				mv.addObject("msgList", nMList);
			}else {
				mv.addObject("tblMsg", "공지가 없습니다.");
			}
			mv.addObject("pi", pi);
			mv.addObject("flag", "notice");
			mv.setViewName("message/messageListView");
		}else {
			mv.addObject("msg", "로그인이 필요합니다.");
			mv.setViewName("member/login");
		}
		return mv;
	} 
	
////////////완!!!
	//받은쪽지 리스트 출력
	@RequestMapping(value="recMsgList.do", method=RequestMethod.GET)
	public ModelAndView receivedMessageList(ModelAndView mv,
											HttpSession session,
											@RequestParam(value="page", required=false) Integer page) {
		
		if(session != null && (Member)session.getAttribute("loginUser") != null) {
			String userId = ((Member)session.getAttribute("loginUser")).getUserId();
			String flag = "rec";
			
			HashMap<String, String> cntMap = new HashMap<String, String>();
			cntMap.put("flag", flag);
			cntMap.put("userId", userId);
			int currentPage = (page != null)? page : 1;
			int listCount = msgService.getMsgListCount(cntMap);
			PageInfo pi = PaginationMsg.getPageInfo(currentPage, listCount);
	
			ArrayList<MessageAndNick> rMList = msgService.printAllrMsg(pi, userId);
			rMList.toString();
			if(!rMList.isEmpty()) {
				mv.addObject("msgList", rMList);	
			}else {
				mv.addObject("tblMsg", "받은 쪽지가 없습니다.");
			}
			mv.addObject("pi", pi);
			mv.addObject("flag", flag);	
			mv.setViewName("message/messageListView");
		}else {
			mv.addObject("msg", "로그인이 필요합니다.");
			mv.setViewName("member/login");
		}
		return mv;
	}

////////////완!!!
	//보낸 쪽지리스트 출력
	@RequestMapping(value="sendMsgList.do", method=RequestMethod.GET)
	public ModelAndView sendedMessageList(ModelAndView mv,
										HttpSession session,
										@RequestParam(value="page", required=false) Integer page) {
		
		if(session != null && (Member)session.getAttribute("loginUser") != null) {
			String userId = ((Member)session.getAttribute("loginUser")).getUserId();
			String flag = "send";
			
			HashMap<String, String> cntMap = new HashMap<String, String>();
			cntMap.put("flag", flag);
			cntMap.put("userId", userId);
			int currentPage = (page != null)? page : 1;
			int listCount = msgService.getMsgListCount(cntMap);
			PageInfo pi = PaginationMsg.getPageInfo(currentPage, listCount);
	
			ArrayList<MessageAndNick> sMList = msgService.printAllsMsg(pi, userId);
			if(!sMList.isEmpty()) {
				mv.addObject("msgList", sMList);
				
			}else {
				mv.addObject("tblMsg", "보낸 쪽지가 없습니다.");			
			}
			mv.addObject("pi", pi);
			mv.addObject("flag", flag);
			mv.setViewName("message/messageListView");
		}else {
			mv.addObject("msg", "로그인이 필요합니다.");
			mv.setViewName("member/login");
		}
		return mv;
	}

///////////////완(에러시 이동 및 alert 창 수정하기!!! printWriter???)
	//쪽지 상세보기
	@RequestMapping(value="msgDetail.do", method=RequestMethod.GET)
	public ModelAndView MessageDetail(@RequestParam("msgNo") int msgNo,
									@RequestParam("nickName") String nickName,
									@RequestParam("flag") String flag,
									ModelAndView mv) {
		//받은 쪽지 읽을 때만 읽음여부 컬럼 update
		int result = 0;
		if(flag.equals("rec")) {
			result = msgService.updateRead(msgNo);
		}else {
			result = 1;
		}
		//message select하기
		if(result > 0) {
			Message message = msgService.printOne(msgNo);
			if(message != null) {
				mv.addObject("message", message);
				mv.addObject("nickName", nickName);
				mv.addObject("flag", flag);
				mv.setViewName("message/messageDetailView");
			}else {
				mv.addObject("msg", "쪽지 상세보기에 실패하였습니다.");
				if(flag.equals("rec")) {
					mv.setViewName("redirect:recMsgList.do");
				}else if(flag.equals("send")) {
					mv.setViewName("redirect:sendMsgList.do");
				}else {
					mv.setViewName("redirect:noticeMsgList.do");
				}
			}			
		}else {
			mv.addObject("msg", "쪽지 상세보기에 실패하였습니다.");
			if(flag.equals("rec")) {
				mv.setViewName("redirect:recMsgList.do");
			}else if(flag.equals("send")) {
				mv.setViewName("redirect:sendMsgList.do");
			}else {
				mv.setViewName("redirect:noticeMsgList.do");
			}
		}
		return mv;
	}
	
	//읽지않은 받은쪽지 갯수 출력
	@ResponseBody
	@RequestMapping(value="recMsgCnt.do", method= {RequestMethod.GET,RequestMethod.POST})
	public void getCountReceivedMsg(HttpSession session, HttpServletResponse response) throws JsonIOException, IOException {
		String userId = ((Member)session.getAttribute("loginUser")).getUserId();
		int rMsgCnt = msgService.getRecMsgCount(userId);
		session.setAttribute("msgCount", rMsgCnt);
		
		Gson gson = new Gson();
		gson.toJson(rMsgCnt, response.getWriter());
		//1. 이 메소드를 로그인 메소드 안에서 호출 후, return 값 session에 넣기
		//2. detail메소드 안에서 호출 후, session에 넣기
		
		//아니면 session에 넣는 것까지 이 메소드안에 작성
	}
	
	//오늘의 공지쪽지 갯수 출력
	@ResponseBody
	@RequestMapping(value="notiMsgCnt.do", method= {RequestMethod.GET,RequestMethod.POST})
	public void getCountNoticeMsg(HttpSession session, HttpServletResponse response) throws JsonIOException, IOException {
		int nMsgCnt = msgService.getNoticeMsgCount();
		session.setAttribute("notiCount", nMsgCnt);
		
		Gson gson = new Gson();
		gson.toJson(nMsgCnt, response.getWriter());
	}
	
	//쪽지검색(검색/ 선물,관리자쪽지 모아보기), 공지사항도 같이씀(sender==admin)
	@RequestMapping(value="msgSearch.do", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView MessageSearch(@ModelAttribute SearchMsg search,
									@RequestParam("flag") String flag,
									ModelAndView mv,
									HttpSession session,
									@RequestParam(value="page", required=false) Integer page) {
		if(session != null && (Member)session.getAttribute("loginUser") != null) {
			String userId = ((Member)session.getAttribute("loginUser")).getUserId();
			search.setUserId(userId);
			search.setFlag(flag);
			if(search.getSearchCondition().equals("admin")) {
				search.setSearchValue("admin");
			}
			int currentPage = (page != null)? page : 1;
			int listCount = msgService.getSearchListCount(search);
			System.out.println(listCount);
			PageInfo pi = PaginationMsg.getPageInfo(currentPage, listCount);
			
			ArrayList<MessageAndNick> searchMsgList = msgService.printSearchList(pi, search);
			if(!searchMsgList.isEmpty()) {
				mv.addObject("msgList", searchMsgList);
				mv.addObject("search", search);
			}else {
				mv.addObject("search", search);
				mv.addObject("tblMsg", "해당하는 쪽지가 없습니다.");
			}
			mv.addObject("pi", pi);
			mv.addObject("flag", flag);	
			mv.setViewName("message/messageListView");
		}else {
			mv.addObject("msg", "로그인이 필요합니다.");
			mv.setViewName("member/login");
		}
		return mv;
	}
	
	/*
	 * public static void alertAndMovePage(HttpServletResponse response, String
	 * alertText, String nextPage) {
	 * response.setContentType("text/html; charset=utf-8"); try { PrintWriter out =
	 * response.getWriter();
	 * out.println("<script>location.href='"+nextPage+"'; alert("+alertText+
	 * ");</script>"); out.flush(); } catch (IOException e) { // TODO Auto-generated
	 * catch block e.printStackTrace(); } }
	 */
}
