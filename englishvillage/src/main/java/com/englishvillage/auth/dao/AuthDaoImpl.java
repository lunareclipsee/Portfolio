package com.englishvillage.auth.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.englishvillage.auth.model.MemberDto;


@Repository
public class AuthDaoImpl implements AuthDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "com.englishvillage.auth.";
	
	@Override
	public MemberDto memberExist(String memberEmail, String memberPassword) {
		// TODO Auto-generated method stub
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("memberEmail", memberEmail);
		map.put("memberPassword", memberPassword);
		
		MemberDto memberDto = sqlSession.selectOne(namespace + "memberExist", map);
		
		return memberDto;
	}

	@Override
	public int memberInsertOne(MemberDto memberDto) {
		// TODO Auto-generated method stub
		
		return sqlSession.insert(namespace + "memberInsertOne", memberDto);
		
	}

	@Override
	public MemberDto memberFindPassword(String memberName, String memberEmail, String memberBirthDate) throws Exception {
		// TODO Auto-generated method stub
		
		MemberDto memberDto = new MemberDto();
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date parseDate = simpleDateFormat.parse(memberBirthDate);
		memberDto.setMemberBirthDate(parseDate);
		memberDto.setMemberEmail(memberEmail);
		memberDto.setMemberName(memberName);
		
		return sqlSession.selectOne(namespace + "memberFindPassword", memberDto);
	}

	@Override
	public int emailCheck(MemberDto memberDto) {
		int result = sqlSession.selectOne(namespace + "emailCheck", memberDto);
		return result;
	}
	
	

}
