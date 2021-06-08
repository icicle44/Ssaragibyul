package com.ssaragibyul.member.domain;

import java.sql.Timestamp;

public class CommentAndProject {

	private int keyNo;
	private int projectNo;
	private int commNo;
	private String userId;
	private String commContents;
	private String boardType;
	private Timestamp regDate;
	private String subject;
	private int projectCode;
	
	public CommentAndProject() {}

	public CommentAndProject(int keyNo, int projectNo, int commNo, String userId, String commContents, String boardType,
			Timestamp regDate, String subject, int projectCode) {
		super();
		this.keyNo = keyNo;
		this.projectNo = projectNo;
		this.commNo = commNo;
		this.userId = userId;
		this.commContents = commContents;
		this.boardType = boardType;
		this.regDate = regDate;
		this.subject = subject;
		this.projectCode = projectCode;
	}

	public int getKeyNo() {
		return keyNo;
	}

	public void setKeyNo(int keyNo) {
		this.keyNo = keyNo;
	}

	public int getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(int projectNo) {
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

	public String getCommContents() {
		return commContents;
	}

	public void setCommContents(String commContents) {
		this.commContents = commContents;
	}

	public String getBoardType() {
		return boardType;
	}

	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public int getProjectCode() {
		return projectCode;
	}

	public void setProjectCode(int projectCode) {
		this.projectCode = projectCode;
	}

	@Override
	public String toString() {
		return "CommentAndProject [keyNo=" + keyNo + ", projectNo=" + projectNo + ", commNo=" + commNo + ", userId="
				+ userId + ", commContents=" + commContents + ", boardType=" + boardType + ", regDate=" + regDate
				+ ", subject=" + subject + ", projectCode=" + projectCode + "]";
	}

}
