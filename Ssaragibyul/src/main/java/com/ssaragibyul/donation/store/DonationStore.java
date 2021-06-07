package com.ssaragibyul.donation.store;

import java.util.ArrayList;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.common.Reply;
import com.ssaragibyul.donation.domain.Donation;
import com.ssaragibyul.donation.domain.DonationComments;
import com.ssaragibyul.donation.domain.DonationFile;
import com.ssaragibyul.donation.domain.DonationLike;
import com.ssaragibyul.donation.domain.DonationLog;
import com.ssaragibyul.donation.domain.DonationReport;

public interface DonationStore{
	public int addLikeCount(int dProjectNo, DonationLike dLike);

	public int getListCount();

	// 기부 리스트
	public ArrayList<Donation> printAllProject();
	
	public ArrayList<Donation> printAllProjectLimit();

	public ArrayList<Donation> printAllProjectEndLimit();
	
	// 기부 리스트
	public ArrayList<Donation> printAllProjectEnd();
	
	// 기부 제안 등록
	public int insertDonation(Donation donation);
	
	// 기부 제안 파일 등록
	public int insertDonationFile(DonationFile donationFile);

	// 좋아요1
	public int updateLike(Donation donation);

	// 좋아요2
	public int insertLike(DonationLike donationLike);
	
	// 좋아요 취소1(감소)
	public int updateLike_Minus(Donation donation);
	
	// 좋아요 취소2
	public int deleteLike(DonationLike donationLike);

	// 기부 상세 페이지
	public int addReadCount(int projectNo);
	
	// 기부 상세 페이지
	public DonationFile selectOneFile(int projectNo);
	
	// 기부 상세 페이지
	public ArrayList<DonationLike> selectOneLike(int projectNo);
	
	public int insertDonationLog(DonationLog donationLog);
	
	public int updateProject_SumMonet(Donation donation);
	
	////////////
	
	// 후원자 수 카운트
	public DonationLog selectSponserNumber(int projectNo);
	
	// 댓글 작성
	public int insertReply(Reply reply);
	
	// 댓글 목록 출력
	public ArrayList<Reply> selectAllReply(int projectNo);
	
	// 댓글 수정
	public int updateReply(Reply reply);
	
	// 댓글 삭제
	public int deleteReply(Reply reply);
	
	// 금액
	public ArrayList<Donation> printAllProjectByMoney();
	
	// 기부 참여하기
	public ArrayList<DonationLog> selectDonationLogOne(int projectNo);
	
	// 신고하기
	public int accusationInsert(DonationReport donationReport);
	
	public ArrayList<Donation> PrintAll(PageInfo pi);

	public Donation printOne(int dProjectNo);

	public int registerDonation(Donation donation);

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


	
}
