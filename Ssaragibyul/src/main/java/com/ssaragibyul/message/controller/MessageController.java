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
import org.springframework.web.servlet.ModelAndView;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.common.Search;
import com.ssaragibyul.member.domain.Member;
import com.ssaragibyul.message.domain.Message;
import com.ssaragibyul.message.domain.MessageAndNick;
import com.ssaragibyul.message.domain.PaginationMsg;
import com.ssaragibyul.message.service.MessageService;

//추가할 것: 페이징, 읽음여부 업데이트 메소드, httpsession
@Controller
public class MessageController {

	@Autowired
	private MessageService msgService;
	
	//insert, update(delete용), delete, select, searchselect
	//insert1: 1대1 쪽지, insert2: 관리자공지 쪽지
	//select: 받은쪽지함용, 보낸쪽지함용, 공지용(받은쪽지함 상단에 뿌려줌), count용(받은쪽지), search용
	//update: 받은쪽지함용, 보낸쪽지함용
	//detail + update(읽음여부)
	
	////////////쪽지유형 jsp에서 넘겨줄 것!!!
	
	//쪽지작성 화면으로 이동
	//작성화면으로 넘어갈 때 자동으로 받는사람 아이디, 닉네임(관리자는 관리자로) 뜨도록 넘겨줄 것(message에 담아서)
	@RequestMapping(value="msgWriterView.do", method=RequestMethod.GET)
	public ModelAndView messageWriterView(ModelAndView mv,
										@ModelAttribute Message message,
										@RequestParam("nickName") String nickName,
										HttpSession session) {
//////////////////미비부분: 로그인 완성되면 session 이용하기
		
//		if(session.getAttribute("loginUser") != null) {
//			Member loginUser = (Member)session.getAttribute("loginUser");
//			message.setSenderId(loginUser.getUserId());
			mv.addObject("message", message);
			mv.addObject("nickName", nickName);
			mv.setViewName("message/messageWriteForm");
//		} else {
			//mv.addObject("msg", "로그인 해주세요.");
			//mv.setViewName("");
//		}
		return mv;
	}
	
	//1:1 쪽지 등록(회원, 관리자 모두 보낼 수 있음)
	@RequestMapping(value="registerMemMsg.do", method=RequestMethod.POST)
	public ModelAndView registerMemMessage(@ModelAttribute Message message
										, ModelAndView mv) {
		//jsp에서 session memberId 잊지말고 가져오기!
		//jsp에서 <a href=경로?${member.userId}>나 hidden으로 받는사람 아이디? 닉네임? 가져오기!
		//
		int result = msgService.registerMemMessage(message);
		
		/////////////////선물포인트가 0이 아닌 경우, 포인트내역 insert 메소드 호출하기!(posi, neg 둘다 호출)
		//if(message.getPresentPoint != 0 )
		System.out.println(message.toString());
		return mv;
	}
	
	//관리자의 공지 쪽지 등록
	@RequestMapping(value="registerNotiMsg.do", method=RequestMethod.POST)
	public ModelAndView registerNotiMessage(@ModelAttribute Message message
										, HttpSession session
										, ModelAndView mv) {
		int result = msgService.registerNotiMessage(message);
		return mv;
	}
		
	//받은 쪽지 삭제(다중선택)
	@RequestMapping(value="recMsgDelete.do", method=RequestMethod.GET)
	public ModelAndView receivedMsgDelete(@RequestParam(value = "msgNoArr[]") List<Integer> msgNoArr, ModelAndView mv) {
		//배열에 해당하는 쪽지의 삭제표시컬럼 update
		int Result1 = msgService.deleteReceivedMsg(msgNoArr);
		
		//완전삭제
		int remResult = msgService.removeMsgComplete(msgNoArr);
		
		return mv;
	}
	
	//공지쪽지는 무조건 삭제할거면 메소드 별도로 구성, 아니면 이 메소드 쓰면 update만 되니까 괜찮음
	//보낸 쪽지 삭제(다중선택)
	@RequestMapping(value="sendMsgDelete.do", method=RequestMethod.GET)
	public ModelAndView sendMsgDelete(@RequestParam(value = "msgNoArr[]") List<Integer> msgNoArr, ModelAndView mv) {
		//배열에 해당하는 쪽지의 삭제표시컬럼 update
		int Result1 = msgService.deleteSendMsg(msgNoArr);
		
		//완전삭제
		int remResult = msgService.removeMsgComplete(msgNoArr);
		
		return mv;
	}
	
