package com.ssaragibyul.donation.domain;

public class DonationReport {

	private int accuDonNo;
	private String userId;
	private int reportCode;
	private String reportContent;
	private int dProjectNo;
	private String processing;
	
	public DonationReport() {}

	public DonationReport(int accuDonNo, String userId, int reportCode, String reportContent, int dProjectNo,
			String processing) {
		super();
		this.accuDonNo = accuDonNo;
		this.userId = userId;
		this.reportCode = reportCode;
		this.reportContent = reportContent;
		this.dProjectNo = dProjectNo;
		this.processing = processing;
	}

	public int getAccuDonNo() {
		return accuDonNo;
	}

	public void setAccuDonNo(int accuDonNo) {
		this.accuDonNo = accuDonNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getReportCode() {
		return reportCode;
	}

	public void setReportCode(int reportCode) {
		this.reportCode = reportCode;
	}

	public String getReportContent() {
		return reportContent;
	}

	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}

	public int getdProjectNo() {
		return dProjectNo;
	}

	public void setdProjectNo(int dProjectNo) {
		this.dProjectNo = dProjectNo;
	}

	public String getProcessing() {
		return processing;
	}

	public void setProcessing(String processing) {
		this.processing = processing;
	}

	@Override
	public String toString() {
		return "DonateReport [accuDonNo=" + accuDonNo + ", userId=" + userId + ", reportCode=" + reportCode
				+ ", reportContent=" + reportContent + ", dProjectNo=" + dProjectNo + ", processing=" + processing
				+ "]";
	}
	
	
}
