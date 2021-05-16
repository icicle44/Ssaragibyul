package com.ssaragibyul.visit.service.serviceLogic;

import java.util.ArrayList;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.common.Reply;
import com.ssaragibyul.visit.domain.Visit;
import com.ssaragibyul.visit.service.VisitService;

public class VisitServiceImpl implements VisitService{

	@Override
	public int getListCount() {
		
		return 0;
	}

	@Override
	public ArrayList<Visit> printAll(PageInfo pi) {
		
		return null;
	}

	@Override
	public int addReadCount(int visitNo) {
		
		return 0;
	}

	@Override
	public Visit printOne(int visitNo) {
		
		return null;
	}

	@Override
	public int registerVisit(Visit visit) {
		
		return 0;
	}

	@Override
	public int modifyVisit(Visit visit) {
		
		return 0;
	}

	@Override
	public int removeVisit(int visitNo) {
		
		return 0;
	}

	@Override
	public ArrayList<Reply> printAllReply(int visitNo) {
		
		return null;
	}

	@Override
	public int registerReply(Reply reply) {
		
		return 0;
	}

	@Override
	public int modifyReply(Reply reply) {
		
		return 0;
	}

	@Override
	public int removeReply(Reply reply) {
		
		return 0;
	}

}
