package com.ssaragibyul.message.domain;

import java.sql.Timestamp;

public class Message {
	private int msgNo;
	private String senderId;
	private String receiverId;
	private String msgTitle;
	private String msgContents;
	private int presentPoint;
	private Timestamp regDate;
	private int readYn;
	private int sendDeleteYn;
	private int recDeleteYn;
	private int noticeMsgYn;
	
	public Message() {}

	public Message(int msgNo, String senderId, String receiverId, String msgTitle, String msgContents, int presentPoint,
			Timestamp regDate, int readYn, int sendDeleteYn, int recDeleteYn, int noticeMsgYn) {
		super();
		this.msgNo = msgNo;
		this.senderId = senderId;
		this.receiverId = receiverId;
		this.msgTitle = msgTitle;
		this.msgContents = msgContents;
		this.presentPoint = presentPoint;
		this.regDate = regDate;
		this.readYn = readYn;
		this.sendDeleteYn = sendDeleteYn;
		this.recDeleteYn = recDeleteYn;
		this.noticeMsgYn = noticeMsgYn;
	}

	public int getMsgNo() {
		return msgNo;
	}

	public void setMsgNo(int msgNo) {
		this.msgNo = msgNo;
	}

	public String getSenderId() {
		return senderId;
	}

	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}

	public String getReceiverId() {
		return receiverId;
	}

	public void setReceiverId(String receiverId) {
		this.receiverId = receiverId;
	}

	public String getMsgTitle() {
		return msgTitle;
	}

	public void setMsgTitle(String msgTitle) {
		this.msgTitle = msgTitle;
	}

	public String getMsgContents() {
		return msgContents;
	}

	public void setMsgContents(String msgContents) {
		this.msgContents = msgContents;
	}

	public int getPresentPoint() {
		return presentPoint;
	}

	public void setPresentPoint(int presentPoint) {
		this.presentPoint = presentPoint;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}

	public int getReadYn() {
		return readYn;
	}

	public void setReadYn(int readYn) {
		this.readYn = readYn;
	}

	public int getSendDeleteYn() {
		return sendDeleteYn;
	}

	public void setSendDeleteYn(int sendDeleteYn) {
		this.sendDeleteYn = sendDeleteYn;
	}

	public int getRecDeleteYn() {
		return recDeleteYn;
	}

	public void setRecDeleteYn(int recDeleteYn) {
		this.recDeleteYn = recDeleteYn;
	}

	public int getNoticeMsgYn() {
		return noticeMsgYn;
	}

	public void setNoticeMsgYn(int noticeMsgYn) {
		this.noticeMsgYn = noticeMsgYn;
	}

	@Override
	public String toString() {
		return "Message [msgNo=" + msgNo + ", senderId=" + senderId + ", receiverId=" + receiverId + ", msgTitle="
				+ msgTitle + ", msgContents=" + msgContents + ", presentPoint=" + presentPoint + ", regDate=" + regDate
				+ ", readYn=" + readYn + ", sendDeleteYn=" + sendDeleteYn + ", recDeleteYn=" + recDeleteYn
				+ ", noticeMsgYn=" + noticeMsgYn + "]";
	}
	
}
