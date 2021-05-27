package com.ssaragibyul.admin.store.logic;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssaragibyul.admin.store.AdminStore;
import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.common.Reply;
import com.ssaragibyul.common.Search;
import com.ssaragibyul.donation.domain.Donation;
import com.ssaragibyul.funding.domain.Funding;
import com.ssaragibyul.history.domain.History;
import com.ssaragibyul.member.domain.Member;
import com.ssaragibyul.visit.domain.Visit;

import jdk.nashorn.internal.ir.annotations.Reference;
@Repository
public class AdminStoreLogic implements AdminStore{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int selectAllMemberCount() {
		return sqlSession.selectOne("memberMapper.selectAllMemberCount");
	}

	@Override
	public int selectTodayMemberCount() {
		return sqlSession.selectOne("memberMapper.selectNewMemberCount");
	}

	@Override
	public int selectAllReportCount() {
		return sqlSession.selectOne("messageMapper.selectAllReportCount");
	}

	@Override
	public int selectUnprocessedReport() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectVisitbrdCount() {
		// TODO Auto-generated method stub
		return 0;
	}
	

	@Override
	public int slelectCountDeleteMember() {
		return sqlSession.selectOne("memberMapper.selectDeleteMemberCount");
	}


	@Override
	public ArrayList<Member> selectAll(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.selectAllList", null, rowBounds);
	}
	
	@Override
	public Member selectOne(String userId) {
		return sqlSession.selectOne("memberMapper.selectOne", userId);
	}

	@Override
	public ArrayList<Member> selectSearchAll(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateMember(Member member) {
		return sqlSession.update("memberMapper.updateMember", member);
	}

	@Override
	public int deleteMember(String userId) {
		return sqlSession.update("memberMapper.deleteMember", userId);
	}

	@Override
	public ArrayList<Funding> selectAllFunding(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("fundingMapper.selectAllList", null, rowBounds);
	}

	@Override
	public Funding selectOneFunding(int fundingNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Funding> selectSearchFunding(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteFunding(int fundingNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Donation> selectAllDoantion(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Donation selectOneDonation(int donationNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Donation> selectSearchDonation(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteDonation(int donationNo) {
		// TODO Auto-generated method stub
		return 0;
	}

//	@Override
//	public ArrayList<Board> selectReportAll(PageInfo pi) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public Board selectOneReport(int boardNo) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public ArrayList<Board> selectSearchReport(Search search) {
//		// TODO Auto-generated method stub
//		return null;
//	}

	@Override
	public int deleteReport(int BoardNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReply(Reply reply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Reply> pringAllReply(int boardNo, String processing) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Reply selectOneReply(int commNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<History> pringAllHistoy(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1)* pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("historyMapper.adminSelectAllList", null, rowBounds);
	}

	@Override
	public History selectOneHistoy(int mngNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<History> selectSearchHistory(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertHistory(History history) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateHistory(History history) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteHistory(int mngNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Visit> selectAllVisit(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Visit selectOneVisit(int visitNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Visit> selectSaerchVisit(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteVisit(int visitNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectListCount() {
		return sqlSession.selectOne("memberMapper.selectListCount");
	}

	@Override
	public int selectHistoyListCount() {
		return sqlSession.selectOne("historyMapper.selectHistoryListCount");
	}

	@Override
	public int selectFundingListCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("fundingMapper.selectFundingListCount");
	}

	@Override
	public int selectDonationListCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("donationMapper.selectDonationListCount");
	}

	@Override
	public int selectReportAllCount() {
		// TODO Auto-generated method stub
		return 0;
	}


}
