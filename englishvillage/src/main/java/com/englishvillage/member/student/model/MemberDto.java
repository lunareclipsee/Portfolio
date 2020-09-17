package com.englishvillage.member.student.model;

import java.util.Date;

public class MemberDto {
	
	private int memberNo;
	private String memberName;
	private String memberEmail;
	private String memberPassword;
	private String memberGrade;
	private int memberPoint;
	private String memberCountry;
	private String memberGender;
	private Date memberBirthDate;
	
	
	public MemberDto() {
		super();
	}
	public MemberDto(int memberNo, String memberName, String memberEmail, String memberPassword, String memberGrade) {
		super();
		this.memberNo = memberNo;
		this.memberName = memberName;
		this.memberEmail = memberEmail;
		this.memberPassword = memberPassword;
		this.memberGrade = memberGrade;
	}

	
	
	
	public String getMemberGrade() {
		return memberGrade;
	}

	public void setMemberGrade(String memberGrade) {
		this.memberGrade = memberGrade;
	}

	public MemberDto(int memberNo, String memberName, String memberEmail, String memberPassword) {
		super();
		this.memberNo = memberNo;
		this.memberName = memberName;
		this.memberEmail = memberEmail;
		this.memberPassword = memberPassword;
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
	@Override
	public String toString() {
		return "MemberDto [memberNo=" + memberNo + ", memberName=" + memberName + ", memberEmail=" + memberEmail
				+ ", memberPassword=" + memberPassword + ", memberGrade=" + memberGrade + ", memberPoint=" + memberPoint
				+ ", memberCountry=" + memberCountry + ", memberGender=" + memberGender + ", memberBirthDate="
				+ memberBirthDate + "]";
	}


	
}
