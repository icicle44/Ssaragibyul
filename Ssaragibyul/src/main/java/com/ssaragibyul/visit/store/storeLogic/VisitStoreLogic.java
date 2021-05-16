package com.ssaragibyul.visit.store.storeLogic;

import java.util.ArrayList;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.common.Reply;
import com.ssaragibyul.visit.domain.Visit;
import com.ssaragibyul.visit.store.VisitStore;

public class VisitStoreLogic implements VisitStore{

	@Override
	public int selectListCount() {
		
		return 0;
	}

	@Override
	public ArrayList<Visit> selectAllList(PageInfo pi) {
		
		return null;
	}

	@Override
	public int addReadCount(int visitNo) {
		
		return 0;
	}

	@Override
	public Visit selectOne(int visitNo) {
		
		return null;
	}

	@Override
	public int insertVisit(Visit visit) {
		
		return 0;
	}

	@Override
	public int updateVisit(Visit visit) {
		
		return 0;
	}

	@Override
	public int deleteVisit(int VisitNo) {
		
		return 0;
	}

	@Override
	public ArrayList<Reply> selectAllReply(int VisitNo) {
		
		return null;
	}

	@Override
	public int insertReply(Reply reply) {
		
		return 0;
	}

	@Override
	public int updateReply(Reply reply) {
		
		return 0;
	}

	@Override
	public int deleteReply(Reply reply) {
		
		return 0;
	}

}
