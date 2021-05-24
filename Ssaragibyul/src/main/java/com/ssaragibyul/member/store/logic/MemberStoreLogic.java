package com.ssaragibyul.member.store.logic;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

	// 사용자 등록
	@Override
	public int insertMember(Member member) {
		return sqlSession.insert("memberMapper.insertMember", member);
	}

	@Override
	public int updateMember(Member member) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int removeMember(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 아이디 찾기
	@Override
	public int searchId(Member member) {
		return sqlSession.selectOne("memberMapper.idSearch", member);
	}

	@Override
	public int searchPw(Member member) {
		// TODO Auto-generated method stub
		return 0;
	}

}
