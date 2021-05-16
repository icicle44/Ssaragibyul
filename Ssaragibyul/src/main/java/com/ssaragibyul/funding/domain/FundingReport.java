package com.ssaragibyul.funding.domain;

public class FundingReport {
	private int accuFundingNo;
	private String userId;
	private int reportCode;
	private String reportContent;
	private int projectNo;
	private String processing;
	
	public FundingReport() {}

	public FundingReport(int accuFundingNo, String userId, int reportCode, String reportContent, int projectNo,
			String processing) {
		super();
		this.accuFundingNo = accuFundingNo;
		this.userId = userId;
		this.reportCode = reportCode;
		this.reportContent = reportContent;
		this.projectNo = projectNo;
		this.processing = processing;
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

	public int getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}

	public String getProcessing() {
		return processing;
	}

	public void setProcessing(String processing) {
		this.processing = processing;
	}

	@Override
	public String toString() {
		return "FundingReport [accuFundingNo=" + accuFundingNo + ", userId=" + userId + ", reportCode=" + reportCode
				+ ", reportContent=" + reportContent + ", projectNo=" + projectNo + ", processing=" + processing + "]";
	}

	
	
}
