package com.englishvillage.member.admin.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class MemberListDto {
	private int no;
	private String member_name;
	private String member_email;
	private String password;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createdDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date modifiedDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birthDate;
	private String country;
	private String gender;
	private String grade;
	private int point;
	private int score;
	private int tutorNo;
	private String url;
	private int price;
	private String tutorTitle;
	private String tutorText;

	

	private int idx;
	private String original_File_Name;
    private String store_File_Name;  
	private int file_size; 
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date creDate;
	
	

	

	public MemberListDto(int no, String member_name, String member_email, String password, Date modifiedDate, Date birthDate,
			String country, String gender) {
		super();
		this.no = no;
		this.member_name = member_name;
		this.member_email = member_email;
		this.password = password;
		this.modifiedDate = modifiedDate;
		this.birthDate = birthDate;
		this.country = country;
		this.gender = gender;
	}

	

	public MemberListDto(int no, String url, int price, String tutorTitle, String tutorText) {
		super();
		this.no = no;
		this.url = url;
		this.price = price;
		this.tutorTitle = tutorTitle;
		this.tutorText = tutorText;
	}



	public MemberListDto() {
		super();
	}



	public MemberListDto(int no, String member_name, String member_email, String password, Date createdDate,
			Date modifiedDate, Date birthDate, String country, String gender, String grade, int point, int score,
			int tutorNo, String url, int price, String tutorTitle, String tutorText, int idx, String original_File_Name,
			String store_File_Name, int file_size, Date creDate) {
		super();
		this.no = no;
		this.member_name = member_name;
		this.member_email = member_email;
		this.password = password;
		this.createdDate = createdDate;
		this.modifiedDate = modifiedDate;
		this.birthDate = birthDate;
		this.country = country;
		this.gender = gender;
		this.grade = grade;
		this.point = point;
		this.score = score;
		this.tutorNo = tutorNo;
		this.url = url;
		this.price = price;
		this.tutorTitle = tutorTitle;
		this.tutorText = tutorText;
		this.idx = idx;
		this.original_File_Name = original_File_Name;
		this.store_File_Name = store_File_Name;
		this.file_size = file_size;
		this.creDate = creDate;
	}



	public int getNo() {
		return no;
	}



	public void setNo(int no) {
		this.no = no;
	}



	public String getMember_name() {
		return member_name;
	}



	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}



	public String getMember_email() {
		return member_email;
	}



	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}



	public Date getCreatedDate() {
		return createdDate;
	}



	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}



	public Date getModifiedDate() {
		return modifiedDate;
	}



	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}



	public Date getBirthDate() {
		return birthDate;
	}



	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}



	public String getCountry() {
		return country;
	}



	public void setCountry(String country) {
		this.country = country;
	}



	public String getGender() {
		return gender;
	}



	public void setGender(String gender) {
		this.gender = gender;
	}



	public String getGrade() {
		return grade;
	}



	public void setGrade(String grade) {
		this.grade = grade;
	}



	public int getPoint() {
		return point;
	}



	public void setPoint(int point) {
		this.point = point;
	}



	public int getScore() {
		return score;
	}



	public void setScore(int score) {
		this.score = score;
	}



	public int getTutorNo() {
		return tutorNo;
	}



	public void setTutorNo(int tutorNo) {
		this.tutorNo = tutorNo;
	}



	public String getUrl() {
		return url;
	}



	public void setUrl(String url) {
		this.url = url;
	}



	public int getPrice() {
		return price;
	}



	public void setPrice(int price) {
		this.price = price;
	}



	public String getTutorTitle() {
		return tutorTitle;
	}



	public void setTutorTitle(String tutorTitle) {
		this.tutorTitle = tutorTitle;
	}



	public String getTutorText() {
		return tutorText;
	}



	public void setTutorText(String tutorText) {
		this.tutorText = tutorText;
	}



	public int getIdx() {
		return idx;
	}



	public void setIdx(int idx) {
		this.idx = idx;
	}



	public String getOriginal_File_Name() {
		return original_File_Name;
	}



	public void setOriginal_File_Name(String original_File_Name) {
		this.original_File_Name = original_File_Name;
	}



	public String getStore_File_Name() {
		return store_File_Name;
	}



	public void setStore_File_Name(String store_File_Name) {
		this.store_File_Name = store_File_Name;
	}



	public int getFile_size() {
		return file_size;
	}



	public void setFile_size(int file_size) {
		this.file_size = file_size;
	}



	public Date getCreDate() {
		return creDate;
	}



	public void setCreDate(Date creDate) {
		this.creDate = creDate;
	}



	@Override
	public String toString() {
		return "MemberListDto [no=" + no + ", member_name=" + member_name + ", member_email=" + member_email
				+ ", password=" + password + ", createdDate=" + createdDate + ", modifiedDate=" + modifiedDate
				+ ", birthDate=" + birthDate + ", country=" + country + ", gender=" + gender + ", grade=" + grade
				+ ", point=" + point + ", score=" + score + ", tutorNo=" + tutorNo + ", url=" + url + ", price=" + price
				+ ", tutorTitle=" + tutorTitle + ", tutorText=" + tutorText + ", idx=" + idx + ", original_File_Name="
				+ original_File_Name + ", store_File_Name=" + store_File_Name + ", file_size=" + file_size
				+ ", creDate=" + creDate + "]";
	}

	
	
	





	

}
