package com.ssaragibyul.member.store.logic;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.independence.domain.Independence;
import com.ssaragibyul.member.domain.CommentAndProject;
import com.ssaragibyul.member.domain.Member;
import com.ssaragibyul.member.store.MemberStore;
import com.ssaragibyul.message.domain.SearchMsg;
import com.ssaragibyul.visit.domain.Visit;

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

	//댓글 리스트 출력
	@Override
	public ArrayList<CommentAndProject> selectAllComments(PageInfo pi, String userId) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.selectAllComments", userId, rowBounds);
	}

	//댓글 리스트 갯수 출력
	@Override
	public int getcommentsListCount(String userId) {
		return sqlSession.selectOne("memberMapper.selectCommentsCount", userId);
	}

	@Override
	public int deleteComment(HashMap<String, String> dMap) {
		return sqlSession.delete("memberMapper.deleteComment", dMap);
	}

	@Override
	public int updateComment(HashMap<String, String> mMap) {
		return sqlSession.update("memberMapper.modifyComment", mMap);
	}
	// 내가 쓴 게시글 모아보기
	@Override
	public ArrayList<Visit> selectAllList(PageInfo pi, String userId) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("visitMapper.selectAllMyList", userId, rowBounds);
	}

	@Override
	public int getListCount(String userId) {
		return sqlSession.selectOne("visitMapper.selectMyListCount", userId);
	}

	// 댓글카테고리검색
	@Override
	public ArrayList<CommentAndProject> selectSearchComment(PageInfo pi, SearchMsg search) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.selectSearchComments", search, rowBounds);
	}
	//댓글카테고리갯수
	@Override
	public int selectSearchCommentsCount(SearchMsg search) {
		return sqlSession.selectOne("memberMapper.selectSearchCommentsCount", search);
	}

	/*
	 * @Override public int searchPw(Member member) { // TODO Auto-generated method
	 * stub return 0; }
	 */
	@Override
	public String selectPw(Member member) {
		
		return sqlSession.selectOne("memberMapper.selectPw", member);
	}

	@Override
	public Object newPassword(Member member) {
		return sqlSession.update("memberMapper.updateRandomPw",member);
	}

	@Override
	public String searchPw(Member member) {
		
		return sqlSession.selectOne("memberMapper.searchPw",member);
	}
}
