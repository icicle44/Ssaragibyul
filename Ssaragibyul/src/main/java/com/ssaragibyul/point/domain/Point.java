package com.ssaragibyul.point.domain;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component("Point")
public class Point {
	
	private long pntListNo; // PK
	private int eventNo; // 이벤트 번호
	private long eventNoCharge; // 충전용 이벤트 번호
	private String userId; // 포인트 소유자 ID
	private String oppUserId; // 선물-상대방 ID
	private Timestamp varTime; //변동시간
	private int eventCode; // 0: 충전, 1: 펀딩, 2: 기부, 3: 방문인증, 4: 선물
	private int varType; // 0: 증가(양수/적립,펀딩취소,기부취소,방문인증,선물받음), 1: 감소(음수/펀딩함,기부함,선물함)
	private int varAmount; // 포인트 변동량
	private String buyerEmail; // 충전(결제)시 정보 받은 이메일
	private String receiptUrl; // 결제(충전) 영수증 url

	public Point() {}

	public Point(long pntListNo, int eventNo, long eventNoCharge, String userId, String oppUserId, Timestamp varTime,
			int eventCode, int varType, int varAmount, String buyerEmail, String receiptUrl) {
		super();
		this.pntListNo = pntListNo;
		this.eventNo = eventNo;
		this.eventNoCharge = eventNoCharge;
		this.userId = userId;
		this.oppUserId = oppUserId;
		this.varTime = varTime;
		this.eventCode = eventCode;
		this.varType = varType;
		this.varAmount = varAmount;
		this.buyerEmail = buyerEmail;
		this.receiptUrl = receiptUrl;
	}

	public long getPntListNo() {
		return pntListNo;
	}

	public void setPntListNo(long pntListNo) {
		this.pntListNo = pntListNo;
	}

	public int getEventNo() {
		return eventNo;
	}

	public void setEventNo(int eventNo) {
		this.eventNo = eventNo;
	}

	public long getEventNoCharge() {
		return eventNoCharge;
	}

	public void setEventNoCharge(long eventNoCharge) {
		this.eventNoCharge = eventNoCharge;
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

	public String getBuyerEmail() {
		return buyerEmail;
	}

	public void setBuyerEmail(String buyerEmail) {
		this.buyerEmail = buyerEmail;
	}

	public String getReceiptUrl() {
		return receiptUrl;
	}

	public void setReceiptUrl(String receiptUrl) {
		this.receiptUrl = receiptUrl;
	}

	@Override
	public String toString() {
		return "Point [pntListNo=" + pntListNo + ", eventNo=" + eventNo + ", eventNoCharge=" + eventNoCharge
				+ ", userId=" + userId + ", oppUserId=" + oppUserId + ", varTime=" + varTime + ", eventCode="
				+ eventCode + ", varType=" + varType + ", varAmount=" + varAmount + ", buyerEmail=" + buyerEmail
				+ ", receiptUrl=" + receiptUrl + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	
}
