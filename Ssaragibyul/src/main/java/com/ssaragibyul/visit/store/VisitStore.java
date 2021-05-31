package com.ssaragibyul.visit.store;

import java.util.ArrayList;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.common.Reply;
import com.ssaragibyul.visit.domain.Visit;

public interface VisitStore {
	public int selectListCount();
	public ArrayList<Visit> selectAllList();
	public int addReadCount(int visitNo);
	
	public Visit selectOne(int visitNo);
	public int insertVisit(Visit visit);
	public int updateVisit(Visit visit);
	public int deleteVisit(int visitNo);
	
	public ArrayList<Reply> selectAllReply(int visitNo);
	public int insertReply(Reply reply);
	public int updateReply(Reply reply);
	public int deleteReply(int replyNo);
}
