package com.ssaragibyul.admin.store.logic;

import java.util.ArrayList;

import com.ssaragibyul.admin.store.AdminStore;
import com.ssaragibyul.common.Board;
import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.common.Reply;
import com.ssaragibyul.common.Search;
import com.ssaragibyul.donation.domain.Donation;
import com.ssaragibyul.funding.domain.Funding;
import com.ssaragibyul.history.domain.History;
import com.ssaragibyul.member.domain.Member;
import com.ssaragibyul.visit.domain.Visit;

public class AdminStoreLogic implements AdminStore{

	@Override
	public int selectAllMemberCount(int MemberNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectTodayMemberCount(int MemberNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectAllReportCount(int accu) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectUnprocessedReport(int processing) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectVisitbrdCount(int commNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Member> selectAll(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Member selectOne(int member) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Member> selectSearchAll(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateMember(Member member) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMember(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Funding> selectAllFunding(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
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

	@Override
	public ArrayList<Board> selectReportAll(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Board selectOneReport(int boardNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Board> selectSearchReport(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

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
		// TODO Auto-generated method stub
		return null;
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

}
