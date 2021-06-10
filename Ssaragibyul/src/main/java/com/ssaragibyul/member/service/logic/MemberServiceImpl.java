package com.ssaragibyul.member.service.logic;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.independence.domain.Independence;
import com.ssaragibyul.member.domain.CommentAndProject;
import com.ssaragibyul.member.domain.Member;
import com.ssaragibyul.member.service.MemberService;
import com.ssaragibyul.member.store.MemberStore;
import com.ssaragibyul.message.domain.SearchMsg;
import com.ssaragibyul.visit.domain.Visit;

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
	public Member refreshNickName() {
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
	public String searchId(HashMap<String, String>param){
		return mStore.searchId(param);
	}

	@Override
	public Independence mypage(String userId) {
		return mStore.mypage(userId);
	}

	//댓글 리스트
	@Override
	public ArrayList<CommentAndProject> printAllComment(PageInfo pi, String userId) {
		return mStore.selectAllComments(pi, userId);
	}

	//댓글 리스트 갯수
	@Override
	public int getcommentsListCount(String userId) {
		return mStore.getcommentsListCount(userId);
	}

	//댓글 삭제
	@Override
	public int deleteComment(HashMap<String, String> dMap) {
		return mStore.deleteComment(dMap);
	}

	@Override
	public int modifyComment(HashMap<String, String> mMap) {
		return mStore.updateComment(mMap);
	}
	/*
	 * @Override public int searchPw(String userPw) { // TODO Auto-generated method
	 * stub return 0; }
	 */
	// 내가 쓴 게시글 모아보기
	@Override
	public ArrayList<Visit> printAllList(PageInfo pi, String userId) {
		return mStore.selectAllList(pi, userId);
	}

	@Override
	public int getMyListCount(String userId) {
		return mStore.getListCount(userId);
	}

	//댓글카테고리검색
	@Override
	public ArrayList<CommentAndProject> printSearchComment(PageInfo pi, SearchMsg search) {
		return mStore.selectSearchComment(pi, search);
	}
	//댓글카테고리갯수
	@Override
	public int getSearchCommentsCount(SearchMsg search) {
		return mStore.selectSearchCommentsCount(search);
	}
}
