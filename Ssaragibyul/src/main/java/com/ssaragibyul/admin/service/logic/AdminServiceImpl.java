package com.ssaragibyul.admin.service.logic;

import java.util.ArrayList;

import org.apache.ibatis.javassist.compiler.ast.ASTree;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssaragibyul.admin.service.AdminService;
import com.ssaragibyul.admin.store.AdminStore;
import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.common.Reply;
import com.ssaragibyul.common.Search;
import com.ssaragibyul.donation.domain.Donation;
import com.ssaragibyul.donation.domain.DonationReport;
import com.ssaragibyul.funding.domain.Funding;
import com.ssaragibyul.funding.domain.FundingReport;
import com.ssaragibyul.history.domain.History;
import com.ssaragibyul.member.domain.Member;
import com.ssaragibyul.message.domain.Message;
import com.ssaragibyul.visit.domain.Visit;
import com.ssaragibyul.visit.domain.VisitStat;
@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminStore aStore;

	@Override
	public int printAllMemberCount() {
		return aStore.selectAllMemberCount();
	}

	@Override
	public int printTodayMemberCount() {
		return aStore.selectTodayMemberCount();
	}

	@Override
	public int printReportAllCount() {
		return aStore.selectAllReportCount();
	}

	@Override
	public int printUnprocessedReport() {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public int getCountDeleteMember() {
		return aStore.slelectCountDeleteMember();
	}

	@Override
	public int printVisitbrdCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Message> getCountNewMessage() {
		return aStore.selectCountNewMessage();
	}

	@Override
	public ArrayList<Message> getCountNewRecMessage() {
		// TODO Auto-generated method stub
		return aStore.selectCountNewRecMessage();
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
		ArrayList<Member> searchList = aStore.selectSearchAll(search);
		return searchList;
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
	public int deleteFunding(int projectNo) {
		return aStore.deleteFunding(projectNo);
	}

	@Override
	public ArrayList<Donation> printAllDoantion(PageInfo pi) {
		return aStore.selectAllDoantion(pi);
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
	public int deleteDonation(int projectNo) {
		return aStore.deleteDonation(projectNo);
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
		return aStore.pringAllHistoy(pi);
	}

	@Override
	public History printOneHistoy(int siteNo) {
		return aStore.selectOneHistoy(siteNo);
	}

	@Override
	public ArrayList<History> printSearchHistory(Search search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int registerHistory(History history) {
		return aStore.insertHistory(history);
	}

	@Override
	public int modifyHistory(History history) {
		return aStore.updateHistory(history);
	}

	@Override
	public int removeHistory(int siteNo) {
		return aStore.deleteHistory(siteNo);
	}

	@Override
	public ArrayList<Visit> printAllVisit(PageInfo pi) {
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

	@Override
	public int getHistoryListCount() {
		// TODO Auto-generated method stub
		return aStore.selectHistoyListCount();
	}

	@Override
	public int getFundingListCount() {
		// TODO Auto-generated method stub
		return aStore.selectFundingListCount();
	}

	@Override
	public int getDonationListCount() {
		// TODO Auto-generated method stub
		return aStore.selectDonationListCount();
	}

	@Override
	public int getVisitListCount() {
		// TODO Auto-generated method stub
		return aStore.selectVisitListCount();
	}

	@Override
	public ArrayList<VisitStat> getCountPostVisit() {
		// TODO Auto-generated method stub
		return aStore.selectCountPostVisit();
	}

	@Override
	public int getFundingAccListCount() {
		return aStore.selectFundingAccListCount();
	}

	@Override
	public int getDonationAccListCount() {
		return aStore.selectDonationAccListCount();
	}

	@Override
	public ArrayList<FundingReport> printFundingAccList(PageInfo pi) {
		return aStore.selectFundingAccList(pi);
	}

	@Override
	public ArrayList<DonationReport> printDonationAccList(PageInfo pi) {
		return aStore.selectDonationAccList(pi);
	}

	@Override
	public FundingReport prinOneFundingAcc(int accuFundingNo) {
		return aStore.selectOneFundingAcc(accuFundingNo);
	}

	@Override
	public int deleteFundingAdd(FundingReport fundingNo) {
		return aStore.updateFundingAdd(fundingNo);
	}

	@Override
	public int deleteFundingReport(FundingReport fundingNo) {
		// TODO Auto-generated method stub
		return aStore.updateFundingReport(fundingNo);
	}

	@Override
	public ArrayList<VisitStat> getCountReport() {
		return aStore.selectCountReport();
	}

	@Override
	public int getCountTodayRepor() {
		return aStore.selectCountTodayRepor();
	}

	@Override
	public ArrayList<Funding> getFundingCalendar(int projectNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Funding> getFundingList() {
		return aStore.selectAllFundingCal();
	}

	@Override
	public ArrayList<Donation> getDonationList() {
		return aStore.selectAllDonationCal();
	}

	@Override
	public DonationReport printOneDonationAdd(int accuDonNo) {
		return aStore.selectOneDonationAcc(accuDonNo);
	}

	@Override
	public int deleteDonationReport(DonationReport donationNo) {
		return aStore.deleteDonaitonReport(donationNo);
	}

	@Override
	public int deleteDanationAdd(DonationReport donationNo) {
		return aStore.deleteDonaitonAcc(donationNo);
	}


}
