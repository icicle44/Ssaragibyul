package com.ssaragibyul.message.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
	@RequestMapping(value="msgWriterView", method=RequestMethod.GET)
	public String messageWriterView() {
		return "";
	}
	
	//1:1 쪽지 등록(회원, 관리자 모두 보낼 수 있음)
	@RequestMapping(value="registerMemMsg", method=RequestMethod.POST)
	public ModelAndView registerMemMessage(@ModelAttribute Message message
										, HttpSession session
										, ModelAndView mv) {
		//jsp에서 session memberId 잊지말고 가져오기!
		Member loginUser = (Member)session.getAttribute("loginUser");
		message.setSenderId(loginUser.getUserId());
		//jsp에서 <a href=경로?${member.userId}>나 hidden으로 받는사람 아이디? 닉네임? 가져오기!
		
		//jsp에 선물포인트 등 디폴트값, 0 등 필요한 값 input태그에 value로 넣어두기
		int result = msgService.registerMemMessage(message);
		
		/////////////////선물포인트가 0이 아닌 경우, 포인트내역 insert 메소드 호출하기!(posi, neg 둘다 호출)
		//if(message.getPresentPoint != 0 )
		
		return mv;
	}
	
	//관리자의 공지 쪽지 등록
	@RequestMapping(value="registerNotiMsg", method=RequestMethod.POST)
	public ModelAndView registerNotiMessage(@ModelAttribute Message message
										, HttpSession session
										, ModelAndView mv) {
		int result = msgService.registerNotiMessage(message);
		return mv;
	}
		
	//받은 쪽지 삭제(다중선택)
	@RequestMapping(value="recMsgDelete", method=RequestMethod.GET)
	public ModelAndView receivedMsgDelete(@RequestParam(value = "msgNoArr[]") List<Integer> msgNoArr, ModelAndView mv) {
		//배열에 해당하는 쪽지의 삭제표시컬럼 update
		int Result1 = msgService.deleteReceivedMsg(msgNoArr);
		
		//완전삭제
		int remResult = msgService.removeMsgComplete(msgNoArr);
		
		return mv;
	}
	
	//공지쪽지는 무조건 삭제할거면 메소드 별도로 구성, 아니면 이 메소드 쓰면 update만 되니까 괜찮음
	//보낸 쪽지 삭제(다중선택)
	@RequestMapping(value="sendMsgDelete", method=RequestMethod.GET)
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
	@RequestMapping(value="noticeMsgList", method=RequestMethod.GET)
	public ModelAndView noticeMessageList(ModelAndView mv,
									@RequestParam(value="page", required=false) Integer page) { 
		int currentPage = (page != null)? page : 1;
		int listCount = msgService.getNoticeListCount();
		PageInfo pi = new PageInfo();
		//PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Message> nMList = msgService.printAllnMsg(pi);
		return mv;
	} 
	
	//받은쪽지 리스트 출력
	@RequestMapping(value="recMsgList", method=RequestMethod.GET)
	public ModelAndView receivedMessageList(@RequestParam("userId") String userId
											, ModelAndView mv
											, @RequestParam(value="page", required=false) Integer page) {
		//공지쪽지여부 컬럼값 1인 쪽지는 받은사람 아이디 null이라 어차피 select 안됨
		String flag = "rec"; //??? 기억이안남...
		HashMap<String, String> cntMap = new HashMap<String, String>();
		cntMap.put("flag", flag);
		cntMap.put("userId", userId);
		int listCount = msgService.getMsgListCount(cntMap);
		PageInfo pi = new PageInfo();
		//PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Message> rMList = msgService.printAllrMsg(pi, userId);
		return mv;
	}
	
	//보낸 쪽지리스트 출력
	@RequestMapping(value="sendMsgList", method=RequestMethod.GET)
	public ModelAndView sendedMessageList(@RequestParam("userId") String userId
										, ModelAndView mv
										, @RequestParam(value="page", required=false) Integer page) {
		String flag = "send"; //??? 기억이안남...
		HashMap<String, String> cntMap = new HashMap<String, String>();
		cntMap.put("flag", flag);
		cntMap.put("userId", userId);
		int listCount = msgService.getMsgListCount(cntMap);
		PageInfo pi = new PageInfo();
		//PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Message> rMList = msgService.printAllsMsg(pi, userId);
		
		return mv;
	}
	
	//쪽지 상세보기
	@RequestMapping(value="msgDetail", method=RequestMethod.GET)
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
	
	//쪽지검색
	@RequestMapping(value="msgSearch", method=RequestMethod.GET)
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
}
