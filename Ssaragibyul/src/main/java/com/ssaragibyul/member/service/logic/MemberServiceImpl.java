package com.ssaragibyul.member.service.logic;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssaragibyul.member.domain.Member;
import com.ssaragibyul.member.service.MemberService;
import com.ssaragibyul.member.store.MemberStore;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberStore mStore;

	
	// 로그인
	@Override
	public Member loginMember(Member member) {
		return mStore.selectOneMember(member);
	}

	// id 중복 체크
	@Override
	public int checkIdDup(String userId) {
		return mStore.checkIdDup(userId);
	}
	// nickname 새로고침
	@Override
	public String refreshNickName() {
		return mStore.refreshNickName();
	}
	// 사용자 등록 
	@Override
	public int registerMember(Member member) {
		return mStore.insertMember(member);
	}

	// 사용자 정보 수정
	@Override
	public int modifyMember(Member member) {
		return mStore.updateMember(member);
	}

	@Override
	public int removeMember(String userId) {
		return mStore.removeMember(userId);
	}

	@Override
	public String searchId(Member member){
		return mStore.searchId(member);
	}

	/*
	 * @Override public int searchPw(String userPw) { // TODO Auto-generated method
	 * stub return 0; }
	 */
	
}
