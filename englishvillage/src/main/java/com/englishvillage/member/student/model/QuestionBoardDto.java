package com.englishvillage.member.student.model;

import java.util.Date;

public class QuestionBoardDto {
	
	private int idx;
	private int rnum;
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
	private int tutorNo;
	private int price;
	private String evaluateCheck;
	private Date studyDate;
	
	
	public QuestionBoardDto() {
		super();
	}


	public QuestionBoardDto(int idx, int rnum, int no, String title, String content, Date boardCreateDate,
			Date boardModDate, String answerStatus, String grade, String name, Date commentCreateDate, String reply,
			String studyName, String tutorName, int tutorNo, int price, String evaluateCheck, Date studyDate) {
		super();
		this.idx = idx;
		this.rnum = rnum;
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
		this.tutorNo = tutorNo;
		this.price = price;
		this.evaluateCheck = evaluateCheck;
		this.studyDate = studyDate;
	}


	public int getIdx() {
		return idx;
	}


	public void setIdx(int idx) {
		this.idx = idx;
	}


	public int getRnum() {
		return rnum;
	}


	public void setRnum(int rnum) {
		this.rnum = rnum;
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


	public String getStudyName() {
		return studyName;
	}


	public void setStudyName(String studyName) {
		this.studyName = studyName;
	}


	public String getTutorName() {
		return tutorName;
	}


	public void setTutorName(String tutorName) {
		this.tutorName = tutorName;
	}


	public int getTutorNo() {
		return tutorNo;
	}


	public void setTutorNo(int tutorNo) {
		this.tutorNo = tutorNo;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public String getEvaluateCheck() {
		return evaluateCheck;
	}


	public void setEvaluateCheck(String evaluateCheck) {
		this.evaluateCheck = evaluateCheck;
	}


	public Date getStudyDate() {
		return studyDate;
	}


	public void setStudyDate(Date studyDate) {
		this.studyDate = studyDate;
	}


	@Override
	public String toString() {
		return "QuestionBoardDto [idx=" + idx + ", rnum=" + rnum + ", no=" + no + ", title=" + title + ", content="
				+ content + ", boardCreateDate=" + boardCreateDate + ", boardModDate=" + boardModDate
				+ ", answerStatus=" + answerStatus + ", grade=" + grade + ", name=" + name + ", commentCreateDate="
				+ commentCreateDate + ", reply=" + reply + ", studyName=" + studyName + ", tutorName=" + tutorName
				+ ", tutorNo=" + tutorNo + ", price=" + price + ", evaluateCheck=" + evaluateCheck + ", studyDate="
				+ studyDate + "]";
	}




}
