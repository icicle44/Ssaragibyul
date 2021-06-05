package com.ssaragibyul.visit.store;

import java.util.ArrayList;
import java.util.List;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.common.Reply;
import com.ssaragibyul.visit.domain.Visit;
import com.ssaragibyul.visit.domain.VisitLike;

public interface VisitStore {
	public int selectListCount();
	public ArrayList<Visit> selectAllList();
	public List<Visit> selectScroll(Integer visitNoToStart);
	public int addHitsCount(int visitNo);
	public Integer getHitsCount(int visitNo);
	public Visit selectOne(int visitNo);
	public int insertVisit(Visit visit);
	public int updateVisit(Visit visit);
	public int updateVisitFile(Visit visit);
	public int deleteVisit(int visitNo);
	
	public ArrayList<Reply> selectAllReply(int visitNo);
	public int insertReply(Reply reply);
	public int updateReply(Reply reply);
	public int deleteReply(int replyNo);
	public Integer selectLastNo();
	
	public int plusLikesCount(VisitLike likes);
	public int minusLikesCount(VisitLike likes);
	public int getLikes(int visitNo);
	public String checkLikes(VisitLike likes);
}
