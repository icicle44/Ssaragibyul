package com.ssaragibyul.admin.service;

import java.util.ArrayList;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.common.Search;
import com.ssaragibyul.member.domain.Member;

public interface AdminService {
	//회원로그인 확인
	public Member loginMember(Member member);
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
	//

}
