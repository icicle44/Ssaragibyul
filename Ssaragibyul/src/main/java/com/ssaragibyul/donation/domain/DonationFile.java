package com.ssaragibyul.donation.domain;

import java.sql.Date;

public class DonationFile {

	private int fileNo;
	private String fileName;
	private int fileSize;
	private String filePath;
	private Date uploadTime;
	private int dProjectNo;
	
	public DonationFile() {}
	
	public DonationFile(int fileNo, String fileName, int fileSize, String filePath, Date uploadTime, int dProjectNo) {
		super();
		this.fileNo = fileNo;
		this.fileName = fileName;
		this.fileSize = fileSize;
		this.filePath = filePath;
		this.uploadTime = uploadTime;
		this.dProjectNo = dProjectNo;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
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

	public int getdProjectNo() {
		return dProjectNo;
	}

	public void setdProjectNo(int dProjectNo) {
		this.dProjectNo = dProjectNo;
	}

	@Override
	public String toString() {
		return "DonateFile [fileNo=" + fileNo + ", fileName=" + fileName + ", fileSize=" + fileSize + ", filePath="
				+ filePath + ", uploadTime=" + uploadTime + ", dProjectNo=" + dProjectNo + "]";
	}
	
	
}
