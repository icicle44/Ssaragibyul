package com.ssaragibyul.history.domain;

import java.sql.Date;
import java.sql.Timestamp;

public class History {
	private int siteNo;
	private String siteName;
	private String stieType;
	private int latitude;
	private int longitude;
	private String siteAddr;
	private Date hCreateDate;
	private Date hUpdateDate;
	private String hStatus;
	private int fileNo;
	private String originarFilename;
	private String renameFilename;
	private Timestamp uploadTime;

	
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


	public Date gethCreateDate() {
		return hCreateDate;
	}


	public void sethCreateDate(Date hCreateDate) {
		this.hCreateDate = hCreateDate;
	}


	public Date gethUpdateDate() {
		return hUpdateDate;
	}


	public void sethUpdateDate(Date hUpdateDate) {
		this.hUpdateDate = hUpdateDate;
	}


	public String gethStatus() {
		return hStatus;
	}


	public void sethStatus(String hStatus) {
		this.hStatus = hStatus;
	}


	public int getFileNo() {
		return fileNo;
	}


	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}


	public String getOriginarFilename() {
		return originarFilename;
	}


	public void setOriginarFilename(String originarFilename) {
		this.originarFilename = originarFilename;
	}


	public String getRenameFilename() {
		return renameFilename;
	}


	public void setRenameFilename(String renameFilename) {
		this.renameFilename = renameFilename;
	}


	public Timestamp getUploadTime() {
		return uploadTime;
	}


	public void setUploadTime(Timestamp uploadTime) {
		this.uploadTime = uploadTime;
	}


	@Override
	public String toString() {
		return "History [siteNo=" + siteNo + ", siteName=" + siteName + ", stieType=" + stieType + ", latitude="
				+ latitude + ", longitude=" + longitude + ", siteAddr=" + siteAddr + ", hCreateDate=" + hCreateDate
				+ ", hUpdateDate=" + hUpdateDate + ", hStatus=" + hStatus + ", fileNo=" + fileNo + ", originarFilename="
				+ originarFilename + ", renameFilename=" + renameFilename + ", uploadTime=" + uploadTime + "]";
	}

}
