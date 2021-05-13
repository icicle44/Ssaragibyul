package com.ssaragibyul.common;

import java.sql.Timestamp;

public class Board {
	protected int no; // 글번호
	protected String title; //제목
	protected String contents; // 내용
	protected String nick; // 작성자
	protected String userId; // 아이디
	protected int hits; // 조회 수
	protected int likes; // 좋아요 수
	protected int replys; // 댓글 수 
	protected Timestamp enrollDate; // 작성일
	
	public Board() {
		// TODO Auto-generated constructor stub
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}
	
	

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	
	public int getReplys() {
		return replys;
	}

	public void setReplys(int replys) {
		this.replys = replys;
	}

	public Timestamp getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Timestamp enrollDate) {
		this.enrollDate = enrollDate;
	}

	@Override
	public String toString() {
		return "Board [no=" + no + ", title=" + title + ", contents=" + contents + ", nick=" + nick + ", hits=" + hits
				+ ", likes=" + likes + ", enrollDate=" + enrollDate + "]";
	}
}
