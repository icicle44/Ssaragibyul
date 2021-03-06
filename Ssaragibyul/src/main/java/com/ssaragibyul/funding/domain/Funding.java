package com.ssaragibyul.funding.domain;

import java.sql.Date;

import com.ssaragibyul.member.domain.Member;

public class Funding {
	//펀딩 DB SQL 펀딩 프로젝트
	private int projectNo;
	private String userId;
	private String subjectName;//
	private String productName;//
	private int goalMoney;//
	private int sumMoney;
	private int optionPrice;//
	private int optionLimit;
	private Date startDate; //sysdate
	private Date finDate; //
	private String projectStory;//
	private String productContent;//
	private String warningIntro;//
	private int likeCount;
	private int hitsCount;
	private int projectCode;
	private Date deleiveryDate;
	private int percent;
	private int leftDate;
	private int count;
	
	private FundingFile fundingFile;
	private Member member;
	
	
	public Funding() {}

	
	
	
	
	
	
	
	
public Funding(int projectNo, String userId, String subjectName, String productName, int goalMoney, int sumMoney,
			int optionPrice, int optionLimit, Date startDate, Date finDate, String projectStory, String productContent,
			String warningIntro, int likeCount, int hitsCount, int projectCode, Date deleiveryDate, int percent,
			int leftDate, int count, FundingFile fundingFile, Member member) {
		super();
		this.projectNo = projectNo;
		this.userId = userId;
		this.subjectName = subjectName;
		this.productName = productName;
		this.goalMoney = goalMoney;
		this.sumMoney = sumMoney;
		this.optionPrice = optionPrice;
		this.optionLimit = optionLimit;
		this.startDate = startDate;
		this.finDate = finDate;
		this.projectStory = projectStory;
		this.productContent = productContent;
		this.warningIntro = warningIntro;
		this.likeCount = likeCount;
		this.hitsCount = hitsCount;
		this.projectCode = projectCode;
		this.deleiveryDate = deleiveryDate;
		this.percent = percent;
		this.leftDate = leftDate;
		this.count = count;
		this.fundingFile = fundingFile;
		this.member = member;
	}









public Funding(int projectNo, String userId, String subjectName, String productName, int goalMoney, int sumMoney,
			int optionPrice, int optionLimit, Date startDate, Date finDate, String projectStory, String productContent,
			String warningIntro, int likeCount, int hitsCount, int projectCode, Date deleiveryDate, int percent,
			int leftDate, int count, FundingFile fundingFile) {
		super();
		this.projectNo = projectNo;
		this.userId = userId;
		this.subjectName = subjectName;
		this.productName = productName;
		this.goalMoney = goalMoney;
		this.sumMoney = sumMoney;
		this.optionPrice = optionPrice;
		this.optionLimit = optionLimit;
		this.startDate = startDate;
		this.finDate = finDate;
		this.projectStory = projectStory;
		this.productContent = productContent;
		this.warningIntro = warningIntro;
		this.likeCount = likeCount;
		this.hitsCount = hitsCount;
		this.projectCode = projectCode;
		this.deleiveryDate = deleiveryDate;
		this.percent = percent;
		this.leftDate = leftDate;
		this.count = count;
		this.fundingFile = fundingFile;
	}









public Funding(int projectNo, String userId, String subjectName, String productName, int goalMoney, int sumMoney,
			int optionPrice, int optionLimit, Date startDate, Date finDate, String projectStory, String productContent,
			String warningIntro, int likeCount, int hitsCount, int projectCode, Date deleiveryDate, int percent,
			int leftDate, FundingFile fundingFile) {
		super();
		this.projectNo = projectNo;
		this.userId = userId;
		this.subjectName = subjectName;
		this.productName = productName;
		this.goalMoney = goalMoney;
		this.sumMoney = sumMoney;
		this.optionPrice = optionPrice;
		this.optionLimit = optionLimit;
		this.startDate = startDate;
		this.finDate = finDate;
		this.projectStory = projectStory;
		this.productContent = productContent;
		this.warningIntro = warningIntro;
		this.likeCount = likeCount;
		this.hitsCount = hitsCount;
		this.projectCode = projectCode;
		this.deleiveryDate = deleiveryDate;
		this.percent = percent;
		this.leftDate = leftDate;
		this.fundingFile = fundingFile;
	}//최종









public Funding(int projectNo, String userId, String subjectName, String productName, int goalMoney, int sumMoney,
			int optionPrice, int optionLimit, Date startDate, Date finDate, String projectStory, String productContent,
			String warningIntro, int likeCount, int hitsCount, int projectCode, Date deleiveryDate,
			FundingFile fundingFile) {
		super();
		this.projectNo = projectNo;
		this.userId = userId;
		this.subjectName = subjectName;
		this.productName = productName;
		this.goalMoney = goalMoney;
		this.sumMoney = sumMoney;
		this.optionPrice = optionPrice;
		this.optionLimit = optionLimit;
		this.startDate = startDate;
		this.finDate = finDate;
		this.projectStory = projectStory;
		this.productContent = productContent;
		this.warningIntro = warningIntro;
		this.likeCount = likeCount;
		this.hitsCount = hitsCount;
		this.projectCode = projectCode;
		this.deleiveryDate = deleiveryDate;
		this.fundingFile = fundingFile;
	} // 펀딩 파일 추가 버젼.




