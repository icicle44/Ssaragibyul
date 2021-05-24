package com.ssaragibyul.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

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
import com.ssaragibyul.message.domain.Message;
import com.ssaragibyul.visit.domain.Visit;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService aService;

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
	public ModelAndView histoyListView() {
		// TODO Auto-generated method stub
		return null;
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

	// 쪽지목록보기
	public ModelAndView messageListView() {
		// TODO Auto-generated method stub
		return null;
	}

	// 쪽지 상세보기
	public Message messageDetail() {
		// TODO Auto-generated method stub
		return null;
	}

	// 쪽지 삭세하기
	public String messageDelete() {
		// TODO Auto-generated method stub
		return null;
	}

	// 쪽지 보내기
	public Message sendMessage() {
		// TODO Auto-generated method stub
		return null;
	}
}

