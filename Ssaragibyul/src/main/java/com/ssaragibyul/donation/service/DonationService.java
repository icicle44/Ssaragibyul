package com.ssaragibyul.donation.service;

import java.util.ArrayList;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.common.Reply;
import com.ssaragibyul.common.Search;
import com.ssaragibyul.donation.domain.Donation;
import com.ssaragibyul.donation.domain.DonationComments;
import com.ssaragibyul.donation.domain.DonationFile;
import com.ssaragibyul.donation.domain.DonationLike;
import com.ssaragibyul.donation.domain.DonationLog;
import com.ssaragibyul.donation.domain.DonationReport;
import com.ssaragibyul.funding.domain.Funding;
import com.ssaragibyul.funding.domain.FundingLike;
import com.ssaragibyul.funding.domain.FundingLog;
import com.ssaragibyul.member.domain.Member;

public interface DonationService {

	public ArrayList<Donation> printAllProject(); // 기부 리스트

	public ArrayList<Donation> printAllProjectEnd(); // 기부 리스트

	public ArrayList<Donation> printAllProjectLimit();

	public ArrayList<Donation> printAllProjectEndLimit();

	public int registerDonation(Donation donation, DonationFile donationFile); // 기부 제안 등록
	
	public int donationLikeRegister(Donation donation, DonationLike donationLike); // 좋아요 카운트
	
	public int donationLikeRemove(Donation donation, DonationLike donationLike); // 좋아요 취소
	
	public Donation printOne(int projectNo); // 기부 상세보기
	
	public DonationFile printOneFile(int projectNo); // 기부 상세보기

	public ArrayList<DonationLike> printOneLike(int projectNo); // 기부 상세보기 

	public int addReadCountHit(int projectNo); // 기부 상세
	
	public Member printMemberList(Member member); // 기부 상세
	
	public DonationLog printSponserNumber(int projectNo); // 후원자 수
	
	public int registerDonationLog(Donation donation, DonationLog donationLog); // 기부 참여
	
	public int registerReply(Reply reply); // 댓글 작성
	
	public ArrayList<Reply> printAllReply(int projectNo); // 댓글 목록 출력
	
	public int updateReply(Reply reply); // 댓글 수정
	
	public int deleteReply(Reply reply); // 댓글 삭제
	
	public ArrayList<Donation> printAllProjectForMoney(); // 금액
	
	public ArrayList<DonationLog> printDonationLogOne(int projectNo); // 기부 참여하기
	
	public int accusationRegister(DonationReport donationReport); // 신고하기
	
	public ArrayList<Donation> printSearchAll_1(Search search); // 검색
	
	public ArrayList<Donation> printSearchAll_2(Search search); // 검색

	public ArrayList<Donation> printAllProjectForLike(); // 검색 - 진행중인 프로젝트 : 좋아요순
	
	public ArrayList<Donation> printAllProjectEndForMoeny(); // 검색 - 종료된 프로젝트 : 금액순
	
	public ArrayList<Donation> printAllProjectEndForLike(); // 검색 - 종료된 프로젝트 : 좋아요순
	
	public int getListCount();

	public ArrayList<Donation> PrintAll(PageInfo pi);

	public int addLikeCount(int dProjectNo, DonationLike dLike);


	public int modifyDonation(Donation donation);

	public int removeDonation(int dProjectNo);

	public int resisterComment(DonationComments dComments);

	public ArrayList<DonationComments> printAllCommnets(int dProjectNo);

	public void goalPriceCount(int dProjectNo);

	public void achieve(int dProjectNo);

	public void dateRemain(int dProjectNo);

	public void participant(int dProjectNo);

	public ArrayList<Donation> printAllRecommend(int dProjectNo);
	
	// 제안 프로젝트 수정

	public int modifySuggest(Donation donation);

	public int removeSuggest(int dProjectNo);

	public Donation printOneSuggest(int dProjectNo);

	public int removeLike(int dProjectNo, DonationLike dLike);
	
	//멤버페이지 기부 출력
	
	public int getListCount(String userId);
	
	public int getListCountLike(String userId);
	
	public int getListCountProp(String userId);
	
	
	public ArrayList<DonationLog> printMyDonation(String userId, PageInfo pi);
	
	public ArrayList<DonationLog> printMyDonationLike(String userId, PageInfo pi);

	public ArrayList<DonationLog> printMyDonationMoney(String userId, PageInfo pi);


	public ArrayList<DonationLike> printLikeDonation(String userId, PageInfo pi);

	public ArrayList<DonationLike> printLikeDonationLike(String userId, PageInfo pi);

	public ArrayList<DonationLike> printLikeDonationMoney(String userId, PageInfo pi);


	public ArrayList<Donation> printPropDonation(String userId, PageInfo pi);

	public ArrayList<Donation> printPropDonationLike(String userId, PageInfo pi);

	public ArrayList<Donation> printPropDonationMoney(String userId, PageInfo pi);






}
