package com.ssaragibyul.funding.service.logic;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssaragibyul.common.Reply;
import com.ssaragibyul.common.Search;
import com.ssaragibyul.funding.domain.Funding;
import com.ssaragibyul.funding.domain.FundingComments;
import com.ssaragibyul.funding.domain.FundingFile;
import com.ssaragibyul.funding.domain.FundingLike;
import com.ssaragibyul.funding.domain.FundingLog;
import com.ssaragibyul.funding.domain.FundingReport;
import com.ssaragibyul.funding.service.FundingService;
import com.ssaragibyul.funding.store.logic.FundingStoreLogic;
import com.ssaragibyul.member.domain.Member;
import com.ssaragibyul.point.service.PointService;

@Service
public class FundingSerivceImpl implements FundingService {
	
	@Autowired
	private FundingStoreLogic fStore;
	@Autowired
	private PointService pntService; // 선미누나가 한거_ 포인트 서비스 에서 메소드 불러와서 seirviceImpl에서 사용.
	
	//기존에 만들어놨던거 거의 안씀... 나중에 지울 예정. 처음에 클래스 다이어그램할때 기부쪽 클래스왜 최대한 맞췄는데 오재승 개인으로 추가 한게 많음. 삭제 한거는 없음.
	
	

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
	
	

//	@Override
//	public ArrayList<Funding> printAllProject() {
//		ArrayList<Funding> fList = fStore.printAllProject();
//		return fList;					//기존거 백업
//	}
					// NEW
	@Override
	public ArrayList<Funding> printAllProject() {
		ArrayList<Funding> fListandFile = fStore.printAllProject();
		return fListandFile;
	}
	
	@Override
	public ArrayList<Funding> printAllProjectEnd() {
		ArrayList<Funding> fListandFileEnd = fStore.printAllProjectEnd();
		return fListandFileEnd;
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
	}						//한 컨트롤러에서 2개의 store메소드 사용 컨트롤러에서 써두 되고 서비스IMPI에서 써두 됨.
	
	@Override
	public int fundingLikeRegister(Funding funding, FundingLike fundingLike) {
		int result = fStore.updateProject_Like(funding);
		int fResult = 0;
		if(result>0) {
			fResult = fStore.insertProjectLike(fundingLike);
		}
		return fResult;
	}
	public int fundingLikeRemove(Funding funding, FundingLike fundingLike) {
		int result = fStore.updateProject_Like_Minus(funding);
		int fResult = 0;
		if(result>0) {
			fResult = fStore.deleteProjectLike(fundingLike);
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
	
	@Override
	public ArrayList<Funding> printSearchAll_1(Search search) {
		ArrayList<Funding> searchList1 = fStore.selectSearchList_1(search);
		return searchList1;
	}
	
	@Override
	public ArrayList<Funding> printSearchAll_2(Search search) {
		ArrayList<Funding> searchList2 = fStore.selectSearchList_2(search);
		return searchList2;
	}
		
	@Override
	public ArrayList<Funding> printAllProjectForMoney() {
		ArrayList<Funding> fListandFile = fStore.printAllProjectByMoney();
		return fListandFile;
	}
	
	@Override
	public ArrayList<Funding> printAllProjectForLike() {
		ArrayList<Funding> fListandFile = fStore.printAllProjectByLike();
		return fListandFile;
	}
	
	@Override
	public ArrayList<Funding> printAllProjectEndForMoeny() {
		ArrayList<Funding> fListandFileEnd = fStore.printAllProjectByMoneyEnd();
		return fListandFileEnd;
	}

	@Override
	public ArrayList<Funding> printAllProjectEndForLike() {
		ArrayList<Funding> fListandFileEnd = fStore.printAllProjectByLikeEnd();
		return fListandFileEnd;
	}
	
	@Override
	public ArrayList<Funding> printAllProjectLimit() {
		ArrayList<Funding> fListandFile = fStore.printAllProjectLimit();
		return fListandFile;
	}
	
	@Override
	public ArrayList<Funding> printAllProjectEndLimit() {
		ArrayList<Funding> fListandFileEnd = fStore.printAllProjectEndLimit();
		return fListandFileEnd;
	}
	
	@Override
	public ArrayList<FundingLike> printOneLike(int projectNo) {
		return fStore.selectOneLike(projectNo);
	}
	
	@Override
	public Funding printOneCombine(int projectNo) {
		return fStore.selectOneCombine(projectNo);
	}
	
	@Override
	public FundingLog printSponserNumber(int projectNo) {
		return fStore.selectSponserNumber(projectNo);
	}
	
	public ArrayList<FundingLog> printFundingLogOne(int projectNo) {
		return fStore.selectFundingLogOne(projectNo);
	}	
	public Member printMemberList(Member member) {
		return fStore.seletOneMemberList(member);
	}
}
