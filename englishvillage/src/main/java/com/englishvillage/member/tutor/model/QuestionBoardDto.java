package com.englishvillage.member.tutor.model;

import java.util.Date;

public class QuestionBoardDto {
	
	private int idx;
	private int no;
	private String title;
	private String content;
	private Date boardCreateDate;
	private Date boardModDate;
	private String answerStatus;
	private String grade;
	private String name;
	private Date commentCreateDate;
	private String reply;
	
	
	private String studyName;
	private String tutorName;
	private int price;
	private Date studyDate;
	
	
	public QuestionBoardDto() {
		super();
	}


	public QuestionBoardDto(int idx, int no, String title, String content, Date boardCreateDate, Date boardModDate,
			String answerStatus, String grade, String name, Date commentCreateDate, String reply, String studyName,
			String tutorName, int price, Date studyDate) {
		super();
		this.idx = idx;
		this.no = no;
		this.title = title;
		this.content = content;
		this.boardCreateDate = boardCreateDate;
		this.boardModDate = boardModDate;
		this.answerStatus = answerStatus;
		this.grade = grade;
		this.name = name;
		this.commentCreateDate = commentCreateDate;
		this.reply = reply;
		this.studyName = studyName;
		this.tutorName = tutorName;
		this.price = price;
		this.studyDate = studyDate;
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


	public Date getCommentCreateDate() {
		return commentCreateDate;
	}


	public void setCommentCreateDate(Date commentCreateDate) {
		this.commentCreateDate = commentCreateDate;
	}


	public String getReply() {
		return reply;
	}


	public void setReply(String reply) {
		this.reply = reply;
	}


	public String getstudyName() {
		return studyName;
	}


	public void setstudyName(String studyName) {
		this.studyName = studyName;
	}


	public String gettutorName() {
		return tutorName;
	}


	public void settutorName(String tutorName) {
		this.tutorName = tutorName;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public Date getStudyDate() {
		return studyDate;
	}


	public void setStudyDate(Date studyDate) {
		this.studyDate = studyDate;
	}


	@Override
	public String toString() {
		return "QuestionBoardDto [idx=" + idx + ", no=" + no + ", title=" + title + ", content=" + content
				+ ", boardCreateDate=" + boardCreateDate + ", boardModDate=" + boardModDate + ", answerStatus="
				+ answerStatus + ", grade=" + grade + ", name=" + name + ", commentCreateDate=" + commentCreateDate
				+ ", reply=" + reply + ", studyName=" + studyName + ", tutorName=" + tutorName + ", price=" + price
				+ ", studyDate=" + studyDate + "]";
	}


}
