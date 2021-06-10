package com.ssaragibyul.member.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.independence.domain.Independence;
import com.ssaragibyul.member.domain.CommentAndProject;
import com.ssaragibyul.member.domain.Member;
import com.ssaragibyul.message.domain.SearchMsg;
import com.ssaragibyul.visit.domain.Visit;

public interface MemberService {
	public Member loginMember(Member member); // 로그인
	public int checkIdDup(String userId); // 아이디 중복체크
	public Member refreshNickName();
	public int registerMember(Member member); // 회원가입
	public int modifyMember(Member member); // 회원 수정
	public int removeMember(String userId); // 회원 탈퇴
	public String searchId(HashMap<String, String>param); // 아이디 찾기
	public Independence mypage(String userId); //마이페이지에 독랍유공자 정보 띄우는 것
	public ArrayList<Visit> printAllList(PageInfo pi, String userId);
	public ArrayList<CommentAndProject> printAllComment(PageInfo pi, String userId); //댓글 리스트 출력
	public int getcommentsListCount(String userId); //댓글 리스트 갯수
	public int deleteComment(HashMap<String, String> dMap); //댓글 삭제
	public int modifyComment(HashMap<String, String> mMap);//댓글 수정
	public int getMyListCount(String userId);
	public ArrayList<CommentAndProject> printSearchComment(PageInfo pi, SearchMsg search);//댓글카테고리검색
	public int getSearchCommentsCount(SearchMsg search);//댓글카테고리갯수
}
