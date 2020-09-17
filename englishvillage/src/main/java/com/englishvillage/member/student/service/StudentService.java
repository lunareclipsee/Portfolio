package com.englishvillage.member.student.service;

import java.util.List;
import java.util.Map;

import com.englishvillage.auth.model.MemberDto;
import com.englishvillage.member.student.model.QuestionBoardDto;

public interface StudentService {


	public Map<String, Object> SelectOne(int no);

	int memberUpdateOne(MemberDto sessionMemberDto);

	public int memberDeleteOne(int no);

	public int studentQuestionCount(int no, String searchOption, String keyword);

	public int studentStudyCount(int no);

	public int questionSelectCurPage(int no, int idx, String searchOption, String keyword);

	public List<QuestionBoardDto> questionSelectList(int no, String searchOption, String keyword, int start, int end);

	public int QuestionRevise(QuestionBoardDto questionBoardDto);

	public int QuestionAdd(QuestionBoardDto questionBoardDto);

	public int studentStudyInfo(int no);

	public List<QuestionBoardDto> studySelectList(int no, int start, int end);

	public Map<String, Object> QuestionSelect(int no, int idx);

	public int buyPoint(int price, int no);

	public List<QuestionBoardDto> questionSelectList(int no);

	public List<QuestionBoardDto> studySelectList(int no);

}
