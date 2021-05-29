package com.ssaragibyul.member.store;

import java.util.HashMap;

import com.ssaragibyul.independence.domain.Independence;
import com.ssaragibyul.member.domain.Member;


public interface MemberStore {
	public Member selectOneMember(Member member);
	public int checkIdDup(String userId);
	public int insertMember(Member member);
	public int updateMember(Member member);
	public int removeMember(String userId);
	public String searchId(HashMap<String, String>param);
	public Member refreshNickName();
	public Independence mypage(String userId);
}
