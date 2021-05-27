package com.ssaragibyul.funding.service.logic;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.common.Reply;
import com.ssaragibyul.donation.domain.Donation;
import com.ssaragibyul.funding.domain.Funding;
import com.ssaragibyul.funding.domain.FundingComments;
import com.ssaragibyul.funding.domain.FundingFile;
import com.ssaragibyul.funding.domain.FundingLog;
import com.ssaragibyul.funding.service.FundingService;
import com.ssaragibyul.funding.store.logic.FundingStoreLogic;
@Service
public class FundingSerivceImpl implements FundingService {
	
	@Autowired
	private FundingStoreLogic fStore;

	@Override
	public int getListCountFuncing() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int likesStatus(int projectNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int plusLikes(String userId, int projectNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateLikes(String userId, int projectNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int minusLikes(String userId, int projectNo) {
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
	public ArrayList<Funding> printAllProject() {
		ArrayList<Funding> fList = fStore.printAllProject();
		return fList;
	}
	@Override
	public ArrayList<FundingFile> printAllProjectFile() {
		ArrayList<FundingFile> fListFile = fStore.printAllProjectFile();
		return fListFile;
	}

	@Override
	public ArrayList<FundingComments> printAllRCommnets(int projectNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Funding printOne(int projectNo) {
		return fStore.selectOne(projectNo);
	}
	@Override
	public FundingFile printOneFile(int projectNo) {
		return fStore.selectOneFile(projectNo);
	}
	
	@Override
	public int registerProject(Funding funding, FundingFile fundingFile) {
		int result = fStore.insertProject(funding);
		int fResult = 0;
		if(result>0) {
			fResult = fStore.insertProjectFile(fundingFile);
		}
		return fResult;
	}
	@Override
	public int registerFundingLog(FundingLog fundingLog, Funding funding) {
		int result = fStore.insertProjectLog(fundingLog);
		int fResult = 0;
		if(result>0) {
			fResult = fStore.updateProject_SumMoney(funding);
		}
		return fResult;
	}

	@Override
	public int modifyProject(Funding funding) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int removeProject(int projectNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int registerCommnets(Reply reply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyCommnets(Reply reply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int removeCommnets(Reply reply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int fundingStatusChange(int projectNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int fundingChoseProductNumber(int projectNo) {
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

	@Override
	public void achieve(int projectNo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void dateRemain(int projectNo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void participant(int projectNo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ArrayList<Funding> printAllRecommend(int projectNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int modifySuggest(Funding funding) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int removeSuggest(int projectNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Funding printOneSuggest(int projectNo) {
		// TODO Auto-generated method stub
		return null;
	}

}
