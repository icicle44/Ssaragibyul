package com.ssaragibyul.member.service;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.ssaragibyul.member.domain.Member;

public interface MemberService {
	public Member loginMember(Member member); // 로그인
	public int checkIdDup(String userId); // 아이디 중복체크
	public String refreshNickName();
	public int registerMember(Member member); // 회원가입
	public int modifyMember(Member member); // 회원 수정
	public int removeMember(String userId); // 회원 탈퇴
	public String searchId(Member member);
}
