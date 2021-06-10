package com.ssaragibyul.donation.domain;

import java.sql.Date;

public class DonationLog {

	private int donateNo;
	private String userId;
	private int fundingPoint;
	private int qunatity;
	private Date donationDate;
	private int cancleYn;
	private int projectNo;
	private String receiverAddr;
	private String receiverName;
	private String receiverPhone;
	private int sponser;
	
	private Donation donation;
	
	public DonationLog() {}

	
	
	
	
	
	
	public DonationLog(int donateNo, String userId, int fundingPoint, int qunatity, Date donationDate, int cancleYn,
			int projectNo, String receiverAddr, String receiverName, String receiverPhone, int sponser,
			Donation donation) {
		super();
		this.donateNo = donateNo;
		this.userId = userId;
		this.fundingPoint = fundingPoint;
		this.qunatity = qunatity;
		this.donationDate = donationDate;
		this.cancleYn = cancleYn;
		this.projectNo = projectNo;
		this.receiverAddr = receiverAddr;
		this.receiverName = receiverName;
		this.receiverPhone = receiverPhone;
		this.sponser = sponser;
		this.donation = donation;
	}







	public DonationLog(int donateNo, String userId, int fundingPoint, int qunatity, Date donationDate, int cancleYn,
			int projectNo, String receiverAddr, String receiverName, String receiverPhone, int sponser) {
		super();
		this.donateNo = donateNo;
		this.userId = userId;
		this.fundingPoint = fundingPoint;
		this.qunatity = qunatity;
		this.donationDate = donationDate;
		this.cancleYn = cancleYn;
		this.projectNo = projectNo;
		this.receiverAddr = receiverAddr;
		this.receiverName = receiverName;
		this.receiverPhone = receiverPhone;
		this.sponser = sponser;
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

	public Date getDonationDate() {
		return donationDate;
	}

	public void setDonationDate(Date donationDate) {
		this.donationDate = donationDate;
	}

	public int getCancleYn() {
		return cancleYn;
	}

	public void setCancleYn(int cancleYn) {
		this.cancleYn = cancleYn;
	}

	public int getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}

	public String getReceiverAddr() {
		return receiverAddr;
	}

	public void setReceiverAddr(String receiverAddr) {
		this.receiverAddr = receiverAddr;
	}

	public String getReceiverName() {
		return receiverName;
	}

	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}

	public String getReceiverPhone() {
		return receiverPhone;
	}

	public void setReceiverPhone(String receiverPhone) {
		this.receiverPhone = receiverPhone;
	}

	public int getSponser() {
		return sponser;
	}

	public void setSponser(int sponser) {
		this.sponser = sponser;
	}

	public Donation getDonation() {
		return donation;
	}

	public void setDonation(Donation donation) {
		this.donation = donation;
	}

	@Override
	public String toString() {
		return "DonationLog [donateNo=" + donateNo + ", userId=" + userId + ", fundingPoint=" + fundingPoint
				+ ", qunatity=" + qunatity + ", donationDate=" + donationDate + ", cancleYn=" + cancleYn
				+ ", projectNo=" + projectNo + ", receiverAddr=" + receiverAddr + ", receiverName=" + receiverName
				+ ", receiverPhone=" + receiverPhone + ", sponser=" + sponser + ", donation=" + donation + "]";
	}


}
