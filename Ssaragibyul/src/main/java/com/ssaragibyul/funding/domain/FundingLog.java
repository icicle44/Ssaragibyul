package com.ssaragibyul.funding.domain;

import java.sql.Date;

public class FundingLog {
	private int doFundNo;
	private String userId;
	private int fundingPoint;
	private int qunatity;
	private Date fundDate;
	private int cancleYn;
	private int projectNo;
	private String receiverAddr;
	private String receiverName;
	private String receiverPhone;
	
	
	public FundingLog() {}
	
	public FundingLog(int doFundNo, String userId, int fundingPoint, int qunatity, Date fundDate, int cancleYn,
			int projectNo, String receiverAddr, String receiverName, String receiverPhone) {
		super();
		this.doFundNo = doFundNo;
		this.userId = userId;
		this.fundingPoint = fundingPoint;
		this.qunatity = qunatity;
		this.fundDate = fundDate;
		this.cancleYn = cancleYn;
		this.projectNo = projectNo;
		this.receiverAddr = receiverAddr;
		this.receiverName = receiverName;
		this.receiverPhone = receiverPhone;
	}


	public int getDoFundNo() {
		return doFundNo;
	}
	public void setDoFundNo(int doFundNo) {
		this.doFundNo = doFundNo;
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
	@Override
	public String toString() {
		return "FundingLog [doFundNo=" + doFundNo + ", userId=" + userId + ", fundingPoint=" + fundingPoint
				+ ", qunatity=" + qunatity + ", fundDate=" + fundDate + ", cancleYn=" + cancleYn + ", projectNo="
				+ projectNo + ", receiverAddr=" + receiverAddr + ", receiverName=" + receiverName + ", receiverPhone="
				+ receiverPhone + "]";
	}

}
