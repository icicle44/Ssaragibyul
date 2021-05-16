package com.ssaragibyul.visit.domain;

public class Visit {
	private int visitNo;
	private String userId;
	private int siteNo;
	private String visitTitle;
	private String vistContents;
	
	public Visit() {
		// TODO Auto-generated constructor stub
	}

	
	
	public int getVisitNo() {
		return visitNo;
	}

	public void setVisitNo(int visitNo) {
		this.visitNo = visitNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getSiteNo() {
		return siteNo;
	}

	public void setSiteNo(int siteNo) {
		this.siteNo = siteNo;
	}

	public String getVisitTitle() {
		return visitTitle;
	}

	public void setVisitTitle(String visitTitle) {
		this.visitTitle = visitTitle;
	}

	public String getVistContents() {
		return vistContents;
	}

	public void setVistContents(String vistContents) {
		this.vistContents = vistContents;
	}
	

	@Override
	public String toString() {
		return "Visit [visitNo=" + visitNo + ", userId=" + userId + ", siteNo=" + siteNo + ", visitTitle=" + visitTitle
				+ ", vistContents=" + vistContents + "]";
	}
	
}
