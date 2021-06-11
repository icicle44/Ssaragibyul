package com.ssaragibyul.donation.domain;

import java.sql.Date;

import com.ssaragibyul.member.domain.Member;

public class Donation {

	private int projectNo;
	private String userId;
	private String subjectName;//
	private int goalMoney;//
	private int sumMoney;
	private Date startDate; //
	private Date finDate; //
	private String projectStory;//
	private String warningIntro;//
	private int likeCount;
	private int hitsCount;
	private int projectCode;
	private int percent;
	private int leftDate;
	
	private DonationFile donationFile;
	private Member member;	
	
	public Donation() {}
	
	
	

	public Donation(int projectNo, String userId, String subjectName, int goalMoney, int sumMoney, Date startDate,
			Date finDate, String projectStory, String warningIntro, int likeCount, int hitsCount, int projectCode,
			int percent, int leftDate, DonationFile donationFile, Member member) {
		super();
		this.projectNo = projectNo;
		this.userId = userId;
		this.subjectName = subjectName;
		this.goalMoney = goalMoney;
		this.sumMoney = sumMoney;
		this.startDate = startDate;
		this.finDate = finDate;
		this.projectStory = projectStory;
		this.warningIntro = warningIntro;
		this.likeCount = likeCount;
		this.hitsCount = hitsCount;
		this.projectCode = projectCode;
		this.percent = percent;
		this.leftDate = leftDate;
		this.donationFile = donationFile;
		this.member = member;
	}

	public Donation(int projectNo, String userId, String subjectName, int goalMoney, int sumMoney, Date startDate,
			Date finDate, String projectStory, String warningIntro, int likeCount, int hitsCount, int projectCode,
			int percent, int leftDate, DonationFile donationFile) {
		super();
		this.projectNo = projectNo;
		this.userId = userId;
		this.subjectName = subjectName;
		this.goalMoney = goalMoney;
		this.sumMoney = sumMoney;
		this.startDate = startDate;
		this.finDate = finDate;
		this.projectStory = projectStory;
		this.warningIntro = warningIntro;
		this.likeCount = likeCount;
		this.hitsCount = hitsCount;
		this.projectCode = projectCode;
		this.percent = percent;
		this.leftDate = leftDate;
		this.donationFile = donationFile;
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

	public String getProjectStory() {
		return projectStory;
	}

	public void setProjectStory(String projectStory) {
		this.projectStory = projectStory;
	}

	public String getWarningIntro() {
		return warningIntro;
	}

	public void setWarningIntro(String warningIntro) {
		this.warningIntro = warningIntro;
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

	public int getPercent() {
		return percent;
	}

	public void setPercent(int percent) {
		this.percent = percent;
	}

	public int getLeftDate() {
		return leftDate;
	}

	public void setLeftDate(int leftDate) {
		this.leftDate = leftDate;
	}

	public DonationFile getDonationFile() {
		return donationFile;
	}

	public void setDonationFile(DonationFile donationFile) {
		this.donationFile = donationFile;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	@Override
	public String toString() {
		return "Donation [projectNo=" + projectNo + ", userId=" + userId + ", subjectName=" + subjectName
				+ ", goalMoney=" + goalMoney + ", sumMoney=" + sumMoney + ", startDate=" + startDate + ", finDate="
				+ finDate + ", projectStory=" + projectStory + ", warningIntro=" + warningIntro + ", likeCount="
				+ likeCount + ", hitsCount=" + hitsCount + ", projectCode=" + projectCode + ", percent=" + percent
				+ ", leftDate=" + leftDate + ", donationFile=" + donationFile + ", member=" + member + "]";
	}	
	
}
	
	