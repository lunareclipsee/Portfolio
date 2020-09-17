
package com.englishvillage.member.tutor.model;
import java.util.Date;



public class TutorCommentDto {
	
	private int idx;
	private int tutorNo;
	private int studentNo;
	private String memberGrade;

	private int score;
	private String evaluateContent;
	private String evaluateCheck;
	private String studentName;
	private Date evaluateCreateDate;
	
	private Date evaluateModifyDate;
	private Date studyDate;

	
	public TutorCommentDto() {
		super();
	}


	public int getIdx() {
		return idx;
	}


	public void setIdx(int idx) {
		this.idx = idx;
	}


	public int getTutorNo() {
		return tutorNo;
	}


	public void setTutorNo(int tutorNo) {
		this.tutorNo = tutorNo;
	}


	public int getStudentNo() {
		return studentNo;
	}


	public void setStudentNo(int studentNo) {
		this.studentNo = studentNo;
	}


	public String getMemberGrade() {
		return memberGrade;
	}


	public void setMemberGrade(String memberGrade) {
		this.memberGrade = memberGrade;
	}


	public int getScore() {
		return score;
	}


	public void setScore(int score) {
		this.score = score;
	}


	public String getEvaluateContent() {
		return evaluateContent;
	}


	public void setEvaluateContent(String evaluateContent) {
		this.evaluateContent = evaluateContent;
	}


	public String getEvaluateCheck() {
		return evaluateCheck;
	}


	public void setEvaluateCheck(String evaluateCheck) {
		this.evaluateCheck = evaluateCheck;
	}


	public String getStudentName() {
		return studentName;
	}


	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}


	public Date getEvaluateCreateDate() {
		return evaluateCreateDate;
	}


	public void setEvaluateCreateDate(Date evaluateCreateDate) {
		this.evaluateCreateDate = evaluateCreateDate;
	}


	public Date getEvaluateModifyDate() {
		return evaluateModifyDate;
	}


	public void setEvaluateModifyDate(Date evaluateModifyDate) {
		this.evaluateModifyDate = evaluateModifyDate;
	}


	public Date getStudyDate() {
		return studyDate;
	}


	public void setStudyDate(Date studyDate) {
		this.studyDate = studyDate;
	}


	@Override
	public String toString() {
		return "TutorCommentDto [idx=" + idx + ", tutorNo=" + tutorNo + ", studentNo=" + studentNo + ", memberGrade="
				+ memberGrade + ", score=" + score + ", evaluateContent=" + evaluateContent + ", evaluateCheck="
				+ evaluateCheck + ", studentName=" + studentName + ", evaluateCreateDate=" + evaluateCreateDate
				+ ", evaluateModifyDate=" + evaluateModifyDate + ", studyDate=" + studyDate + "]";
	}
	
}
