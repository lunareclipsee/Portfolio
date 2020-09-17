package com.englishvillage.auth.dao;

import com.englishvillage.auth.model.MemberDto;

public interface AuthDao {

	public MemberDto memberExist(String memberEmail, String memberPassword);

	public int memberInsertOne(MemberDto memberDto);

	public MemberDto memberFindPassword(String memberName, String memberEmail, String memberBirthDate) throws Exception;

	public int emailCheck(MemberDto memberDto);
}

