package com.ssaragibyul.funding.store.logic;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssaragibyul.common.PageInfo;
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
	public int selectListCount(String userId) {
		return sqlSession.selectOne("fundingMapper.selectListCountMy", userId);
	}
	@Override
	public int selectListCountLike(String userId) {
		return sqlSession.selectOne("fundingMapper.selectListCountLike", userId);
	}
	@Override
	public int selectListCountProp(String userId) {
		return sqlSession.selectOne("fundingMapper.selectListCountProp", userId);
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

	public ArrayList<FundingLog> selectMyFunding(String userId, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("fundingMapper.selectMyFunding", userId, rowBounds);
	}
//	return (ArrayList)sqlSession.selectList("fundingMapper.selectMyFunding", member, pi, null, rowBounds);   ???

	public ArrayList<FundingLog> selectMyFundingLike(String userId, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("fundingMapper.selectMyFundingLike", userId, rowBounds);
	}

	public FundingLog calListNumberMyFunding(String userId) {
		return sqlSession.selectOne("fundingMapper.calListNumberMyFunding", userId); 
	}
	
	public ArrayList<FundingLog> selectMyFundingMoney(String userId, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("fundingMapper.selectMyFundingMoney", userId, rowBounds);
	}

	public FundingLike calListNumberLikeFunding(String userId) {
		return sqlSession.selectOne("fundingMapper.calListNumberLikeFunding", userId);
	}

	public ArrayList<FundingLike> selectLikeFunding(String userId, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("fundingMapper.selectLikeFunding", userId, rowBounds);
	}

	public ArrayList<FundingLike> selectLikeFundingLike(String userId, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("fundingMapper.selectLikeFundingLike", userId, rowBounds);
	}

	public ArrayList<FundingLike> selectLikeFundingMoney(String userId, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("fundingMapper.selectLikeFundingMoney", userId, rowBounds);
	}

	public Funding calListNumberProspFunding(String userId) {
		return sqlSession.selectOne("fundingMapper.calListNumberProspFunding", userId);
	}

	public ArrayList<Funding> selectPropFunding(String userId, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("fundingMapper.selectPropFunding", userId, rowBounds);
	}

	public ArrayList<Funding> selectPropFundingLike(String userId, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("fundingMapper.selectPropFundingLike", userId, rowBounds);
	}

	public ArrayList<Funding> selectPropFundingMoney(String userId, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("fundingMapper.selectPropFundingMoney", userId, rowBounds);
	}

	public ArrayList<FundingLog> selectAllSponserList(int projectNo) {
		return (ArrayList)sqlSession.selectList("fundingMapper.selectAllSponserList", projectNo);
	}
	public FundingLog selectOneProject(HashMap<String, String> fmap) {
		return sqlSession.selectOne("fundingMapper.selectOneProject", fmap); 
	}
	public int updateProjectLog(FundingLog fundingLog) {
		return sqlSession.update("fundingMapper.updateProjectLogCancel", fundingLog);
	}
	public int updateProject_SumMoneyMinus(Funding funding) {
		return sqlSession.update("fundingMapper.updateProject_SumMoneyMinus", funding);
	}
	public Funding selectOneProjectforModifty(int projectNo) {
		Funding funding = sqlSession.selectOne("fundingMapper.selectOneProjectforModifty", projectNo);
		return funding;
	}
	public int fundingPropUpdate_Porejct(Funding funding) {
		return sqlSession.update("fundingMapper.fundingPropUpdate_Porejct", funding);
	}
	public int fundingPropUpdate_File(FundingFile fundingFile) {
		return sqlSession.update("fundingMapper.fundingPropUpdate_File", fundingFile);
	}

	
}
