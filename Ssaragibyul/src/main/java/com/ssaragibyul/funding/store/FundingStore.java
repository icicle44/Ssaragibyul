package com.ssaragibyul.funding.store;

import java.util.ArrayList;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.common.Reply;
import com.ssaragibyul.donation.domain.Donation;
import com.ssaragibyul.funding.domain.Funding;
import com.ssaragibyul.funding.domain.FundingComments;

public interface FundingStore {

	public int selectListCount();

	public int likesStatus(int projectNo);
	
	public int plusLikes(String userId, int projectNo);

	public int updateLikes(String userId, int projectNo);
	
	public int minusLikes(String userId, int projectNo);
	
	public int addreadCountLike(int projectNo);

	public int addreadCountHit(int projectNo);

	public ArrayList<Funding> printAllProject(PageInfo pi);

	public ArrayList<FundingComments> printAllRCommnets(int boardNo);

	public Funding selectOne(int projectNo);

	public int insertProject(Funding funding);

	public int updateProject(Funding funding);

	public int deleteProject(int projectNo);

	public int insertCommnets(Reply reply);

	public int updateCommnets(Reply reply);

	public int deleteCommnets(Reply reply);

	public int fundingStatusChange(int projectNo);
	
	public int fundingSendMeaageToMaker(int projectNo);
	
	public int fundingJoin(int projectNo);
	
	public int fundingCancel(int projectNo);
	
	public void achieve(int projectNo);

	public void dateRemain(int projectNo);

	public void participant(int projectNo);

	public ArrayList<Funding> printAllRecommend(int projectNo);

	public int updateSuggest(Funding funding);

	public int deleteSuggest(int projectNo);

	public Funding printOneSuggest(int projectNo);
}










