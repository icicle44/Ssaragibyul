package com.ssaragibyul.member.domain;

public class Email {
	private String subject; //제목
    private String content; // 내용
    private String receiver; // 받는 사람
     
    public String getReceiver() {
        return receiver;
    }
    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }
 
    public String getSubject() {
        return subject;
    }
    public void setSubject(String subject) {
        this.subject = subject;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
}


