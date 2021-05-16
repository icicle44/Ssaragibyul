package com.ssaragibyul.funding.service;

import java.util.ArrayList;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.common.Reply;
import com.ssaragibyul.funding.domain.Funding;

public interface FundingService {

	public int getListCountFuncing();

	public int likeStatus(int projectNo);

	public int addreadCountLike(int projectNo);

	public int addreadCountHit(int projectNo);

	public ArrayList<Funding> printAllProject(PageInfo pi);

	public ArrayList<Reply> printAllReply(int projectNo);

	public Funding printOne(int projectNo);

	public int registerProject(Funding funding);

	public int modifyProject(Funding funding);

	public int removeProject(int projectNo);

	public int registerReply(Reply reply);

	public int modifyReply(Reply reply);

	public int removeReply(Reply reply);

	public int fundingStatusChange(int projectNo);
	
	public int fundingChoseProductNumber(int projectNo);
	
	public int fundingSendMeaageToMaker(int projectNo);
	
	public int fundingJoin(int projectNo);
	
	public int fundingCancel(int projectNo);
	
}










