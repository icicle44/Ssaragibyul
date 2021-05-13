package com.ssaragibyul.member.service;

import com.ssaragibyul.member.domain.Member;

public interface MemberService {
	public Member loginMember(Member member);
	public int checkIdDup(String userId);
	public int registerMember(Member member);
	public int modifyMember(Member member);
	public int removeMember(String userId);
}
