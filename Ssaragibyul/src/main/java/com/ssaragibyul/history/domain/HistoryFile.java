package com.ssaragibyul.history.domain;

import java.sql.Date;

public class HistoryFile {

	private int fileNo;
	private String originarFilename;
	private String renameFilename;
	private int fileSize;
	private String filePath;
	private Date uploadTime;
	private int siteNo;
	
	public HistoryFile() {}

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

	public int getFileSize() {
		return fileSize;
	}

	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getUploadTime() {
		return uploadTime;
	}

	public void setUploadTime(Date uploadTime) {
		this.uploadTime = uploadTime;
	}

	public int getSiteNo() {
		return siteNo;
	}

	public void setSiteNo(int siteNo) {
		this.siteNo = siteNo;
	}

	@Override
	public String toString() {
		return "HistoryFile [fileNo=" + fileNo + ", originarFilename=" + originarFilename + ", renameFilename="
				+ renameFilename + ", fileSize=" + fileSize + ", filePath=" + filePath + ", uploadTime=" + uploadTime
				+ ", siteNo=" + siteNo + "]";
	}
	
	
}
