package com.ssaragibyul.donation.store.logic;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.common.Reply;
import com.ssaragibyul.donation.domain.Donation;
import com.ssaragibyul.donation.domain.DonationComments;
import com.ssaragibyul.donation.domain.DonationFile;
import com.ssaragibyul.donation.domain.DonationLike;
import com.ssaragibyul.donation.domain.DonationLog;
import com.ssaragibyul.donation.domain.DonationReport;
import com.ssaragibyul.donation.store.DonationStore;

@Repository
public class DonationStoreLogic implements DonationStore{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 기부리스트
	@Override
	public ArrayList<Donation> printAllProject() {
		return (ArrayList)sqlSession.selectList("donationMapper.selectDonationList");
	}

	@Override
	public ArrayList<Donation> printAllProjectLimit() {
		return (ArrayList)sqlSession.selectList("donationMapper.selectDonationListLimit");
	}
	
	@Override
	public ArrayList<Donation> printAllProjectEnd() {
		return (ArrayList)sqlSession.selectList("donationMapper.selectDonationListEnd");
	}
	
	@Override
	public ArrayList<Donation> printAllProjectEndLimit() {
		return (ArrayList)sqlSession.selectList("donationMapper.selectDonationListEndLimit");
	}

	// 기부 제안 등록
	@Override
	public int insertDonation(Donation donation) {
		return sqlSession.insert("donationMapper.insertDonation", donation);
	}
	
	// 기부 제안 파일 등록
	@Override
	public int insertDonationFile(DonationFile donationFile) {
		int result = sqlSession.insert("donationMapper.insertDonationFile", donationFile);
		return result;
	}

	
	// 기부 참여하기
	@Override
	public Donation printOne(int projectNo) {
		return sqlSession.selectOne("donationMapper.selectOne", projectNo);
	}
	
	
	// 좋아요1
	@Override
	public int updateLike(Donation donation) {
		return sqlSession.update("donationMapper.updateLike", donation);
	}
	
	// 좋아요2
	@Override
	public int insertLike(DonationLike donationLike) {
		return sqlSession.insert("donationMapper.insertLike", donationLike);
	}
	
	// 좋아요 취소(감소)
	@Override
	public int updateLike_Minus(Donation donation) {
		return sqlSession.update("donationMapper.updateLikeCol_Minus", donation);
	}
	
	// 좋아요 취소
	@Override
	public int deleteLike(DonationLike donationLike) {
		return sqlSession.delete("donationMapper.deleteLike", donationLike);
	}

	// 기부 상세보기
	@Override
	public int addReadCount(int projectNo) {
		return sqlSession.update("donationMapper.updateCount", projectNo);
	}
	
	// 기부 상세보기
	@Override
	public DonationFile selectOneFile(int projectNo) {
		return sqlSession.selectOne("donationMapper.selectOneFile", projectNo);
	}
	
	// 기부 상세보기
	@Override
	public ArrayList<DonationLike> selectOneLike(int projectNo) {
		return (ArrayList)sqlSession.selectList("donationMapper.selectOneLike", projectNo);
	}

	// 후원자 수 카운트
	@Override
	public DonationLog selectSponserNumber(int projectNo) {
		return sqlSession.selectOne("donationMapper.countSponserNumber", projectNo);
	}
	
	// 댓글 작성
	@Override
	public int insertReply(Reply reply) {
		return sqlSession.insert("donationMapper.insertReply", reply);
	}
	
	// 댓글 목록 출력
	@Override
	public ArrayList<Reply> selectAllReply(int projectNo) {
		return (ArrayList)sqlSession.selectList("donationMapper.selectReplyList", projectNo);
	}
	
	// 댓글 수정
	@Override
	public int updateReply(Reply reply) {
		return sqlSession.update("donationMapper.updateReply", reply);
	}

	// 댓글 삭제
	@Override
	public int deleteReply(Reply reply) {
		return sqlSession.delete("donationMapper.deleteReply", reply);
	}

	// 금액
	@Override
	public ArrayList<Donation> printAllProjectByMoney() {
		return (ArrayList)sqlSession.selectList("donationMapper.selectFundingList_Money");
	}
	
	// 기부 참여하기
	@Override
	public ArrayList<DonationLog> selectDonationLogOne(int projectNo) {
		return (ArrayList)sqlSession.selectList("donationMapper.selectDonationLogOne", projectNo);
	}
	
	// 신고하기
	@Override
	public int accusationInsert(DonationReport donationReport) {
		return sqlSession.delete("donationMapper.reportInsert", donationReport);
	}
	
	@Override
	public int insertDonationLog(DonationLog donationLog) {
		int result = sqlSession.insert("donationMapper.insertDonationLog", donationLog);
		return result;
	}
	
	@Override
	public int updateProject_SumMonet(Donation donation) {
		int result = sqlSession.update("donationMapper.updateDonationAddMoney", donation);
		return result;
	}

	///////////////////////////
	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Donation> PrintAll(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public int registerDonation(Donation donation) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyDonation(Donation donation) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int removeDonation(int dProjectNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int resisterComment(DonationComments dComments) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<DonationComments> printAllCommnets(int dProjectNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void goalPriceCount(int dProjectNo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void achieve(int dProjectNo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void dateRemain(int dProjectNo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void participant(int dProjectNo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public ArrayList<Donation> printAllRecommend(int dProjectNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int modifySuggest(Donation donation) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int removeSuggest(int dProjectNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Donation printOneSuggest(int dProjectNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int removeLike(int dProjectNo, DonationLike dLike) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int addLikeCount(int dProjectNo, DonationLike dLike) {
		// TODO Auto-generated method stub
		return 0;
	}

}