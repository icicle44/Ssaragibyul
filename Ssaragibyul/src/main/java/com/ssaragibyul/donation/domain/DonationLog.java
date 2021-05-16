package com.ssaragibyul.donation.domain;

import java.sql.Date;

public class DonationLog {

	private int donateNo;
	private String userId;
	private int fundingPoint;
	private int qunatity;
	private Date fundDate;
	private int cancleYn;
	private int dProjectNo;
	
	public DonationLog() {}

	public DonationLog(int donateNo, String userId, int fundingPoint, int qunatity, Date fundDate, int cancleYn,
			int dProjectNo) {
		super();
		this.donateNo = donateNo;
		this.userId = userId;
		this.fundingPoint = fundingPoint;
		this.qunatity = qunatity;
		this.fundDate = fundDate;
		this.cancleYn = cancleYn;
		this.dProjectNo = dProjectNo;
	}

	public int getDonateNo() {
		return donateNo;
	}

	public void setDonateNo(int donateNo) {
		this.donateNo = donateNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getFundingPoint() {
		return fundingPoint;
	}

	public void setFundingPoint(int fundingPoint) {
		this.fundingPoint = fundingPoint;
	}

	public int getQunatity() {
		return qunatity;
	}

	public void setQunatity(int qunatity) {
		this.qunatity = qunatity;
	}

	public Date getFundDate() {
		return fundDate;
	}

	public void setFundDate(Date fundDate) {
		this.fundDate = fundDate;
	}

	public int getCancleYn() {
		return cancleYn;
	}

	public void setCancleYn(int cancleYn) {
		this.cancleYn = cancleYn;
	}

	public int getdProjectNo() {
		return dProjectNo;
	}

	public void setdProjectNo(int dProjectNo) {
		this.dProjectNo = dProjectNo;
	}

	@Override
	public String toString() {
		return "DonateLog [donateNo=" + donateNo + ", userId=" + userId + ", fundingPoint=" + fundingPoint
				+ ", qunatity=" + qunatity + ", fundDate=" + fundDate + ", cancleYn=" + cancleYn + ", dProjectNo="
				+ dProjectNo + "]";
	}
	
	
}
