package com.ssaragibyul.member.store;

import java.util.ArrayList;
import java.util.HashMap;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.independence.domain.Independence;
import com.ssaragibyul.member.domain.CommentAndProject;
import com.ssaragibyul.member.domain.Member;
import com.ssaragibyul.visit.domain.Visit;


public interface MemberStore {
	public Member selectOneMember(Member member);
	public int checkIdDup(String userId);
	public int insertMember(Member member);
	public int updateMember(Member member);
	public int removeMember(String userId);
	public String searchId(HashMap<String, String>param);
	public Member refreshNickName();
	public Independence mypage(String userId);
	public ArrayList<Visit> selectAllList(PageInfo pi, String userId);
	public ArrayList<CommentAndProject> selectAllComments(PageInfo pi, String userId);
	public int getcommentsListCount(String userId);
	public int deleteComment(HashMap<String, String> dMap);
	public int updateComment(HashMap<String, String> mMap);
	public int getListCount(String userId);
}
