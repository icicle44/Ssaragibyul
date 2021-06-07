package com.ssaragibyul.funding.domain;

public class ReportStat {
	
	private String reportDay;
	private String reportStatCount;
	
	public ReportStat() {}

	public String getReportDay() {
		return reportDay;
	}

	public void setReportDay(String reportDay) {
		this.reportDay = reportDay;
	}

	public String getReportStatCount() {
		return reportStatCount;
	}

	public void setReportStatCount(String reportStatCount) {
		this.reportStatCount = reportStatCount;
	}

	@Override
	public String toString() {
		return "ReportStat [reportDay=" + reportDay + ", reportStatCount=" + reportStatCount + "]";
	}
	
}
