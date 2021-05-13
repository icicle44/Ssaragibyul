package com.ssaragibyul.common;

	import java.sql.Timestamp;

	public class FileData {
		private int no;
		private int fileNo;
		private String fileName;
		private String filePath;
		private long fileSize;
		private String fileUser;
		private String fileType;
		private Timestamp uploadTime; 
		
		// constructor
		public FileData() {
			// TODO Auto-generated constructor stub
			
		}
		// getter/setter
		public String getFileName() {
			return fileName;
		}

		public String getFileType() {
			return fileType;
		}


		public void setFileType(String fileType) {
			this.fileType = fileType;
		}


		
		public int getNo() {
			return no;
		}


		public void setNo(int no) {
			this.no = no;
		}


		public int getFileNo() {
			return fileNo;
		}

		public void setFileNo(int fileNo) {
			this.fileNo = fileNo;
		}



		public void setFileName(String fileName) {
			this.fileName = fileName;
		}

		public String getFilePath() {
			return filePath;
		}

		public void setFilePath(String filePath) {
			this.filePath = filePath;
		}

		public long getFileSize() {
			return fileSize;
		}

		public void setFileSize(long fileSize) {
			this.fileSize = fileSize;
		}

		public String getFileUser() {
			return fileUser;
		}

		public void setFileUser(String fileUser) {
			this.fileUser = fileUser;
		}

		public Timestamp getUploadTime() {
			return uploadTime;
		}

		public void setUploadTime(Timestamp uploadTime) {
			this.uploadTime = uploadTime;
		}


		@Override
		public String toString() {
			return "FileData [fileNo=" + fileNo + ", fileName=" + fileName + ", filePath=" + filePath + ", fileSize="
					+ fileSize + ", fileUser=" + fileUser + ", fileType=" + fileType + ", uploadTime=" + uploadTime + "]";
		}

}
