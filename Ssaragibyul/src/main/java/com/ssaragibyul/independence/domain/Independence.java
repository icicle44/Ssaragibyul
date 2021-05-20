package com.ssaragibyul.independence.domain;

import java.sql.Date;

public class Independence {
	private int independenceNo;
	private String nameKo;
	private String nameCh;
	private String birthday;
	private String lastday;
	private String sex;
	private String registerLarge;
	private String registerMid;
	private String activityLine;
	private int prizedYear;
	private String prizeClass;
	private String achievement;
	
	public Independence() {
		// TODO Auto-generated constructor stub
	}

	public int getIndependenceNo() {
		return independenceNo;
	}

	public void setIndependenceNo(int independenceNo) {
		this.independenceNo = independenceNo;
	}

	public String getNameKo() {
		return nameKo;
	}

	public void setNameKo(String nameKo) {
		this.nameKo = nameKo;
	}

	public String getNameCh() {
		return nameCh;
	}

	public void setNameCh(String nameCh) {
		this.nameCh = nameCh;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getLastday() {
		return lastday;
	}

	public void setLastday(String lastday) {
		this.lastday = lastday;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getRegisterLarge() {
		return registerLarge;
	}

	public void setRegisterLarge(String registerLarge) {
		this.registerLarge = registerLarge;
	}

	public String getRegisterMid() {
		return registerMid;
	}

	public void setRegisterMid(String registerMid) {
		this.registerMid = registerMid;
	}

	public String getActivityLine() {
		return activityLine;
	}

	public void setActivityLine(String activityLine) {
		this.activityLine = activityLine;
	}

	public int getPrizedYear() {
		return prizedYear;
	}

	public void setPrizedYear(int prizedYear) {
		this.prizedYear = prizedYear;
	}

	public String getPrizeClass() {
		return prizeClass;
	}

	public void setPrizeClass(String prizeClass) {
		this.prizeClass = prizeClass;
	}

	public String getAchievement() {
		return getAchievement();
	}

	public void setAchivement(String prizeContents) {
		this.achievement = achievement;
	}

	@Override
	public String toString() {
		return "independence [independenceNo=" + independenceNo + ", nameKo=" + nameKo + ", nameCh=" + nameCh
				+ ", birthday=" + birthday + ", lastday=" + lastday + ", sex=" + sex + ", registerLarge="
				+ registerLarge + ", registerMid=" + registerMid + ", activityLine=" + activityLine + ", prizedYear="
				+ prizedYear + ", prizeClass=" + prizeClass + ", achievement=" + achievement + "]";
	}
	
	
}
