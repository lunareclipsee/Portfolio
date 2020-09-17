package com.englishvillage.member.student.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.englishvillage.auth.model.MemberDto;
import com.englishvillage.member.student.model.MemberFileDto;
import com.englishvillage.member.student.model.QuestionBoardDto;


@Repository
public class StudentDaoImpl implements StudentDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "com.englishvillage.";

	@Override
	public MemberFileDto SelectOne(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "SelectOne", no);
	}

	@Override
	public int memberUpdateOne(MemberDto memberDto) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "memberUpdateOne", memberDto);
	}

	@Override
	public int memberDeleteOne(int no) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace + "memberDeleteOne", no);
	}
	
	@Override
	public int studentStudyCount(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "studentStudyCount", no);
	}
	
	@Override
	public List<QuestionBoardDto> studySelectList(int no) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("no", no);
		
		List<QuestionBoardDto> studyList = 
				sqlSession.selectList(namespace + "studyHistory", map);
		
		return studyList;
	}
	
	@Override
	public List<QuestionBoardDto> studySelectList(int no, int start, int end) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("no", no);
		map.put("start", start);
		map.put("end", end);

		List<QuestionBoardDto> studyList = 
				sqlSession.selectList(namespace + "studySelectList", map);
		
		return studyList;
	}
	
	@Override
	public int studentStudyInfo(int no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int studentQuestionCount(int no, String searchOption, String keyword) {
		// TODO Auto-generated method stub
		System.out.println("다오의 넘버"+no);
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("searchOption", searchOption);
		paramMap.put("keyword", keyword);
		paramMap.put("no", no);
		
		return sqlSession.selectOne(namespace + "studentQuestionCount", paramMap);
		
	}

	@Override
	public int questionSelectCurPage(int no, int idx, String searchOption, String keyword) {
		// TODO Auto-generated method stub
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("no", no);
		paramMap.put("idx", idx);
		paramMap.put("searchOption", searchOption);
		paramMap.put("keyword", keyword);
			
		return sqlSession.selectOne(namespace + "memberSelectCurPage", paramMap);
	}

	@Override
	public List<QuestionBoardDto> questionSelectList(int no) {
		// TODO Auto-generated method stub

		Map<String, Object> map = new HashMap<>();
		map.put("no", no);
		
		List<QuestionBoardDto> qusetionList = 
				sqlSession.selectList(namespace + "questionHistory", map);
		
		return qusetionList;
	}
	
	@Override
	public List<QuestionBoardDto> questionSelectList(int no, String searchOption, String keyword, int start, int end) {
		// TODO Auto-generated method stub

		Map<String, Object> map = new HashMap<>();
		map.put("no", no);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		
		List<QuestionBoardDto> qusetionList = 
				sqlSession.selectList(namespace + "questionSelectList", map);
		
		return qusetionList;
	}

	@Override
	public QuestionBoardDto QuestionSelect(int no, int idx) {
		// TODO Auto-generated method stub
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("no", no);
		paramMap.put("idx", idx);
		
		QuestionBoardDto qusetionSelect = sqlSession.selectOne(namespace + "QuestionSelect", paramMap);
		return qusetionSelect;
		
//		System.out.println("다오로 넘어옴? no는"+no+"idx는"+idx);
//		return sqlSession.selectOne(namespace + "QuestionSelect", idx);
	}

	@Override
	public int QuestionRevise(QuestionBoardDto questionBoardDto) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "QuestionRevise", questionBoardDto);
	}

	@Override
	public int QuestionAdd(QuestionBoardDto questionBoardDto) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace + "QuestionAdd", questionBoardDto);
	}

	@Override
	public int buyPoint(int price, int no) {
		// TODO Auto-generated method stub
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("price", price);
		paramMap.put("no", no);
		
		return sqlSession.update(namespace + "buyPoint", paramMap);
	}

}
