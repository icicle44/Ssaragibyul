package com.ssaragibyul.history.domain;

import java.sql.Date;
import java.sql.Timestamp;

public class History {
	private int siteNo;
	private String siteName;
	private String siteType;
	private String siteContents;
	private double latitude;
	private double longitude;
	private String siteAddr;
	private Date hCreateDate;
	private Date hUpdateDate;
	private String hStatus;
	private int fileNo;
	private String originarFilename;
	private String renameFilename;
	private Timestamp uploadTime;
	private int visitor;
	
	public History() {}
	
	public History(int siteNo, String siteName, String siteType, String siteContents, double latitude, double longitude,
			String siteAddr, Date hCreateDate, Date hUpdateDate, String hStatus, int fileNo, String originarFilename,
			String renameFilename, Timestamp uploadTime, int visitor) {
		super();
		this.siteNo = siteNo;
		this.siteName = siteName;
		this.siteType = siteType;
		this.siteContents = siteContents;
		this.latitude = latitude;
		this.longitude = longitude;
		this.siteAddr = siteAddr;
		this.hCreateDate = hCreateDate;
		this.hUpdateDate = hUpdateDate;
		this.hStatus = hStatus;
		this.fileNo = fileNo;
		this.originarFilename = originarFilename;
		this.renameFilename = renameFilename;
		this.uploadTime = uploadTime;
		this.visitor = visitor;
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

	public String getSiteType() {
		return siteType;
	}

	public void setSiteType(String siteType) {
		this.siteType = siteType;
	}

	public String getSiteContents() {
		return siteContents;
	}

	public void setSiteContents(String siteContents) {
		this.siteContents = siteContents;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
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

	public int getVisitor() {
		return visitor;
	}

	public void setVisitor(int visitor) {
		this.visitor = visitor;
	}

	@Override
	public String toString() {
		return "History [siteNo=" + siteNo + ", siteName=" + siteName + ", siteType=" + siteType + ", siteContents="
				+ siteContents + ", latitude=" + latitude + ", longitude=" + longitude + ", siteAddr=" + siteAddr
				+ ", hCreateDate=" + hCreateDate + ", hUpdateDate=" + hUpdateDate + ", hStatus=" + hStatus + ", fileNo="
				+ fileNo + ", originarFilename=" + originarFilename + ", renameFilename=" + renameFilename
				+ ", uploadTime=" + uploadTime + ", visitor=" + visitor + "]";
	}


}
