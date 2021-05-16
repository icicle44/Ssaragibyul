package com.ssaragibyul.funding.store;

import java.util.ArrayList;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.common.Reply;
import com.ssaragibyul.funding.domain.Funding;

public interface FundingStore {

	public int selectListCount();

	public int likeStatus(int projectNo);

	public int addreadCountLike(int projectNo);

	public int addreadCountHit(int projectNo);

	public ArrayList<Funding> printAllProject(PageInfo pi);

	public ArrayList<Reply> selectAllReply(int boardNo);

	public Funding selectOne(int projectNo);

	public int insertProject(Funding funding);

	public int updateProject(Funding funding);

	public int deleteProject(int projectNo);

	public int insertReply(Reply reply);

	public int updateReply(Reply reply);

	public int deleteReply(Reply reply);

	public int fundingStatusChange(int projectNo);
	
	public int fundingSendMeaageToMaker(int projectNo);
	
	public int fundingJoin(int projectNo);
	
	public int fundingCancel(int projectNo);
}










