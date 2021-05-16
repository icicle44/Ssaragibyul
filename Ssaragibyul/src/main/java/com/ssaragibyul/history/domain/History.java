package com.ssaragibyul.history.domain;

public class History {
	private int siteNo;
	private String siteName;
	private String stieType;
	private int latitude;
	private int longitude;
	private String siteAddr;
	
	public History() {
		// TODO Auto-generated constructor stub
	}

	
	
	public int getSiteNo() {
		return siteNo;
	}

	public void setSiteNo(int siteNo) {
		this.siteNo = siteNo;
	}

	public String getSiteName() {
		return siteName;
	}

	public void setSiteName(String siteName) {
		this.siteName = siteName;
	}

	public String getStieType() {
		return stieType;
	}

	public void setStieType(String stieType) {
		this.stieType = stieType;
	}

	public int getLatitude() {
		return latitude;
	}

	public void setLatitude(int latitude) {
		this.latitude = latitude;
	}

	public int getLongitude() {
		return longitude;
	}

	public void setLongitude(int longitude) {
		this.longitude = longitude;
	}

	public String getSiteAddr() {
		return siteAddr;
	}

	public void setSiteAddr(String siteAddr) {
		this.siteAddr = siteAddr;
	}

	@Override
	public String toString() {
		return "History [siteNo=" + siteNo + ", siteName=" + siteName + ", stieType=" + stieType + ", latitude="
				+ latitude + ", longitude=" + longitude + ", siteAddr=" + siteAddr + "]";
	}	
	
}
