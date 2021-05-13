package com.ssaragibyul.member.domain;

import java.sql.Date;

public class Member {
	private String userId;
	private String userPw;
	private String nickName;
	private String userEmail;
	private String userPhone;
	private String userAddr;
	private String birthday;
	private Date enrollDate;
	private Date withdrawDate;
	private int mStatus;
	private int mngNo;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}
	
	public Member(String userId, String userPw) {
		super();
		this.userId = userId;
		this.userPw = userPw;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserAddr() {
		return userAddr;
	}

	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getWithdrawDate() {
		return withdrawDate;
	}

	public void setWithdrawDate(Date withdrawDate) {
		this.withdrawDate = withdrawDate;
	}

	public int getmStatus() {
		return mStatus;
	}

	public void setmStatus(int mStatus) {
		this.mStatus = mStatus;
	}

	public int getMngNo() {
		return mngNo;
	}

	public void setMngNo(int mngNo) {
		this.mngNo = mngNo;
	}

	@Override
	public String toString() {
		return "Member [userId=" + userId + ", userPw=" + userPw + ", nickName=" + nickName + ", userEmail=" + userEmail
				+ ", userPhone=" + userPhone + ", userAddr=" + userAddr + ", birthday=" + birthday + ", enrollDate="
				+ enrollDate + ", withdrawDate=" + withdrawDate + ", mStatus=" + mStatus + ", mngNo=" + mngNo + "]";
	}
	
}
