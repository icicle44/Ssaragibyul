package com.ssaragibyul.point.domain;

public class PointAndProject extends Point{
	//포인트
	//펀딩성공 + 펀딩제목 + 펀딩번호
	//기부성공 + 기부제목 + 기부번호
	
	private String subject; //펀딩,기부 제목
	//private int successNo; //펀딩, 기부 프로젝트 번호
	private int projectNo;
	private String nickName; //oppUserId의 닉네임
	private int money; //누적금액-목표금액
	private double fdate; // 오늘날짜-종료일
	private int projectCode;
	
	public PointAndProject() {}

	public PointAndProject(String subject, int projectNo, String nickName, int money, double fdate, int projectCode) {
		super();
		this.subject = subject;
		this.projectNo = projectNo;
		this.nickName = nickName;
		this.money = money;
		this.fdate = fdate;
		this.projectCode = projectCode;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public int getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public double getFdate() {
		return fdate;
	}

	public void setFdate(double fdate) {
		this.fdate = fdate;
	}

	public int getProjectCode() {
		return projectCode;
	}

	public void setProjectCode(int projectCode) {
		this.projectCode = projectCode;
	}

	@Override
	public String toString() {
		return "PointAndProject [subject=" + subject + ", projectNo=" + projectNo + ", nickName=" + nickName
				+ ", money=" + money + ", fdate=" + fdate + ", projectCode=" + projectCode + ", getPntListNo()="
				+ getPntListNo() + ", getEventNo()=" + getEventNo() + ", getEventNoCharge()=" + getEventNoCharge()
				+ ", getUserId()=" + getUserId() + ", getOppUserId()=" + getOppUserId() + ", getVarTime()="
				+ getVarTime() + ", getEventCode()=" + getEventCode() + ", getVarType()=" + getVarType()
				+ ", getVarAmount()=" + getVarAmount() + ", getBuyerEmail()=" + getBuyerEmail() + ", getReceiptUrl()="
				+ getReceiptUrl() + ", toString()=" + super.toString() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + "]";
	}

}
