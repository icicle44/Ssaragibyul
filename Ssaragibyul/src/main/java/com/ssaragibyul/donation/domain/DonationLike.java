package com.ssaragibyul.donation.domain;

public class DonationLike {

	private int likeNo;
	private String userId;
	private String likeYn;
	private int projectNo;
	
	private Donation donation;
	
	public DonationLike() {}

	
	
	public DonationLike(int likeNo, String userId, String likeYn, int projectNo, Donation donation) {
		super();
		this.likeNo = likeNo;
		this.userId = userId;
		this.likeYn = likeYn;
		this.projectNo = projectNo;
		this.donation = donation;
	}


	public DonationLike(int likeNo, String userId, String likeYn, int projectNo) {
		super();
		this.likeNo = likeNo;
		this.userId = userId;
		this.likeYn = likeYn;
		this.projectNo = projectNo;
	}

	public int getLikeNo() {
		return likeNo;
	}

	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getLikeYn() {
		return likeYn;
	}

	public void setLikeYn(String likeYn) {
		this.likeYn = likeYn;
	}

	public int getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}

	public Donation getDonation() {
		return donation;
	}

	public void setDonation(Donation donation) {
		this.donation = donation;
	}

	@Override
	public String toString() {
		return "DonationLike [likeNo=" + likeNo + ", userId=" + userId + ", likeYn=" + likeYn + ", projectNo="
				+ projectNo + ", donation=" + donation + "]";
	}



	
	
	
}
