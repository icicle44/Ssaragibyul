package com.ssaragibyul.donation.service;

import java.util.ArrayList;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.donation.domain.Donation;
import com.ssaragibyul.donation.domain.DonationComments;
import com.ssaragibyul.donation.domain.DonationFile;
import com.ssaragibyul.donation.domain.DonationLike;

public interface DonationService {

	public ArrayList<Donation> printAllProject(); // 기부 리스트

	public ArrayList<Donation> printAllProjectEnd(); // 기부 리스트

	public int registerDonation(Donation donation, DonationFile donationFile); // 기부 제안 등록
	
	public int getListCount();

	public ArrayList<Donation> PrintAll(PageInfo pi);

	public Donation printOne(int dProjectNo);
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




}
