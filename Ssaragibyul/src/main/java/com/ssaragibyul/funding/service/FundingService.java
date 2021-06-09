package com.ssaragibyul.funding.service;

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

public interface FundingService {

	public int getListCountFuncing();

	public int likesStatus(int projectNo);
	
	public int plusLikes(String userId, int projectNo);

	public int updateLikes(String userId, int projectNo);
	
	public int minusLikes(String userId, int projectNo);
	
	public int addreadCountLike(int projectNo);

	public int addreadCountHit(int projectNo);

	public ArrayList<Funding> printAllProject();
	public ArrayList<Funding> printAllProjectEnd();
	
	public ArrayList<FundingFile> printAllProjectFile();

	public ArrayList<FundingComments> printAllRCommnets(int projectNo);
	
	public Funding printOne(int projectNo);
	
	public FundingFile printOneFile(int projectNo);

	public int registerProject(Funding funding, FundingFile fundingFile);
	
	public int registerFundingLog(FundingLog fundingLog, Funding funding);

	public int modifyProject(Funding funding);

	public int removeProject(int projectNo);

	public int registerCommnets(Reply reply);

	public int modifyCommnets(Reply reply);

	public int removeCommnets(Reply reply);

	public int fundingStatusChange(int projectNo);
	
	public int fundingChoseProductNumber(int projectNo);
	
	public int fundingSendMeaageToMaker(int projectNo);
	
	public int fundingJoin(int projectNo);
	
	public int fundingCancel(int projectNo);
	
	public void achieve(int projectNo);

	public void dateRemain(int projectNo);

	public void participant(int projectNo);

	public ArrayList<Funding> printAllRecommend(int projectNo);

	public int modifySuggest(Funding funding);

	public int removeSuggest(int projectNo);

	public Funding printOneSuggest(int projectNo);

	public ArrayList<Reply> printAllReply(int projectNo);
	
	public int registerReply(Reply reply);
	
	public int modifyReply(Reply reply);

	public int removeReply(Reply reply);

	public int accusationRegister(FundingReport fundingReport);

	public int fundingLikeRegister(Funding funding, FundingLike fundingLike);
	
	public int fundingLikeRemove(Funding funding, FundingLike fundingLike);

	public ArrayList<Funding> printSearchAll_1(Search search);

	public ArrayList<Funding> printSearchAll_2(Search search);

	public ArrayList<Funding> printAllProjectForMoney();

	public ArrayList<Funding> printAllProjectForLike();

	public ArrayList<Funding> printAllProjectEndForMoeny();

	public ArrayList<Funding> printAllProjectEndForLike();
	
	public ArrayList<Funding> printAllProjectLimit();
	public ArrayList<Funding> printAllProjectEndLimit();

	public ArrayList<FundingLike>  printOneLike(int projectNo);

	public Funding printOneCombine(int projectNo);

	public FundingLog printSponserNumber(int projectNo);

	public ArrayList<FundingLog> printFundingLogOne(int projectNo);

	public Member printMemberList(Member member);

	public ArrayList<FundingLog> printMyFunding(String userId, PageInfo pi);

	public int getListCount(String userId);
	
	public int getListCountLike(String userId);
	
	public int getListCountProp(String userId);

	public ArrayList<FundingLog> printMyFundingLike(String userId, PageInfo pi);

	public FundingLog calListNumberMyFunding(String userId);
	
	public ArrayList<FundingLog> printMyFundingMoney(String userId, PageInfo pi);

	public FundingLike calListNumberLikeFunding(String userId);

	public ArrayList<FundingLike> printLikeFunding(String userId, PageInfo pi);

	public ArrayList<FundingLike> printLikeFundingLike(String userId, PageInfo pi);

	public ArrayList<FundingLike> printLikeFundingMoney(String userId, PageInfo pi);

	public Funding calListNumberProspFunding(String userId);

	public ArrayList<Funding> printPropFunding(String userId, PageInfo pi);

	public ArrayList<Funding> printPropFundingLike(String userId, PageInfo pi);

	public ArrayList<Funding> printPropFundingMoney(String userId, PageInfo pi);

	public ArrayList<FundingLog> printAllSponserList(int projectNo);

	public FundingLog printOneProject(HashMap<String, String> fmap);

	public int fundingCancelComplete(FundingLog fundingLog, Funding funding);


	



	
}













