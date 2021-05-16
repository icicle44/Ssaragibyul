package com.ssaragibyul.member.service;

import com.ssaragibyul.member.domain.Member;

public interface MemberService {
	public Member loginMember(Member member); // 로그인
	public int checkIdDup(String userId); // 아이디 중복체크
	public int registerMember(Member member); // 회원가입
	public int modifyMember(Member member); // 회원 수정
	public int removeMember(String userId); // 회원 탈퇴
	public int searchId(String userId);// 아이디 찾기
	public int searchPw(String userPw); // 비밀번호 찾기(임시 비밀번호 발급 
}
