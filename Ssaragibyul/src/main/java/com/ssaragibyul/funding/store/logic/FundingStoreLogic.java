package com.ssaragibyul.funding.store.logic;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssaragibyul.common.Reply;
import com.ssaragibyul.common.Search;
import com.ssaragibyul.funding.domain.Funding;
import com.ssaragibyul.funding.domain.FundingComments;
import com.ssaragibyul.funding.domain.FundingFile;
import com.ssaragibyul.funding.domain.FundingLike;
import com.ssaragibyul.funding.domain.FundingLog;
import com.ssaragibyul.funding.domain.FundingReport;
import com.ssaragibyul.funding.store.FundingStore;
import com.ssaragibyul.member.domain.Member;

@Repository
public class FundingStoreLogic implements FundingStore{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
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
		return sqlSession.update("fundingMapper.updateCount", projectNo);
	}

	@Override
	public ArrayList<Funding> printAllProject() {
		return (ArrayList)sqlSession.selectList("fundingMapper.selectFundingList");
	}//row bounds
	
	
	public ArrayList<Funding> printAllProjectEnd() {
		return (ArrayList)sqlSession.selectList("fundingMapper.selectFundingListEnd");
	}
	
	
	@Override
	public ArrayList<FundingFile> printAllProjectFile() {
		return (ArrayList)sqlSession.selectList("fundingMapper.selectFundingFileList");
	}

	@Override
	public ArrayList<FundingComments> printAllRCommnets(int boardNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Funding selectOne(int projectNo) {
		return sqlSession.selectOne("fundingMapper.selectOne", projectNo);
	}
	
	@Override
	public FundingFile selectOneFile(int projectNo) {
		return sqlSession.selectOne("fundingMapper.selectOneFile", projectNo);
	}


	@Override
	public int insertProject(Funding funding) {
		int result = sqlSession.insert("fundingMapper.insertFunding", funding);
		return result;
	}
	
	@Override
	public int insertProjectLog(FundingLog fundingLog) {
		int result = sqlSession.insert("fundingMapper.insertFundingLog", fundingLog);
		return result;
	}
	
	
	@Override
	public int insertProjectFile(FundingFile fundingFile) {
	int result = sqlSession.insert("fundingMapper.insertFundingFile", fundingFile);
	return result;
	}
	
	
	
	@Override
	public int updateProject_SumMoney(Funding funding) {
		int result = sqlSession.update("fundingMapper.updateFundingAddMoney", funding);
		return result;
	}
	
	@Override
	public int updateProject(Funding funding) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteProject(int projectNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertCommnets(Reply reply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateCommnets(Reply reply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteCommnets(Reply reply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int fundingStatusChange(int projectNo) {
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
	public int updateSuggest(Funding funding) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteSuggest(int projectNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Funding printOneSuggest(int projectNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Reply> selectAllReply(int projectNo) {
		return (ArrayList)sqlSession.selectList("fundingMapper.selectReplyList", projectNo);
	}
	
	@Override
	public int insertReply(Reply reply) {
		// TODO Auto-generated method stub
		return sqlSession.insert("fundingMapper.insertReply", reply);
	}


	@Override
	public int updateReply(Reply reply) {
		// TODO Auto-generated method stub
		return sqlSession.update("fundingMapper.updateReply", reply);
	}

	@Override
	public int deleteReply(Reply reply) {
		// TODO Auto-generated method stub
		return sqlSession.delete("fundingMapper.deleteReply", reply);
	}

	public int accusationInsert(FundingReport fundingReport) {
		// TODO Auto-generated method stub
		return sqlSession.delete("fundingMapper.reportInsert", fundingReport);
	}

	
	public int updateProject_Like(Funding funding) {
		return sqlSession.update("fundingMapper.updateFundingProjectLikeCol", funding);
	}	
	public int insertProjectLike(FundingLike fundingLike) {
		return sqlSession.insert("fundingMapper.insertProjectLike", fundingLike);
	}

	public ArrayList<Funding> selectSearchList_1(Search search) {
		return (ArrayList)sqlSession.selectList("fundingMapper.selectSearchList_1", search);
	}

	public ArrayList<Funding> selectSearchList_2(Search search) {
		return (ArrayList)sqlSession.selectList("fundingMapper.selectSearchList_2", search);
	}

	public ArrayList<Funding> printAllProjectByMoney() {
		return (ArrayList)sqlSession.selectList("fundingMapper.selectFundingList_Money");
	}

	public ArrayList<Funding> printAllProjectByLike() {
		return (ArrayList)sqlSession.selectList("fundingMapper.selectFundingList_Like");
	}

	public ArrayList<Funding> printAllProjectByMoneyEnd() {
		return (ArrayList)sqlSession.selectList("fundingMapper.selectFundingListEnd_Money");
	}

	public ArrayList<Funding> printAllProjectByLikeEnd() {
		return (ArrayList)sqlSession.selectList("fundingMapper.selectFundingListEnd_Like");
	}

	public ArrayList<Funding> printAllProjectLimit() {
		return (ArrayList)sqlSession.selectList("fundingMapper.selectAllFundProjectLimit");
	}

	public ArrayList<Funding> printAllProjectEndLimit() {
		return (ArrayList)sqlSession.selectList("fundingMapper.selectAllFundProjectEndLimit");
	}

	public ArrayList<FundingLike> selectOneLike(int projectNo) {
		return  (ArrayList)sqlSession.selectList("fundingMapper.selectOneLike", projectNo);
	}

	public Funding selectOneCombine(int projectNo) {
		return sqlSession.selectOne("fundingMapper.selectOneCombine", projectNo);
	}

	public FundingLog selectSponserNumber(int projectNo) {
		return sqlSession.selectOne("fundingMapper.countSponserNumber", projectNo);
	}

	public int updateProject_Like_Minus(Funding funding) {
		return sqlSession.update("fundingMapper.updateFundingProjectLikeCol_Minus", funding);
	}

	public int deleteProjectLike(FundingLike fundingLike) {
		return sqlSession.delete("fundingMapper.deleteProjectLike", fundingLike);
	}

	public ArrayList<FundingLog> selectFundingLogOne(int projectNo) {
		return (ArrayList)sqlSession.selectList("fundingMapper.selectFundingLogOne", projectNo);
	}

	public Member seletOneMemberList(Member member) {
		return sqlSession.selectOne("memberMapper.seletOneMemberList", member); 
	}

	
}
