package com.ssaragibyul.donation.domain;

import java.sql.Date;

public class DonationReport {

	private int accuDonNo;
	private String userId;
	private int reportCode;
	private String reportContent;
	private String processing;
	private Date accusationDate;
	private int projectNo;
	
	public DonationReport() {}

	public DonationReport(int accuDonNo, String userId, int reportCode, String reportContent, String processing,
			Date accusationDate, int projectNo) {
		super();
		this.accuDonNo = accuDonNo;
		this.userId = userId;
		this.reportCode = reportCode;
		this.reportContent = reportContent;
		this.processing = processing;
		this.accusationDate = accusationDate;
		this.projectNo = projectNo;
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

	public String getProcessing() {
		return processing;
	}

	public void setProcessing(String processing) {
		this.processing = processing;
	}

	public Date getAccusationDate() {
		return accusationDate;
	}

	public void setAccusationDate(Date accusationDate) {
		this.accusationDate = accusationDate;
	}

	public int getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}

	@Override
	public String toString() {
		return "DonationReport [accuDonNo=" + accuDonNo + ", userId=" + userId + ", reportCode=" + reportCode
				+ ", reportContent=" + reportContent + ", processing=" + processing + ", accusationDate="
				+ accusationDate + ", projectNo=" + projectNo + "]";
	}

	
	
}
