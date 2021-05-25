package com.ssaragibyul.funding.domain;

import java.sql.Date;

public class FundingFile {
	private int fileNo;
	private String videoUrl;
	private String fileMainName;
	private int fileMainSize;
	private String fileMainPath;
	private String fileSub1Name;
	private int fileSub1Size;
	private String fileSub1Path;
	private String fileSub2Name;
	private int fileSub2Size;
	private String fileSub2Path;
	private Date uploadTime;
	private int projectNo;
	
	public FundingFile() {}

	
	
	public FundingFile(int fileNo, String videoUrl, String fileMainName, int fileMainSize, String fileMainPath,
			String fileSub1Name, int fileSub1Size, String fileSub1Path, String fileSub2Name, int fileSub2Size,
			String fileSub2Path, Date uploadTime, int projectNo) {
		super();
		this.fileNo = fileNo;
		this.videoUrl = videoUrl;
		this.fileMainName = fileMainName;
		this.fileMainSize = fileMainSize;
		this.fileMainPath = fileMainPath;
		this.fileSub1Name = fileSub1Name;
		this.fileSub1Size = fileSub1Size;
		this.fileSub1Path = fileSub1Path;
		this.fileSub2Name = fileSub2Name;
		this.fileSub2Size = fileSub2Size;
		this.fileSub2Path = fileSub2Path;
		this.uploadTime = uploadTime;
		this.projectNo = projectNo;
	}


	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getVideoUrl() {
		return videoUrl;
	}

	public void setVideoUrl(String videoUrl) {
		this.videoUrl = videoUrl;
	}

	public String getFileMainName() {
		return fileMainName;
	}

	public void setFileMainName(String fileMainName) {
		this.fileMainName = fileMainName;
	}

	public int getFileMainSize() {
		return fileMainSize;
	}

	public void setFileMainSize(int fileMainSize) {
		this.fileMainSize = fileMainSize;
	}

	public String getFileMainPath() {
		return fileMainPath;
	}

	public void setFileMainPath(String fileMainPath) {
		this.fileMainPath = fileMainPath;
	}

	public String getFileSub1Name() {
		return fileSub1Name;
	}

	public void setFileSub1Name(String fileSub1Name) {
		this.fileSub1Name = fileSub1Name;
	}

	public int getFileSub1Size() {
		return fileSub1Size;
	}

	public void setFileSub1Size(int fileSub1Size) {
		this.fileSub1Size = fileSub1Size;
	}

	public String getFileSub1Path() {
		return fileSub1Path;
	}

	public void setFileSub1Path(String fileSub1Path) {
		this.fileSub1Path = fileSub1Path;
	}

	public String getFileSub2Name() {
		return fileSub2Name;
	}

	public void setFileSub2Name(String fileSub2Name) {
		this.fileSub2Name = fileSub2Name;
	}

	public int getFileSub2Size() {
		return fileSub2Size;
	}

	public void setFileSub2Size(int fileSub2Size) {
		this.fileSub2Size = fileSub2Size;
	}

	public String getFileSub2Path() {
		return fileSub2Path;
	}

	public void setFileSub2Path(String fileSub2Path) {
		this.fileSub2Path = fileSub2Path;
	}

	public Date getUploadTime() {
		return uploadTime;
	}

	public void setUploadTime(Date uploadTime) {
		this.uploadTime = uploadTime;
	}

	public int getProjectNo() {
		return projectNo;
	}

	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}

	@Override
	public String toString() {
		return "FundingFile [fileNo=" + fileNo + ", videoUrl=" + videoUrl + ", fileMainName=" + fileMainName
				+ ", fileMainSize=" + fileMainSize + ", fileMainPath=" + fileMainPath + ", fileSub1Name=" + fileSub1Name
				+ ", fileSub1Size=" + fileSub1Size + ", fileSub1Path=" + fileSub1Path + ", fileSub2Name=" + fileSub2Name
				+ ", fileSub2Size=" + fileSub2Size + ", fileSub2Path=" + fileSub2Path + ", uploadTime=" + uploadTime
				+ ", projectNo=" + projectNo + "]";
	}


	
	
}
