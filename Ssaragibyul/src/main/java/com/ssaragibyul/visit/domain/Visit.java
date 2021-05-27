package com.ssaragibyul.visit.domain;

import java.sql.Date;

public class Visit {
	private int visitNo;
	private String userId;
	private int siteNo;
	private String visitTitle;
	private String visitContents;
	private String originalFilename;
	private String renameFilename;
	private int visitCount;
	private Date vCreateDate;
	private Date vUpdateDate;
	
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

	public String getVisitContents() {
		return visitContents;
	}


	public void setVisitContents(String visitContents) {
		this.visitContents = visitContents;
	}


	public String getOriginalFilename() {
		return originalFilename;
	}


	public void setOriginalFilename(String originalFilename) {
		this.originalFilename = originalFilename;
	}


	public String getRenameFilename() {
		return renameFilename;
	}


	public void setRenameFilename(String renameFilename) {
		this.renameFilename = renameFilename;
	}


	public int getVisitCount() {
		return visitCount;
	}


	public void setVisitCount(int visitCount) {
		this.visitCount = visitCount;
	}


	public Date getvCreateDate() {
		return vCreateDate;
	}


	public void setvCreateDate(Date vCreateDate) {
		this.vCreateDate = vCreateDate;
	}


	public Date getvUpdateDate() {
		return vUpdateDate;
	}


	public void setvUpdateDate(Date vUpdateDate) {
		this.vUpdateDate = vUpdateDate;
	}

	public String toString() {
		return "Visit [visitNo=" + visitNo + ", userId=" + userId + ", siteNo=" + siteNo + ", visitTitle=" + visitTitle
				+ ", visitContents=" + visitContents + ", originalFilename="
				+ originalFilename + ", renameFilename=" + renameFilename + ", visitCount=" + visitCount
				+ ", vCreateDate=" + vCreateDate + ", vUpdateDate=" + vUpdateDate + "]";
	}


}
