package com.englishvillage.member.admin.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class QuestionBoardDto {
	
	private int idx;
	private int no;
	private int boardNo;
	private String title;
	private String content;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date boardCreateDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date boardModDate;
	private String answerStatus;
	private String grade;
	private String name;
	private String email;
	private String reply;
	private Date commentCreDate;
	
	
	public QuestionBoardDto() {
		super();
	}



	public QuestionBoardDto(int idx, int no, int boardNo,  String title, String content, Date boardCreateDate, Date boardModDate,
			String answerStatus, String grade, String name, String email, String reply, Date commentCreDate) {
		super();
		this.idx = idx;
		this.no = no;
		this.boardNo = boardNo;
		this.title = title;
		this.content = content;
		this.boardCreateDate = boardCreateDate;
		this.boardModDate = boardModDate;
		this.answerStatus = answerStatus;
		this.grade = grade;
		this.name = name;
		this.email = email;
		this.reply = reply;
		this.commentCreDate = commentCreDate;
	}



	public int getIdx() {
		return idx;
	}


	public void setIdx(int idx) {
		this.idx = idx;
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


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public Date getBoardCreateDate() {
		return boardCreateDate;
	}


	public void setBoardCreateDate(Date boardCreateDate) {
		this.boardCreateDate = boardCreateDate;
	}


	public Date getBoardModDate() {
		return boardModDate;
	}


	public void setBoardModDate(Date boardModDate) {
		this.boardModDate = boardModDate;
	}


	public String getAnswerStatus() {
		return answerStatus;
	}


	public void setAnswerStatus(String answerStatus) {
		this.answerStatus = answerStatus;
	}


	public String getGrade() {
		return grade;
	}


	public void setGrade(String grade) {
		this.grade = grade;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}
	
	


	public String getEmail() {
		return email;
	}





	public void setEmail(String email) {
		this.email = email;
	}
	


	public String getReply() {
		return reply;
	}



	public void setReply(String reply) {
		this.reply = reply;
	}



	public int getBoardNo() {
		return boardNo;
	}



	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}



	public Date getCommentCreDate() {
		return commentCreDate;
	}



	public void setCommentCreDate(Date commentCreDate) {
		this.commentCreDate = commentCreDate;
	}



	@Override
	public String toString() {
		return "QuestionBoardDto [idx=" + idx + ", no=" + no + ", title=" + title + ", content=" + content
				+ ", boardCreateDate=" + boardCreateDate + ", boardModDate=" + boardModDate + ", answerStatus="
				+ answerStatus + ", grade=" + grade + ", name=" + name + "]";
	}


	
}
