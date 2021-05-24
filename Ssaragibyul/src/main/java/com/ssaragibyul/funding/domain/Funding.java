package com.ssaragibyul.funding.domain;

import java.sql.Date;

public class Funding {
	//펀딩 DB SQL 펀딩 프로젝트
	private int projectNo;
	private String userId;
	private String subjectName;//
	private String productName;//
	private int goalMoney;//
	private int sumMoney;
	private int optionPrice;//
	private Date startDate; //sysdate
	private Date finDate; //
	private String hostIntro;//
	private String projIntro;//
	private int likeCount;
	private int hitsCount;
	private int projectCode;
	private Date deleiveryDate;
	
	public Funding() {}
	
	
	
	public Funding(int projectNo, String userId, String subjectName, String productName, int goalMoney, int sumMoney,
			int optionPrice, Date startDate, Date finDate, String hostIntro, String projIntro, int likeCount,
			int hitsCount, int projectCode, Date deleiveryDate) {
		super();
		this.projectNo = projectNo;
		this.userId = userId;
		this.subjectName = subjectName;
		this.productName = productName;
		this.goalMoney = goalMoney;
		this.sumMoney = sumMoney;
		this.optionPrice = optionPrice;
		this.startDate = startDate;
		this.finDate = finDate;
		this.hostIntro = hostIntro;
		this.projIntro = projIntro;
		this.likeCount = likeCount;
		this.hitsCount = hitsCount;
		this.projectCode = projectCode;
		this.deleiveryDate = deleiveryDate;
	}



	public int getProjectNo() {
		return projectNo;
	}
	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getSubjectName() {
		return subjectName;
	}
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getGoalMoney() {
		return goalMoney;
	}
	public void setGoalMoney(int goalMoney) {
		this.goalMoney = goalMoney;
	}
	public int getSumMoney() {
		return sumMoney;
	}
	public void setSumMoney(int sumMoney) {
		this.sumMoney = sumMoney;
	}
	public int getOptionPrice() {
		return optionPrice;
	}
	public void setOptionPrice(int optionPrice) {
		this.optionPrice = optionPrice;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getFinDate() {
		return finDate;
	}
	public void setFinDate(Date finDate) {
		this.finDate = finDate;
	}
	public String getHostIntro() {
		return hostIntro;
	}
	public void setHostIntro(String hostIntro) {
		this.hostIntro = hostIntro;
	}
	public String getProjIntro() {
		return projIntro;
	}
	public void setProjIntro(String projIntro) {
		this.projIntro = projIntro;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public int getHitsCount() {
		return hitsCount;
	}
	public void setHitsCount(int hitsCount) {
		this.hitsCount = hitsCount;
	}
	public int getProjectCode() {
		return projectCode;
	}
	public void setProjectCode(int projectCode) {
		this.projectCode = projectCode;
	}
	public Date getDeleiveryDate() {
		return deleiveryDate;
	}
	public void setDeleiveryDate(Date deleiveryDate) {
		this.deleiveryDate = deleiveryDate;
	}
	@Override
	public String toString() {
		return "Funding [projectNo=" + projectNo + ", userId=" + userId + ", subjectName=" + subjectName
				+ ", productName=" + productName + ", goalMoney=" + goalMoney + ", sumMoney=" + sumMoney
				+ ", optionPrice=" + optionPrice + ", startDate=" + startDate + ", finDate=" + finDate + ", hostIntro="
				+ hostIntro + ", projIntro=" + projIntro + ", likeCount=" + likeCount + ", hitsCount=" + hitsCount
				+ ", projectCode=" + projectCode + ", deleiveryDate=" + deleiveryDate + "]";
	}
	
	
	
}
