package com.ssaragibyul.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ssaragibyul.admin.service.AdminService;
import com.ssaragibyul.common.Board;
import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.common.Pagination;
import com.ssaragibyul.common.Reply;
import com.ssaragibyul.common.Search;
import com.ssaragibyul.donation.domain.Donation;
import com.ssaragibyul.funding.domain.Funding;
import com.ssaragibyul.history.domain.History;
import com.ssaragibyul.member.domain.Member;
import com.ssaragibyul.message.controller.MessageController;
import com.ssaragibyul.message.domain.Message;
import com.ssaragibyul.message.domain.MessageAndNick;
import com.ssaragibyul.message.domain.PaginationMsg;
import com.ssaragibyul.message.service.MessageService;
import com.ssaragibyul.visit.domain.Visit;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService aService;
	
	@Autowired
	private MessageService msgService;

	// 관리자 메인페이지 들어가기
	@RequestMapping(value="adminMain.do", method = RequestMethod.GET)
	public String adminMain() {
		return "admin/adminMain";
	}
	
	// 전체 회원 수
	public int memberAllCount(ModelAndView mv) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 오늘 새로 가입한 회원 수 조회
	public int memberTodayCount(ModelAndView mv) {
		// int printTodayMemberCount(int MemberNo)
		return 0;
	}

	// 전체 신고건 조회
	public int reportAllCount(ModelAndView mv) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 미확인 신고건 수 조회
	public int unprocessedReport(ModelAndView mv) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 별보러가자 게시판 현황
	public int visitbrdCount(ModelAndView mv) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 회원 전체 리스트 가져오기
	@RequestMapping(value="adminMemberListView.do", method = RequestMethod.GET)
	public ModelAndView memberListView(ModelAndView mv, @RequestParam(value="page", required = false) Integer page) {
		// TODO Auto-generated method stub
		int currentPage = (page != null)?page : 1;
		int listCount = aService.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		ArrayList<Member> mList = aService.printAll(pi);
		if(!mList.isEmpty()) {
			mv.addObject("mList", mList);
			mv.addObject("pi", pi);
			mv.setViewName("admin/adminMemberListView");
		} else {
			mv.addObject("msg", "회원 관리에 들어가지 못하였습니다.");
		}
		return mv;
	}
	
	// 회원 상세정보(하나만 불러오기)
	public Member memberDetail() {
		// TODO Auto-generated method stub
		return null;
	}

	// 회원 수정하기
	public ModelAndView memberModifyView(ModelAndView mv) {
		// TODO Auto-generated method stub
		return null;
	}

	// 회원 탈퇴하기
	public String memberDelete() {
		// TODO Auto-generated method stub
		return null;
	}

	// 회원 쪽지보내기
	public int SendNote(String MemberId) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 펀딩 리스트 출력
	public ModelAndView fundingListView() {
		// TODO Auto-generated method stub
		return null;
	}

	// 펀딩 상세보기
	public Funding fundingDetail() {
		// TODO Auto-generated method stub
		return null;
	}
	
	// 펀딩 삭제하기
	public String fundingDelete() {
		// TODO Auto-generated method stub
		return null;
	}

	//기부 리스트 출력
	public ModelAndView doantionListView() {
		// TODO Auto-generated method stub
		return null;
	}

	// 기부 상세보기
	public Donation donationDetail() {
		// TODO Auto-generated method stub
		return null;
	}

	// 기부 삭제하기
	public String donationDelete() {
		// TODO Auto-generated method stub
		return null;
	}

	// 신고 게시물 리스트
	public ModelAndView reportListView() {
		// TODO Auto-generated method stub
		return null;
	}

	// 신고 상세보기
	public Board reportDetail() {
		// TODO Auto-generated method stub
		return null;
	}
	
	// 신고 삭제하기
	public String reportDelete() {
		// TODO Auto-generated method stub
		return null;
	}

	//댓글삭제하기
	public String replyRemove() {
		// TODO Auto-generated method stub
		return null;
	}

	// 신고 댓글보기
	public ModelAndView replyListView() {
		// TODO Auto-generated method stub
		return null;
	}

	// 댓글보기
	public Reply replyDetail() {
		// TODO Auto-generated method stub
		return null;
	}

	// 기념관 리스트
	@RequestMapping(value="adminHistoryList.do", method = RequestMethod.GET)
	public ModelAndView histoyListView(ModelAndView mv) {
		// TODO Auto-generated method stub
		return mv;
	}

	// 기념관 상세보기
	public History histoyDetail() {
		// TODO Auto-generated method stub
		return null;
	}
	
	// 기념관 등록하기
	public ModelAndView histoyRegister() {
		// TODO Auto-generated method stub
		return null;
	}
	
	private String saveFile(MultipartFile file, HttpServletRequest request) {
		return null;
	}

	// 기념관 수정하기
	public ModelAndView historyUpdate() {
		// TODO Auto-generated method stub
		return null;
	}

	// 기념관 삭제하기
	public String historyDelete() {
		// TODO Auto-generated method stub
		return null;
	}

	// 별보러가자 리스트
	public ModelAndView visitListView() {
		// TODO Auto-generated method stub
		return null;
	}

	// 별보러가자 상세보기
	public Visit visitDetail() {
		// TODO Auto-generated method stub
		return null;
	}

	// 별보러가자 삭제
	public String visitDelete() {
		// TODO Auto-generated method stub
		return null;
	}

	// 받은 쪽지함 리스트
	@RequestMapping(value="adminMessageList.do", method = RequestMethod.GET)
	public ModelAndView messageListView(ModelAndView mv,
										HttpSession session,
										@RequestParam(value="page", required=false) Integer page) {
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
		mv.setViewName("admin/adminMessageList");
		return mv;
	}

//	// 쪽지 상세보기
//	@RequestMapping(value="adminMessageDetail.do", method = RequestMethod.GET)
//	public ModelAndView MessageDetail(@RequestParam("msgNo") int msgNo,
//										@RequestParam("nickName") String nickName,
//										@RequestParam("flag") String flag,
//										ModelAndView mv) {
//			//받은 쪽지 읽을 때만 읽음여부 컬럼 update
//					int result = 0;
//					if (flag.equals("rec")) {
//						result = msgService.updateRead(msgNo);
//					} else {
//						result = 1;
//					}
//			//message select하기
//					if (result > 0) {
//						Message message = msgService.printOne(msgNo);
//						if (message != null) {
//							mv.addObject("message", message);
//							mv.addObject("nickName", nickName);
//							mv.addObject("flag", flag);
//							mv.setViewName("admin/adminMessageDetailView");
//						} else {
//							mv.addObject("msg", "쪽지 상세보기에 실패하였습니다.");
//							if (flag.equals("rec")) {
//								mv.setViewName("redirect:adminMessageList.do");
//							} else if (flag.equals("send")) {
//								mv.setViewName("redirect:sendMsgList.do");
//							} else {
//								mv.setViewName("redirect:noticeMsgList.do");
//							}
//						}
//					} else {
//						mv.addObject("msg", "쪽지 상세보기에 실패하였습니다.");
//						if (flag.equals("rec")) {
//							mv.setViewName("redirect:adminMessageList.do");
//						} else if (flag.equals("send")) {
//							mv.setViewName("redirect:sendMsgList.do");
//						} else {
//							mv.setViewName("redirect:noticeMsgList.do");
//						}
//					}
//					return mv;
//				}

	// 쪽지 삭세하기
	public String messageDelete() {
		// TODO Auto-generated method stub
		return null;
	}

	// 보낸쪽지함
	public Message sendMessage() {
		// TODO Auto-generated method stub
		return null;
	}
}