		//기존 거
public Funding(int projectNo, String userId, String subjectName, String productName, int goalMoney, int sumMoney,
			int optionPrice, int optionLimit, Date startDate, Date finDate, String projectStory, String productContent,
			String warningIntro, int likeCount, int hitsCount, int projectCode, Date deleiveryDate) {
		super();
		this.projectNo = projectNo;
		this.userId = userId;
		this.subjectName = subjectName;
		this.productName = productName;
		this.goalMoney = goalMoney;
		this.sumMoney = sumMoney;
		this.optionPrice = optionPrice;
		this.optionLimit = optionLimit;
		this.startDate = startDate;
		this.finDate = finDate;
		this.projectStory = projectStory;
		this.productContent = productContent;
		this.warningIntro = warningIntro;
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

	public int getOptionLimit() {
		return optionLimit;
	}

	public void setOptionLimit(int optionLimit) {
		this.optionLimit = optionLimit;
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

	public String getProductContent() {
		return productContent;
	}

	public void setProductContent(String productContent) {
		this.productContent = productContent;
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

	public Date getDeleiveryDate() {
		return deleiveryDate;
	}

	public void setDeleiveryDate(Date deleiveryDate) {
		this.deleiveryDate = deleiveryDate;
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
	
	
	public FundingFile getFundingFile() {
		return fundingFile;
	}
	
	public void setFundingFile(FundingFile fundingFile) {
		this.fundingFile = fundingFile;
	}


	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}









	public Member getMember() {
		return member;
	}









	public void setMember(Member member) {
		this.member = member;
	}









	@Override
	public String toString() {
		return "Funding [projectNo=" + projectNo + ", userId=" + userId + ", subjectName=" + subjectName
				+ ", productName=" + productName + ", goalMoney=" + goalMoney + ", sumMoney=" + sumMoney
				+ ", optionPrice=" + optionPrice + ", optionLimit=" + optionLimit + ", startDate=" + startDate
				+ ", finDate=" + finDate + ", projectStory=" + projectStory + ", productContent=" + productContent
				+ ", warningIntro=" + warningIntro + ", likeCount=" + likeCount + ", hitsCount=" + hitsCount
				+ ", projectCode=" + projectCode + ", deleiveryDate=" + deleiveryDate + ", percent=" + percent
				+ ", leftDate=" + leftDate + ", count=" + count + ", fundingFile=" + fundingFile + ", member=" + member
				+ "]";
	}




	
	
	}
	
	
