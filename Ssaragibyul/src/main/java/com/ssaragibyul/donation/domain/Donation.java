package com.ssaragibyul.donation.domain;

import java.sql.Date;

public class Donation {

	public int dProjectNo;
	public String userId;
	public String subject;
	public int goalMoney;
	public int sumMoney;
	public int optionPrice;
	public Date startDate;
	public Date finDate;
	public String hostIntro;
	public String projIntro;
	public int likeCount;
	public int hitsCount;
	public String projectCode;
	
	public Donation() {}
	
	public Donation(int dProjectNo, String userId, String subject, int goalMoney, int sumMoney, int optionPrice,
			Date startDate, Date finDate, String hostIntro, String projIntro, int likeCount, int hitsCount,
			String projectCode) {
		super();
		this.dProjectNo = dProjectNo;
		this.userId = userId;
		this.subject = subject;
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
	}


	public int getdProjectNo() {
		return dProjectNo;
	}


	public void setdProjectNo(int dProjectNo) {
		this.dProjectNo = dProjectNo;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getSubject() {
		return subject;
	}


	public void setSubject(String subject) {
		this.subject = subject;
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


	public String getProjectCode() {
		return projectCode;
	}


	public void setProjectCode(String projectCode) {
		this.projectCode = projectCode;
	}


	@Override
	public String toString() {
		return "Donation [dProjectNo=" + dProjectNo + ", userId=" + userId + ", subject=" + subject + ", goalMoney="
				+ goalMoney + ", sumMoney=" + sumMoney + ", optionPrice=" + optionPrice + ", startDate=" + startDate
				+ ", finDate=" + finDate + ", hostIntro=" + hostIntro + ", projIntro=" + projIntro + ", likeCount="
				+ likeCount + ", hitsCount=" + hitsCount + ", projectCode=" + projectCode + "]";
	}
	
	
	
	
	
}
