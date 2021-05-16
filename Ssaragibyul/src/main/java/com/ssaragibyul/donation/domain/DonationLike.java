package com.ssaragibyul.donation.domain;

public class DonationLike {

	private int likeNo;
	private String userId;
	private String likeYn;
	private int dProjectNo;
	
	public DonationLike() {}

	public DonationLike(int likeNo, String userId, String likeYn, int dProjectNo) {
		super();
		this.likeNo = likeNo;
		this.userId = userId;
		this.likeYn = likeYn;
		this.dProjectNo = dProjectNo;
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

	public int getdProjectNo() {
		return dProjectNo;
	}

	public void setdProjectNo(int dProjectNo) {
		this.dProjectNo = dProjectNo;
	}

	@Override
	public String toString() {
		return "DonateLike [likeNo=" + likeNo + ", userId=" + userId + ", likeYn=" + likeYn + ", dProjectNo="
				+ dProjectNo + "]";
	}
	
	
}
