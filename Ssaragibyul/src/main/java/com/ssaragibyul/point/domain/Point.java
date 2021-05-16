package com.ssaragibyul.point.domain;

import java.sql.Timestamp;

public class Point {
	
	private int pntListNo; // PK
	private int eventNo; // 이벤트 번호
	private String userId; // 포인트 소유자 ID
	private String oppUserId; // 선물-상대방 ID
	private Timestamp varTime; //변동시간
	private int eventCode; // 0: 충전, 1: 펀딩, 2: 기부, 3: 방문인증, 4: 선물
	private int varType; // 0: 증가(양수/적립,펀딩취소,기부취소,방문인증,선물받음), 1: 감소(음수/펀딩함,기부함,선물함)
	private int varAmount; // 포인트 변동량

	public Point() {}

	public Point(int pntListNo, int eventNo, String userId, String oppUserId, Timestamp varTime, int eventCode,
			int varType, int varAmount) {
		super();
		this.pntListNo = pntListNo;
		this.eventNo = eventNo;
		this.userId = userId;
		this.oppUserId = oppUserId;
		this.varTime = varTime;
		this.eventCode = eventCode;
		this.varType = varType;
		this.varAmount = varAmount;
	}

	public Point(String userId, int varAmount) {
		super();
		this.userId = userId;
		this.varAmount = varAmount;
	}

	public int getPntListNo() {
		return pntListNo;
	}

	public void setPntListNo(int pntListNo) {
		this.pntListNo = pntListNo;
	}

	public int getEventNo() {
		return eventNo;
	}

	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getOppUserId() {
		return oppUserId;
	}

	public void setOppUserId(String oppUserId) {
		this.oppUserId = oppUserId;
	}

	public Timestamp getVarTime() {
		return varTime;
	}

	public void setVarTime(Timestamp varTime) {
		this.varTime = varTime;
	}

	public int getEventCode() {
		return eventCode;
	}

	public void setEventCode(int eventCode) {
		this.eventCode = eventCode;
	}

	public int getVarType() {
		return varType;
	}

	public void setVarType(int varType) {
		this.varType = varType;
	}

	public int getVarAmount() {
		return varAmount;
	}

	public void setVarAmount(int varAmount) {
		this.varAmount = varAmount;
	}

	@Override
	public String toString() {
		return "Point [pntListNo=" + pntListNo + ", eventNo=" + eventNo + ", userId=" + userId + ", oppUserId="
				+ oppUserId + ", varTime=" + varTime + ", eventCode=" + eventCode + ", varType=" + varType
				+ ", varAmount=" + varAmount + "]";
	}
	
}
