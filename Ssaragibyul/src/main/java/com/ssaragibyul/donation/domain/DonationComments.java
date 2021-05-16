package com.ssaragibyul.donation.domain;

import java.sql.Date;

public class DonationComments {

	private int commNo;
	private String userId;
	private String sommTitle;
	private String commContent;
	private Date regDate;
	private int dProjectNo;
	
	public DonationComments() {}

	public DonationComments(int commNo, String userId, String sommTitle, String commContent, Date regDate,
			int dProjectNo) {
		super();
		this.commNo = commNo;
		this.userId = userId;
		this.sommTitle = sommTitle;
		this.commContent = commContent;
		this.regDate = regDate;
		this.dProjectNo = dProjectNo;
	}

	public int getCommNo() {
		return commNo;
	}

	public void setCommNo(int commNo) {
		this.commNo = commNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getSommTitle() {
		return sommTitle;
	}

	public void setSommTitle(String sommTitle) {
		this.sommTitle = sommTitle;
	}

	public String getCommContent() {
		return commContent;
	}

	public void setCommContent(String commContent) {
		this.commContent = commContent;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getdProjectNo() {
		return dProjectNo;
	}

	public void setdProjectNo(int dProjectNo) {
		this.dProjectNo = dProjectNo;
	}

	@Override
	public String toString() {
		return "DonationComment [commNo=" + commNo + ", userId=" + userId + ", sommTitle=" + sommTitle
				+ ", commContent=" + commContent + ", regDate=" + regDate + ", dProjectNo=" + dProjectNo + "]";
	}
	
	
}
