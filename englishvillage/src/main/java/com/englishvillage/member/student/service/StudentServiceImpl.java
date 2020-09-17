package com.englishvillage.member.student.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.englishvillage.auth.model.MemberDto;
import com.englishvillage.member.student.model.QuestionBoardDto;
import com.englishvillage.member.student.dao.StudentDao;
import com.englishvillage.member.student.model.MemberFileDto;
import com.englishvillage.util.FileUtils;

@Service
public class StudentServiceImpl implements StudentService {

	private static final Logger log = LoggerFactory.getLogger(StudentServiceImpl.class);

	@Autowired
	public StudentDao studentDao;

	@Resource(name = "fileUtils")
	private FileUtils fileUtils;

	@Override
	public Map<String, Object> SelectOne(int no) {
		// TODO Auto-generated method stub
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		MemberFileDto memberFileDto = studentDao.SelectOne(no);
		
		resultMap.put("MemberFileDto", memberFileDto);
		return resultMap;
	}


	@Override
	public int memberUpdateOne(MemberDto sessionMemberDto) {
		// TODO Auto-generated method stub
		int resultNum = 0;
		resultNum= studentDao.memberUpdateOne(sessionMemberDto);
		System.out.println("데이터베이스 빠져나옴"+resultNum);
		return resultNum;
	}

	@Override
	public int memberDeleteOne(int no) {
		return studentDao.memberDeleteOne(no);
	}

	@Override
	public int studentStudyCount(int no) {
		// TODO Auto-generated method stub
		log.info("Welcome studentStudyCount! {}", no);
		return studentDao.studentStudyCount(no);
	}
	
	@Override
	public List<QuestionBoardDto> studySelectList(int no) {
		// TODO Auto-generated method stub
		List<QuestionBoardDto> studyList = 
				studentDao.studySelectList(no);
		
		return studyList;

	}

	@Override
	public List<QuestionBoardDto> studySelectList(int no, int start, int end) {
		// TODO Auto-generated method stub
		List<QuestionBoardDto> studyList = 
				studentDao.studySelectList(no, start, end);
		
		return studyList;
	}

	@Override
	public int studentStudyInfo(int no) {
		// TODO Auto-generated method stub
		log.info("Welcome studentStudyInfo! {}", no);
		return studentDao.studentStudyInfo(no);
	}


	@Override
	public int studentQuestionCount(int no, String searchOption, String keyword) {
		// TODO Auto-generated method stub
		log.info("Welcome studentQuestionCount! {}", no);
		System.out.println("dddddddddddddddddddddddddddddddddddd");
		return studentDao.studentQuestionCount(no, searchOption, keyword);
	}

	@Override
	public int questionSelectCurPage(int no, int idx, String searchOption, String keyword) {
		// TODO Auto-generated method stub
		return studentDao.questionSelectCurPage(no, idx, searchOption, keyword);
	}

	@Override
	public List<QuestionBoardDto> questionSelectList(int no) {
		// TODO Auto-generated method stub
		List<QuestionBoardDto> qusetionList = 
				studentDao.questionSelectList(no);
		
		return qusetionList;
	}
	
	@Override
	public List<QuestionBoardDto> questionSelectList(int no, String searchOption, String keyword, int start, int end) {
		// TODO Auto-generated method stub
		
		List<QuestionBoardDto> qusetionList = 
				studentDao.questionSelectList(no, searchOption, keyword, start, end);
		
		return qusetionList;
	}


	@Override
	public Map<String, Object> QuestionSelect(int no, int idx) {
		// TODO Auto-generated method stub
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		QuestionBoardDto questionBoardDto = studentDao.QuestionSelect(no, idx);
		resultMap.put("QuestionBoardDto", questionBoardDto);
		
		return resultMap;
	}


	@Override
	public int QuestionRevise(QuestionBoardDto questionBoardDto) {
		// TODO Auto-generated method stub
		
		int resultNum = 0;
		resultNum= studentDao.QuestionRevise(questionBoardDto);
		System.out.println("데이터베이스 빠져나옴"+resultNum);
		return resultNum;
	}


	@Override
	public int QuestionAdd(QuestionBoardDto questionBoardDto) {
		// TODO Auto-generated method stub
		int resultNum = 0;
		resultNum= studentDao.QuestionAdd(questionBoardDto);
		return resultNum;
	}


	@Override
	public int buyPoint(int price, int no) {
		// TODO Auto-generated method stub
		return studentDao.buyPoint(price, no);
	}

}
