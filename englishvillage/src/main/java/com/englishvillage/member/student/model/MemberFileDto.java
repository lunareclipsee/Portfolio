package com.englishvillage.member.student.model;

import java.util.Date;

public class MemberFileDto {

	private int memberNo;
	private String memberName;
	private String memberEmail;
	private String memberPassword;
	private String memberGrade;
	private int memberPoint;
	private String memberCountry;
	private String memberGender;
	private Date memberBirthDate;
	
	private Date memberCreatedDate;
	private Date memberModifiedDate;

	private int idx;
	private int parentSeq;        
	private String originalFileName;
    private String storedFileName;  
	private int fileSize; 
	private Date creDate;
	
	public MemberFileDto() {
		super();
	}	
	
	public MemberFileDto(int memberNo, String memberName, String memberEmail, String memberPassword, String memberGrade,
			int memberPoint, String memberCountry, String memberGender, Date memberBirthDate) {
		super();
		this.memberNo = memberNo;
		this.memberName = memberName;
		this.memberEmail = memberEmail;
		this.memberPassword = memberPassword;
		this.memberGrade = memberGrade;
		this.memberPoint = memberPoint;
		this.memberCountry = memberCountry;
		this.memberGender = memberGender;
		this.memberBirthDate = memberBirthDate;
	}
	public MemberFileDto(int memberNo, String memberName, String memberEmail, String memberPassword, String memberGrade,
			int memberPoint, String memberCountry, String memberGender, Date memberBirthDate, Date memberCreatedDate,
			Date memberModifiedDate, int idx, int parentSeq, String originalFileName, String storedFileName,
			int fileSize, Date creDate) {
		super();
		this.memberNo = memberNo;
		this.memberName = memberName;
		this.memberEmail = memberEmail;
		this.memberPassword = memberPassword;
		this.memberGrade = memberGrade;
		this.memberPoint = memberPoint;
		this.memberCountry = memberCountry;
		this.memberGender = memberGender;
		this.memberBirthDate = memberBirthDate;
		this.memberCreatedDate = memberCreatedDate;
		this.memberModifiedDate = memberModifiedDate;
		this.idx = idx;
		this.parentSeq = parentSeq;
		this.originalFileName = originalFileName;
		this.storedFileName = storedFileName;
		this.fileSize = fileSize;
		this.creDate = creDate;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberPassword() {
		return memberPassword;
	}

	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}

	public String getMemberGrade() {
		return memberGrade;
	}

	public void setMemberGrade(String memberGrade) {
		this.memberGrade = memberGrade;
	}

	public int getMemberPoint() {
		return memberPoint;
	}

	public void setMemberPoint(int memberPoint) {
		this.memberPoint = memberPoint;
	}

	public String getMemberCountry() {
		return memberCountry;
	}

	public void setMemberCountry(String memberCountry) {
		this.memberCountry = memberCountry;
	}

	public String getMemberGender() {
		return memberGender;
	}

	public void setMemberGender(String memberGender) {
		this.memberGender = memberGender;
	}

	public Date getMemberBirthDate() {
		return memberBirthDate;
	}

	public void setMemberBirthDate(Date memberBirthDate) {
		this.memberBirthDate = memberBirthDate;
	}

	public Date getMemberCreatedDate() {
		return memberCreatedDate;
	}

	public void setMemberCreatedDate(Date memberCreatedDate) {
		this.memberCreatedDate = memberCreatedDate;
	}

	public Date getMemberModifiedDate() {
		return memberModifiedDate;
	}

	public void setMemberModifiedDate(Date memberModifiedDate) {
		this.memberModifiedDate = memberModifiedDate;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getParentSeq() {
		return parentSeq;
	}

	public void setParentSeq(int parentSeq) {
		this.parentSeq = parentSeq;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getStoredFileName() {
		return storedFileName;
	}

	public void setStoredFileName(String storedFileName) {
		this.storedFileName = storedFileName;
	}

	public int getFileSize() {
		return fileSize;
	}

	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}

	public Date getCreDate() {
		return creDate;
	}

	public void setCreDate(Date creDate) {
		this.creDate = creDate;
	}

	@Override
	public String toString() {
		return "MemberFileDto [memberNo=" + memberNo + ", memberName=" + memberName + ", memberEmail=" + memberEmail
				+ ", memberPassword=" + memberPassword + ", memberGrade=" + memberGrade + ", memberPoint=" + memberPoint
				+ ", memberCountry=" + memberCountry + ", memberGender=" + memberGender + ", memberBirthDate="
				+ memberBirthDate + ", memberCreatedDate=" + memberCreatedDate + ", memberModifiedDate="
				+ memberModifiedDate + ", idx=" + idx + ", parentSeq=" + parentSeq + ", originalFileName="
				+ originalFileName + ", storedFileName=" + storedFileName + ", fileSize=" + fileSize + ", creDate="
				+ creDate + "]";
	}
	
}
