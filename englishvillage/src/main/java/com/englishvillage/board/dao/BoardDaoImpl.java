package com.englishvillage.board.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class BoardDaoImpl implements BoardDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "com.edu.member.";
	

}
