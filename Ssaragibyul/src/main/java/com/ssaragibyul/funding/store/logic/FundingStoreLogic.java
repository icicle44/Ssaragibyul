package com.ssaragibyul.funding.store.logic;

import java.util.ArrayList;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.common.Reply;
import com.ssaragibyul.funding.domain.Funding;
import com.ssaragibyul.funding.store.FundingStore;

public class FundingStoreLogic implements FundingStore{

	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int likeStatus(int projectNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int addreadCountLike(int projectNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int addreadCountHit(int projectNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Funding> printAllProject(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Reply> selectAllReply(int boardNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Funding selectOne(int projectNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertProject(Funding funding) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateProject(Funding funding) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteProject(int projectNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertReply(Reply reply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateReply(Reply reply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReply(Reply reply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int fundingStatusChange(int projectNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int fundingSendMeaageToMaker(int projectNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int fundingJoin(int projectNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int fundingCancel(int projectNo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
