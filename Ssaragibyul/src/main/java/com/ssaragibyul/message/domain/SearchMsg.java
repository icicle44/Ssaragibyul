package com.ssaragibyul.message.domain;

import com.ssaragibyul.common.Search;

public class SearchMsg extends Search{
	
	private String userId;
	private String flag;
	
	public SearchMsg() {}

	public SearchMsg(String userId, String flag) {
		super();
		this.userId = userId;
		this.flag = flag;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	@Override
	public String toString() {
		return "SearchMsg [userId=" + userId + ", flag=" + flag + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
	
}
