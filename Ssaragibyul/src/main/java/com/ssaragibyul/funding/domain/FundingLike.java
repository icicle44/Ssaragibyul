package com.ssaragibyul.funding.domain;

public class FundingLike {
	private int likeNo;
	private String userId;
	private String likeYn;
	private int projectNo;
	private int count;
	
	private Funding fundingProject;
	
	public FundingLike() {}

	
	
	
	
	
	
	public FundingLike(int likeNo, String userId, String likeYn, int projectNo, int count, Funding fundingProject) {
		super();
		this.likeNo = likeNo;
		this.userId = userId;
		this.likeYn = likeYn;
		this.projectNo = projectNo;
		this.count = count;
		this.fundingProject = fundingProject;
	}







	public FundingLike(int likeNo, String userId, String likeYn, int projectNo) {
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

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Funding getFundingProject() {
		return fundingProject;
	}

	public void setFundingProject(Funding fundingProject) {
		this.fundingProject = fundingProject;
	}

	@Override
	public String toString() {
		return "FundingLike [likeNo=" + likeNo + ", userId=" + userId + ", likeYn=" + likeYn + ", projectNo="
				+ projectNo + ", count=" + count + ", fundingProject=" + fundingProject + "]";
	}

	
	
}
