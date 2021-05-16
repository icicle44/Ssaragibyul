package com.ssaragibyul.funding.domain;

import java.sql.Date;

public class FundingFile {
	private int fileNo;
	private String fileName;
	private int fileSize;
	private String filePath;
	private Date uploadTime;
	private int ProjectNo;
	
	public FundingFile() {}

	public FundingFile(int fileNo, String fileName, int fileSize, String filePath, Date uploadTime, int projectNo) {
		super();
		this.fileNo = fileNo;
		this.fileName = fileName;
		this.fileSize = fileSize;
		this.filePath = filePath;
		this.uploadTime = uploadTime;
		ProjectNo = projectNo;
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

	public int getProjectNo() {
		return ProjectNo;
	}

	public void setProjectNo(int projectNo) {
		ProjectNo = projectNo;
	}

	@Override
	public String toString() {
		return "FundingFile [fileNo=" + fileNo + ", fileName=" + fileName + ", fileSize=" + fileSize + ", filePath="
				+ filePath + ", uploadTime=" + uploadTime + ", ProjectNo=" + ProjectNo + "]";
	}
	
	
}
