package com.ssaragibyul.visit.domain;

public class VisitStat {
	
	private String visitDay;
	private String visitStatCount;
	
	public VisitStat() {}

	public String getVisitDay() {
		return visitDay;
	}

	public void setVisitDay(String visitDay) {
		this.visitDay = visitDay;
	}

	public String getVisitStatCount() {
		return visitStatCount;
	}

	public void setVisitStatCount(String visitStatCount) {
		this.visitStatCount = visitStatCount;
	}

	@Override
	public String toString() {
		return "VisitStat [visitDay=" + visitDay + ", visitStatCount=" + visitStatCount + "]";
	}

	
	
}
