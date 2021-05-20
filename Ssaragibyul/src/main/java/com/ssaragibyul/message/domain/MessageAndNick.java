package com.ssaragibyul.message.domain;

public class MessageAndNick extends Message{
	
	private String nickName;
	
	public MessageAndNick() {}

	public MessageAndNick(String nickName) {
		super();
		this.nickName = nickName;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	@Override
	public String toString() {
		return "MessageAndNick [nickName=" + nickName + ", getMsgNo()=" + getMsgNo() + ", getSenderId()="
				+ getSenderId() + ", getReceiverId()=" + getReceiverId() + ", getMsgTitle()=" + getMsgTitle()
				+ ", getMsgContents()=" + getMsgContents() + ", getPresentPoint()=" + getPresentPoint()
				+ ", getRegDate()=" + getRegDate() + ", getReadYn()=" + getReadYn() + ", getSendDeleteYn()="
				+ getSendDeleteYn() + ", getRecDeleteYn()=" + getRecDeleteYn() + ", getMsgType()=" + getMsgType()
				+ ", toString()=" + super.toString() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ "]";
	}

}
