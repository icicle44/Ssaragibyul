package com.ssaragibyul.funding.store;

import java.util.ArrayList;

import com.ssaragibyul.common.Reply;
import com.ssaragibyul.funding.domain.Funding;
import com.ssaragibyul.funding.domain.FundingComments;
import com.ssaragibyul.funding.domain.FundingFile;
import com.ssaragibyul.funding.domain.FundingLike;
import com.ssaragibyul.funding.domain.FundingLog;
import com.ssaragibyul.funding.domain.FundingReport;

public interface FundingStore {

	public int selectListCount();

	public int likesStatus(int projectNo);
	
	public int plusLikes(String userId, int projectNo);

	public int updateLikes(String userId, int projectNo);
	
	public int minusLikes(String userId, int projectNo);
	
	public int addreadCountLike(int projectNo);

	public int addreadCountHit(int projectNo);

	public ArrayList<Funding> printAllProject();
	
	public ArrayList<FundingFile> printAllProjectFile();

	public ArrayList<FundingComments> printAllRCommnets(int boardNo);

	public Funding selectOne(int projectNo);
	
	public FundingFile selectOneFile(int projectNo);

	public int insertProject(Funding funding);
	
	public int insertProjectLog(FundingLog fundingLog);

	public int updateProject(Funding funding);
	
	public int updateProject_SumMoney(Funding funding);

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
	
	public int insertProjectFile(FundingFile fundingFile);
	
	public ArrayList<Reply> selectAllReply(int projectNo);
	
	public int insertReply(Reply reply);
	
	public int updateReply(Reply reply);
	
	public int deleteReply(Reply reply);
	
	public int accusationInsert(FundingReport fundingReport);
	
	public int updateProject_Like(Funding funding);
	
	public int insertProjectLike(FundingLike fundingLike);
}










