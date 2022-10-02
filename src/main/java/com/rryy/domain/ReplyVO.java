package com.rryy.domain;

import java.util.Date;

public class ReplyVO {

	/*
	 * create table myreply(
bno number not null,
rno number not null,
content varchar2(2000) not null,
writer varchar2(30) not null,
regdate date default sysdate, 
primary key (bno, rno) 
);
	 */
	
	private int bno;
	private int rno;
	private String content;
	private String writer;
	private Date regdate;
	
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
}
