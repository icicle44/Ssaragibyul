package com.ssaragibyul.point.domain;

public class PointAndProject extends Point{
	//포인트
	//펀딩성공 + 펀딩제목 + 펀딩번호
	//기부성공 + 기부제목 + 기부번호
	
	private String subject; //펀딩,기부 제목
	private int successNo; //펀딩, 기부 프로젝트 번호
	
	public PointAndProject() {}

	public PointAndProject(String subject, int successNo) {
		super();
		this.subject = subject;
		this.successNo = successNo;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public int getSuccessNo() {
		return successNo;
	}

	public void setSuccessNo(int successNo) {
		this.successNo = successNo;
	}

	@Override
	public String toString() {
		return "PointAndProject [subject=" + subject + ", successNo=" + successNo + ", getPntListNo()=" + getPntListNo()
				+ ", getEventNo()=" + getEventNo() + ", getUserId()=" + getUserId() + ", getOppUserId()="
				+ getOppUserId() + ", getVarTime()=" + getVarTime() + ", getEventCode()=" + getEventCode()
				+ ", getVarType()=" + getVarType() + ", getVarAmount()=" + getVarAmount() + ", toString()="
				+ super.toString() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + "]";
	}
	
	
	
}