	/*
	 * //쪽지 완전 삭제(내부 호출용) //@RequestMapping(value="", method=RequestMethod.GET)
	 * public int msgDeleteComplete(List<Integer> msgNoArr) { //삭제표시용 컬럼 둘다 Y &
	 * 선물포인트 NULL이면 DELETE int result = msgService.removeMsgComplete(msgNoArr);
	 * return 0; }
	 */
	
	
	//공지 쪽지리스트 출력(별도 페이지 구성) //사용처: 관리자의 보낸 쪽지 리스트, 사용자의 받은 쪽지 리스트
	//보낸사람삭제여부 컬럼 값 N인 것만 select
	@RequestMapping(value="noticeMsgList.do", method=RequestMethod.GET)
	public ModelAndView noticeMessageList(ModelAndView mv,
										@RequestParam(value="page", required=false) Integer page) { 
		
/////////////////미비부분: 로그인 완성되면 session 이용하기		
		//로그인여부 체크
		int currentPage = (page != null)? page : 1;
		int listCount = msgService.getNoticeListCount();
		PageInfo pi = PaginationMsg.getPageInfo(currentPage, listCount);
		ArrayList<Message> nMList = msgService.printAllnMsg(pi);
		if(!nMList.isEmpty()) {
			mv.addObject("msgList", nMList);
		}else {
			mv.addObject("msg", "공지가 없습니다.");
		}
		mv.addObject("pi", pi);
		mv.addObject("flag", "notice");
		mv.setViewName("message/messageListView");
		return mv;
	} 
	
	//받은쪽지 리스트 출력
	@RequestMapping(value="recMsgList.do", method=RequestMethod.GET)
	public ModelAndView receivedMessageList(ModelAndView mv,
											HttpSession session,
											//@RequestParam("userId") String userId,
											@RequestParam(value="page", required=false) Integer page) {
/////////////////미비부분: 로그인 완성되면 session 이용하기
		
		//공지쪽지여부 컬럼값 1인 쪽지는 받은사람 아이디 null이라 어차피 select 안됨
		
		//userId 넘겨주거나, 아니면 session, jsp에 하드코딩 해놓은것 고치기!!!
		//전체 로그인체크로 쌀 것
		
		String userId = ((Member)session.getAttribute("loginUser")).getUserId();
		System.out.println(userId);
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
			mv.addObject("msg", "받은 쪽지가 없습니다.");
		}
		mv.addObject("pi", pi);
		mv.addObject("flag", flag);	
		mv.setViewName("message/messageListView");
		return mv;
	}
	
	//보낸 쪽지리스트 출력
	@RequestMapping(value="sendMsgList.do", method=RequestMethod.GET)
	public ModelAndView sendedMessageList(ModelAndView mv,
										@RequestParam("userId") String userId,
										//HttpSession session,
										@RequestParam(value="page", required=false) Integer page) {
/////////////////미비부분: 로그인 완성되면 session 이용하기
		
		//전체 로그인체크로 쌀 것
		//String userId = ((Member)session.getAttribute("loginUser")).getUserId();
		
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
			mv.addObject("msg", "보낸 쪽지가 없습니다.");			
		}
		mv.addObject("pi", pi);
		mv.addObject("flag", flag);
		mv.setViewName("message/messageListView");
		return mv;
	}
	
	//쪽지 상세보기
	@RequestMapping(value="msgDetail.do", method=RequestMethod.GET)
	public String MessageDetail(@RequestParam("msgNo") int msgNo, Model model) {
		Message message = msgService.printOne(msgNo);
		
		//읽음여부 업데이트
		int result = msgService.updateRead(msgNo);
		return "";
	}
	
	//읽지않은 받은쪽지 갯수 출력
	//@RequestMapping(value="", method=RequestMethod.GET)
	public int getCountReceivedMsg(String userId) {
		int rMsgCnt = msgService.getRecMsgCount(userId);
		
		//1. 이 메소드를 로그인 메소드 안에서 호출 후, return 값 session에 넣기
		//2. detail메소드 안에서 호출 후, session에 넣기
		
		//아니면 session에 넣는 것까지 이 메소드안에 작성
		return 0;
	}
	
	//오늘의 공지쪽지 갯수 출력
	public int  getCountNoticeMsg() {
		int nMsgCnt = msgService.getNoticeMsgCount();
		return 0;
	}
	
	//쪽지검색(검색/ 선물,관리자쪽지 모아보기)
	@RequestMapping(value="msgSearch.do", method=RequestMethod.GET)
	public ModelAndView MessageSearch(@ModelAttribute Search search
								, ModelAndView mv
								, @RequestParam(value="page", required=false) Integer page) {
		
		int currentPage = (page != null)? page : 1;
		int listCount = msgService.getSearchListCount(search);
		PageInfo pi = new PageInfo();
		//PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Message> msgList = msgService.printSearchList(pi, search);
		
		
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
