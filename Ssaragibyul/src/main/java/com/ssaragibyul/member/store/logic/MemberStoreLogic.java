package com.ssaragibyul.member.store.logic;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssaragibyul.independence.domain.Independence;
import com.ssaragibyul.member.domain.Member;
import com.ssaragibyul.member.store.MemberStore;

@Repository
public class MemberStoreLogic implements MemberStore{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//로그인
	@Override
	public Member selectOneMember(Member member) {
		return sqlSession.selectOne("memberMapper.selectOneMember", member);
	}

	//id 중복 검사
	@Override
	public int checkIdDup(String userId) {
		return sqlSession.selectOne("memberMapper.checkIdDup", userId);
	}
	// 닉네임 새로고침
	public Member refreshNickName() {
		return sqlSession.selectOne("memberMapper.refreshNick");
	}
	// 사용자 등록
	@Override
	public int insertMember(Member member) {
		return sqlSession.insert("memberMapper.insertMember", member);
	}

	// 사용자 정보 수정
	@Override
	public int updateMember(Member member) {
		return sqlSession.update("memberMapper.modifyMember", member);
	}

	//회원 탈퇴
	@Override
	public int removeMember(String userId) {
		return sqlSession.delete("memberMapper.removeMember", userId);
	}

	// 아이디 찾기
	@Override
	public String searchId(HashMap<String, String>param) {
		return sqlSession.selectOne("memberMapper.idSearch", param);
	}

	// 독립 유공자 정보 마이페이지에 띄워주기
	@Override
	public Independence mypage(String userId) {
		return sqlSession.selectOne("memberMapper.myPageView", userId);
	}

	/*
	 * @Override public int searchPw(Member member) { // TODO Auto-generated method
	 * stub return 0; }
	 */

}
