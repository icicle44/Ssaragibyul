package com.ssaragibyul.visit.domain;

public class VisitLike {

	private int likeNo;
	private String userId;
	private String likesYn;
	private int visitNo;
	
	public VisitLike() {
		// TODO Auto-generated constructor stub
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

	public String getLikesYn() {
		return likesYn;
	}

	public void setLikesYn(String likesYn) {
		this.likesYn = likesYn;
	}

	public int getVisitNo() {
		return visitNo;
	}

	public void setVisitNo(int visitNo) {
		this.visitNo = visitNo;
	}

	@Override
	public String toString() {
		return "VisitLike [likeNo=" + likeNo + ", userId=" + userId + ", likesYn=" + likesYn + ", visitNo=" + visitNo
				+ "]";
	}
	
}
