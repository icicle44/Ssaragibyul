package com.ssaragibyul.funding.domain;

import java.sql.Date;

public class FundingReport {
	private int accuFundingNo;
	private String userId;
	private int reportCode;
	private String reportContent;
	private String processing;
	private Date accusationDate;
	private int projectNo;
	
	
	public FundingReport() {}

	
	
	public FundingReport(int accuFundingNo, String userId, int reportCode, String reportContent, String processing,
			Date accusationDate, int projectNo) {
		super();
		this.accuFundingNo = accuFundingNo;
		this.userId = userId;
		this.reportCode = reportCode;
		this.reportContent = reportContent;
		this.processing = processing;
		this.accusationDate = accusationDate;
		this.projectNo = projectNo;
	}



	public int getAccuFundingNo() {
		return accuFundingNo;
	}


	public void setAccuFundingNo(int accuFundingNo) {
		this.accuFundingNo = accuFundingNo;
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
		return "FundingReport [accuFundingNo=" + accuFundingNo + ", userId=" + userId + ", reportCode=" + reportCode
				+ ", reportContent=" + reportContent + ", processing=" + processing + ", accusationDate="
				+ accusationDate + ", projectNo=" + projectNo + "]";
	}

	
	
	
}
