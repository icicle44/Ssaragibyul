package com.ssaragibyul.donation.store.logic;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.ssaragibyul.common.PageInfo;
import com.ssaragibyul.donation.domain.Donation;
import com.ssaragibyul.donation.domain.DonationComments;
import com.ssaragibyul.donation.domain.DonationLike;
import com.ssaragibyul.donation.store.DonationStore;
@Repository
public class DonationStoreLogic implements DonationStore{

	@Override
	public int addLikeCount(int dProjectNo, DonationLike dLike) {
		return dProjectNo;
		// TODO Auto-generated method stub
		
	}

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
	public Donation printOne(int dProjectNo) {
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

}