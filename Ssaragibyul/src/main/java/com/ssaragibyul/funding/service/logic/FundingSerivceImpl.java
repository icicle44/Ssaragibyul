package com.ssaragibyul.funding.service.logic;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssaragibyul.common.Reply;
import com.ssaragibyul.funding.domain.Funding;
import com.ssaragibyul.funding.domain.FundingComments;
import com.ssaragibyul.funding.domain.FundingFile;
import com.ssaragibyul.funding.domain.FundingLike;
import com.ssaragibyul.funding.domain.FundingLog;
import com.ssaragibyul.funding.domain.FundingReport;
import com.ssaragibyul.funding.service.FundingService;
import com.ssaragibyul.funding.store.logic.FundingStoreLogic;
import com.ssaragibyul.point.service.PointService;

@Service
public class FundingSerivceImpl implements FundingService {
	
	@Autowired
	private FundingStoreLogic fStore;
	@Autowired
	private PointService pntService;

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
		return fStore.addreadCountHit(projectNo);
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
	public int fundingLikeRegister(Funding funding, FundingLike fundingLike) {
		int result = fStore.updateProject_Like(funding);
		int fResult = 0;
		if(result>0) {
			fResult = fStore.insertProjectLike(fundingLike);
		}
		return fResult;
	}
	
	
	@Override
	public int registerFundingLog(FundingLog fundingLog, Funding funding) {
		int result = fStore.insertProjectLog(fundingLog);
		int fResult = 0;
		 int pntResult = 0;
	      if(result>0) {
		         fResult = fStore.updateProject_SumMoney(funding);
		         if(fResult > 0) {
		            pntResult = pntService.registerNegPoint(fundingLog);
		         }
		      }
		return pntResult;
	}
	
	
	@Override
	public int accusationRegister(FundingReport fundingReport) {
		return fStore.accusationInsert(fundingReport);
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
	@Override
	public ArrayList<Reply> printAllReply(int projectNo) {
		return fStore.selectAllReply(projectNo);
	}

	@Override
	public int registerReply(Reply reply) {
		return fStore.insertReply(reply);
	}

	@Override
	public int modifyReply(Reply reply) {
		return fStore.updateReply(reply);
	}

	@Override
	public int removeReply(Reply reply) {
		return fStore.deleteReply(reply);
	}
	

}
