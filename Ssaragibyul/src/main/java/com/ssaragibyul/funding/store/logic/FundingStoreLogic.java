package com.ssaragibyul.funding.store.logic;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.common.Reply;
import com.ssaragibyul.donation.domain.Donation;
import com.ssaragibyul.funding.domain.Funding;
import com.ssaragibyul.funding.domain.FundingComments;
import com.ssaragibyul.funding.domain.FundingFile;
import com.ssaragibyul.funding.domain.FundingLog;
import com.ssaragibyul.funding.store.FundingStore;
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
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Funding> printAllProject() {
		return (ArrayList)sqlSession.selectList("fundingMapper.selectFundingList");
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

}
