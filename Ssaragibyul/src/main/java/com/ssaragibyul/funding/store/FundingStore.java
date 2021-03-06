package com.ssaragibyul.funding.store;

import java.util.ArrayList;
import java.util.HashMap;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.common.Reply;
import com.ssaragibyul.common.Search;
import com.ssaragibyul.funding.domain.Funding;
import com.ssaragibyul.funding.domain.FundingComments;
import com.ssaragibyul.funding.domain.FundingFile;
import com.ssaragibyul.funding.domain.FundingLike;
import com.ssaragibyul.funding.domain.FundingLog;
import com.ssaragibyul.funding.domain.FundingReport;
import com.ssaragibyul.member.domain.Member;

public interface FundingStore {

	public int selectListCount(String userId);
	public int selectListCountLike(String userId);
	public int selectListCountProp(String userId);

	public int likesStatus(int projectNo);
	
	public int plusLikes(String userId, int projectNo);

	public int updateLikes(String userId, int projectNo);
	
	public int minusLikes(String userId, int projectNo);
	
	public int addreadCountLike(int projectNo);

	public int addreadCountHit(int projectNo);

	public ArrayList<Funding> printAllProject();
	public ArrayList<Funding> printAllProjectEnd();
	
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
	
	public ArrayList<Funding> selectSearchList_1(Search search);
	public ArrayList<Funding> selectSearchList_2(Search search);
	
	public ArrayList<Funding> printAllProjectByMoney();
	public ArrayList<Funding> printAllProjectByLike();
	public ArrayList<Funding> printAllProjectByMoneyEnd();
	public ArrayList<Funding> printAllProjectByLikeEnd();
	public ArrayList<Funding> printAllProjectLimit();
	public ArrayList<Funding> printAllProjectEndLimit();
	
	public ArrayList<FundingLike> selectOneLike(int projectNo);
	public Funding selectOneCombine(int projectNo);
	public FundingLog selectSponserNumber(int projectNo);
	
	public int updateProject_Like_Minus(Funding funding);
	public int deleteProjectLike(FundingLike fundingLike);
	public ArrayList<FundingLog> selectFundingLogOne(int projectNo);
	public Member seletOneMemberList(Member member);
	public FundingLog calListNumberMyFunding(String userId);
	public ArrayList<FundingLog> selectMyFunding(String userId, PageInfo pi);
	public ArrayList<FundingLog> selectMyFundingLike(String userId, PageInfo pi);
	public FundingLike calListNumberLikeFunding(String userId);
	public ArrayList<FundingLike> selectLikeFunding(String userId, PageInfo pi);
	public ArrayList<FundingLike> selectLikeFundingLike(String userId, PageInfo pi);
	public ArrayList<FundingLike> selectLikeFundingMoney(String userId, PageInfo pi);
	public Funding calListNumberProspFunding(String userId);
	public ArrayList<Funding> selectPropFunding(String userId, PageInfo pi);
	public ArrayList<Funding> selectPropFundingLike(String userId, PageInfo pi);
	public ArrayList<Funding> selectPropFundingMoney(String userId, PageInfo pi);
	public FundingLog selectOneProject(HashMap<String, String> fmap);
	public int updateProjectLog(FundingLog fundingLog);
	public int updateProject_SumMoneyMinus(Funding funding);
	public Funding selectOneProjectforModifty(int projectNo);
	public int fundingPropUpdate_Porejct(Funding funding);
	public int fundingPropUpdate_File(FundingFile fundingFile);
}












