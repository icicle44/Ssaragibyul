package com.ssaragibyul.member.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.ssaragibyul.independence.domain.Independence;
import com.ssaragibyul.member.domain.Member;

public interface MemberService {
	public Member loginMember(Member member); // 로그인
	public int checkIdDup(String userId); // 아이디 중복체크
	public Member refreshNickName();
	public int registerMember(Member member); // 회원가입
	public int modifyMember(Member member); // 회원 수정
	public int removeMember(String userId); // 회원 탈퇴
	public String searchId(HashMap<String, String>param); // 아이디 찾기
	public Independence mypage(String userId); //마이페이지에 독랍유공자 정보 띄우는 것
}
