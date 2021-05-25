package com.ssaragibyul.funding.service;

import java.util.ArrayList;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.common.Reply;
import com.ssaragibyul.donation.domain.Donation;
import com.ssaragibyul.donation.domain.DonationLike;
import com.ssaragibyul.funding.domain.Funding;
import com.ssaragibyul.funding.domain.FundingComments;
import com.ssaragibyul.funding.domain.FundingFile;

public interface FundingService {

	public int getListCountFuncing();

	public int likesStatus(int projectNo);
	
	public int plusLikes(String userId, int projectNo);

	public int updateLikes(String userId, int projectNo);
	
	public int minusLikes(String userId, int projectNo);
	
	public int addreadCountLike(int projectNo);

	public int addreadCountHit(int projectNo);

	public ArrayList<Funding> printAllProject();
	
	public ArrayList<FundingFile> printAllProjectFile();

	public ArrayList<FundingComments> printAllRCommnets(int projectNo);
	
	public Funding printOne(int projectNo);
	
	public FundingFile printOneFile(int projectNo);

	public int registerProject(Funding funding, FundingFile fundingFile);

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

	
}










