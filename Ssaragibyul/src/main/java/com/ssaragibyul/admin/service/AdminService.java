package com.ssaragibyul.admin.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssaragibyul.admin.store.AdminStore;
import com.ssaragibyul.common.Board;
import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.common.Reply;
import com.ssaragibyul.common.Search;
import com.ssaragibyul.donation.domain.Donation;
import com.ssaragibyul.funding.domain.Funding;
import com.ssaragibyul.history.domain.History;
import com.ssaragibyul.member.domain.Member;
import com.ssaragibyul.visit.domain.Visit;

public interface AdminService {

	// 전체회원수 조회
	public int printAllMemberCount(int MemberNo);
	// 오늘 새로 가입한 회원 수 조회
	public int printTodayMemberCount(int MemberNo);
	// 전체 신고건 조회
	public int printReportAllCount(int accu);
	// 미확인 신고건 수 조회
	public int printUnprocessedReport(int processing);
	// 별보러가자 게시판 현황
	public int printVisitbrdCount(int commNo);
	
	// 회원 전체 리스트 가져오기
	public ArrayList<Member> printAll(PageInfo pi);
	// 회원 상세정보(하나만 불러오기)
	public Member printOne(int member);
	// 회원 리스트 검색
	public ArrayList<Member> printSearchAll(Search search);
	// 회원 수정하기
	public int modifyMember(Member member);
	// 회원 탈퇴하기
	public int deleteMember(String userId);
	
	// 펀딩 리스트 출력
	public ArrayList<Funding> printAllFunding(PageInfo pi);
	// 펀딩 상세보기
	public Funding printOneFunding(int fundingNo);
	// 펀딩 검색
	public ArrayList<Funding> printSearchFunding(Search search);
	// 펀딩 삭제하기
	public int deleteFunding(int fundingNo);
	
	//기부 리스트 출력
	public ArrayList<Donation> printAllDoantion(PageInfo pi);
	// 기부 상세보기
	public Donation printOneDonation(int donationNo);
	// 기부 검색
	public ArrayList<Donation> printSearchDonation(Search search);
	// 기부 삭제하기
	public int deleteDonation(int donationNo);
	
	// 신고 게시물 리스트
	public ArrayList<Board> printAllReport(PageInfo pi);
	// 신고 상세보기
	public Board printOneReport(int boardNo);
	// 신고 검색
	public ArrayList<Board> printSearchReport(Search search);
	// 신고 삭제하기
	public int deleteReport(int BoardNo);
	
	//댓글삭제하기
	public int removeReply(Reply reply);
	// 신고 댓글보기
	public ArrayList<Reply> pringAllReply(int boardNo, String processing);
	// 댓글보기
	public Reply printOneReply(int commNo);
	
	// 기념관 리스트
	public ArrayList<History> pringAllHistoy(PageInfo pi);
	// 기념관 상세보기
	public History printOneHistoy(int mngNo);
	// 기념관 검색하기
	public ArrayList<History> printSearchHistory(Search search);
	// 기념관 등록하기
	public int registerHistory(History history);
	// 기념관 수정하기
	public int modifyHistory(History history);
	// 기념관 삭제하기
	public int removeHistory(int mngNo);
	
	// 별보러가자 리스트
	public ArrayList<Visit> printAllVisit(PageInfo pi);
	// 별보러가자 상세보기
	public Visit printOneVisit(int visitNo);
	// 별보러가자 검색
	public ArrayList<Visit> printSaerchVisit(Search search);
	// 별보러가자 삭제
	public int removeVisit(int visitNo);
	
	
	// 페이징
	public int getListCount();

}
