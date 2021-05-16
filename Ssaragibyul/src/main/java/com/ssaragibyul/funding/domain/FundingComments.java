package com.ssaragibyul.funding.domain;

import java.sql.Date;

public class FundingComments {
	
	private int commNo;
	private String userId;
	private String commTitle;
	private String commContent;
	private Date regDate;
	private int projectNo;
	
	public FundingComments() {}

	
	
	public FundingComments(int commNo, String userId, String commTitle, String commContent, Date regDate,
			int projectNo) {
		super();
		this.commNo = commNo;
		this.userId = userId;
		this.commTitle = commTitle;
		this.commContent = commContent;
		this.regDate = regDate;
		this.projectNo = projectNo;
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

	public String getCommTitle() {
		return commTitle;
	}

	public void setCommTitle(String commTitle) {
		this.commTitle = commTitle;
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

	public int getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}

	@Override
	public String toString() {
		return "FundingComments [commNo=" + commNo + ", userId=" + userId + ", commTitle=" + commTitle
				+ ", commContent=" + commContent + ", regDate=" + regDate + ", projectNo=" + projectNo + "]";
	}
	
	
}
