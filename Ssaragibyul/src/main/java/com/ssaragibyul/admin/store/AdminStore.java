package com.ssaragibyul.admin.store;
import java.util.ArrayList;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.common.Reply;
import com.ssaragibyul.common.Search;
import com.ssaragibyul.donation.domain.Donation;
import com.ssaragibyul.funding.domain.Funding;
import com.ssaragibyul.history.domain.History;
import com.ssaragibyul.member.domain.Member;
import com.ssaragibyul.message.domain.Message;
import com.ssaragibyul.visit.domain.Visit;

public interface AdminStore {

	// 전체회원수 조회
	public int selectAllMemberCount();
	// 오늘 새로 가입한 회원 수 조회
	public int selectTodayMemberCount();
	// 전체 신고건 조회
	public int selectAllReportCount();
	// 미확인 신고건 수 조회
	public int selectUnprocessedReport();
	// 별보러가자 게시판 현황
	public int selectVisitbrdCount();
	// 탈퇴한 회원 수 조회
	public int slelectCountDeleteMember();
	// 신고 쪽지 수 조회
	public int selectReportAllCount();
	// 최근 보낸 쪽지 뿌리기
	public ArrayList<Message> selectCountNewMessage();
	// 최근 받은 쪽지 뿌리기
	public ArrayList<Message> selectCountNewRecMessage();
	// 지난주 별보러가자 게시글 현황
	public ArrayList<Visit> selectCountPostVisit();
	
	
	// 회원 전체 리스트 가져오기
	public ArrayList<Member> selectAll(PageInfo pi);
	// 회원 상세정보(하나만 불러오기)
	public Member selectOne(String userId);
	// 회원 리스트 검색
	public ArrayList<Member> selectSearchAll(Search search);
	// 회원 수정하기
	public int updateMember(Member member);
	// 회원 탈퇴하기
	public int deleteMember(String userId);
	
	// 펀딩 리스트 출력
	public ArrayList<Funding> selectAllFunding(PageInfo pi);
	// 펀딩 상세보기
	public Funding selectOneFunding(int fundingNo);
	// 펀딩 검색
	public ArrayList<Funding> selectSearchFunding(Search search);
	// 펀딩 삭제하기
	public int deleteFunding(int fundingNo);
	
	//기부 리스트 출력
	public ArrayList<Donation> selectAllDoantion(PageInfo pi);
	// 기부 상세보기
	public Donation selectOneDonation(int donationNo);
	// 기부 검색
	public ArrayList<Donation> selectSearchDonation(Search search);
	// 기부 삭제하기
	public int deleteDonation(int donationNo);
	
	// 신고 게시물 리스트
//	public ArrayList<Board> selectReportAll(PageInfo pi);
//	// 신고 상세보기
//	public Board selectOneReport(int boardNo);
//	// 신고 검색
//	public ArrayList<Board> selectSearchReport(Search search);
	// 신고 삭제하기
	public int deleteReport(int BoardNo);
	
	//댓글삭제하기
	public int deleteReply(Reply reply);
	// 신고 댓글보기
	public ArrayList<Reply> pringAllReply(int boardNo, String processing);
	// 댓글보기
	public Reply selectOneReply(int commNo);
	
	// 기념관 리스트
	public ArrayList<History> pringAllHistoy(PageInfo pi);
	// 기념관 상세보기
	public History selectOneHistoy(int mngNo);
	// 기념관 검색하기
	public ArrayList<History> selectSearchHistory(Search search);
	// 기념관 등록하기
	public int insertHistory(History history);
	// 기념관 수정하기
	public int updateHistory(History history);
	// 기념관 삭제하기
	public int deleteHistory(int mngNo);
	
	// 별보러가자 리스트
	public ArrayList<Visit> selectAllVisit(PageInfo pi);
	// 별보러가자 상세보기
	public Visit selectOneVisit(int visitNo);
	// 별보러가자 검색
	public ArrayList<Visit> selectSaerchVisit(Search search);
	// 별보러가자 삭제
	public int deleteVisit(int visitNo);
	
	// 페이징
	public int selectListCount();
	public int selectHistoyListCount();
	public int selectFundingListCount();
	public int selectDonationListCount();
	public int selectVisitListCount();




}
