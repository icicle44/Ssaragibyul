package com.ssaragibyul.visit.domain;

import java.sql.Date;
import java.sql.Timestamp;

public class Visit {
	private int visitNo;
	private String userId;
	private String nickName;
	private int siteNo;
	private String visitTitle;
	private String visitContents;
	private int visitCount;
	private int likes;
	private Date vCreateDate;
	private Date vUpdateDate;
	private String originalFilename;
	private String renameFilename;
	private String uploadTime;
	
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
	
	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
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

	public int getVisitCount() {
		return visitCount;
	}

	public void setVisitCount(int visitCount) {
		this.visitCount = visitCount;
	}
	
	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
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

	public String getUploadTime() {
		return uploadTime;
	}

	public void setUploadTime(String uploadTime) {
		this.uploadTime = uploadTime;
	}

	@Override
	public String toString() {
		return "Visit [visitNo=" + visitNo + ", userId=" + userId + ", nickName=" + nickName + ", siteNo=" + siteNo
				+ ", visitTitle=" + visitTitle + ", visitContents=" + visitContents + ", visitCount=" + visitCount
				+ ", likes=" + likes + ", vCreateDate=" + vCreateDate + ", vUpdateDate=" + vUpdateDate
				+ ", originalFilename=" + originalFilename + ", renameFilename=" + renameFilename + ", uploadTime="
				+ uploadTime + "]";
	}

}
