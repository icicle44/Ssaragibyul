package com.ssaragibyul.admin.service.logic;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssaragibyul.admin.service.AdminService;
import com.ssaragibyul.admin.store.AdminStore;
import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.common.Reply;
import com.ssaragibyul.common.Search;
import com.ssaragibyul.donation.domain.Donation;
import com.ssaragibyul.funding.domain.Funding;
import com.ssaragibyul.history.domain.History;
import com.ssaragibyul.member.domain.Member;
import com.ssaragibyul.visit.domain.Visit;
@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminStore aStore;

	@Override
	public int printAllMemberCount(int MemberNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int printTodayMemberCount(int MemberNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int printReportAllCount(int accu) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int printUnprocessedReport(int processing) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int printVisitbrdCount(int commNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Member> printAll(PageInfo pi) {
		return aStore.selectAll(pi);
	}

	@Override
	public Member printOne(String userId) {
		return aStore.selectOne(userId);
	}

	@Override
	public ArrayList<Member> printSearchAll(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int modifyMember(Member member) {
		return aStore.updateMember(member);
	}

	@Override
	public int deleteMember(String userId) {
		return aStore.deleteMember(userId);
	}

	@Override
	public ArrayList<Funding> printAllFunding(PageInfo pi) {
		return aStore.selectAllFunding(pi);
	}

	@Override
	public Funding printOneFunding(int fundingNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Funding> printSearchFunding(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteFunding(int fundingNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Donation> printAllDoantion(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Donation printOneDonation(int donationNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Donation> printSearchDonation(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteDonation(int donationNo) {
		// TODO Auto-generated method stub
		return 0;
	}

//	@Override
//	public ArrayList<Board> printAllReport(PageInfo pi) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public Board printOneReport(int boardNo) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public ArrayList<Board> printSearchReport(Search search) {
//		// TODO Auto-generated method stub
//		return null;
//	}

	@Override
	public int deleteReport(int BoardNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int removeReply(Reply reply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Reply> pringAllReply(int boardNo, String processing) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Reply printOneReply(int commNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<History> pringAllHistoy(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public History printOneHistoy(int mngNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<History> printSearchHistory(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int registerHistory(History history) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyHistory(History history) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int removeHistory(int mngNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Visit> printAllVisit(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Visit printOneVisit(int visitNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Visit> printSaerchVisit(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int removeVisit(int visitNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getListCount() {
		return aStore.selectListCount();
	}

}
