package com.englishvillage.member.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;


import com.englishvillage.member.admin.model.MemberListDto;
import com.englishvillage.member.admin.model.QuestionBoardDto;

public interface AdminService {

	//학생 목록
	public List<MemberListDto> studentSelectList(String searchOption, 
			String keyword, int start, int end);
	public int studentSelectTotalCount(String searchOption
			, String keyword);
	public int studentSelectCurPage(String searchOption, String keyword, int no);
	public Map<String, Object> memberStudentSelectOne(int no);
	public int memberStudentUpdateOne(MemberListDto memberListDto,
			MultipartHttpServletRequest multipartHttpServletRequest, int fileIdx) throws Exception;
	public int studentDeleteOne(int no);
	
	//튜터 목록
	public List<MemberListDto> tutorSelectList(String searchOption, 
				String keyword, int start, int end);
	public int tutorSelectTotalCount(String searchOption
				, String keyword);
	public int tutorSelectCurPage(String searchOption, String keyword, int no);
	public Map<String, Object> memberTutorSelectOne(int no);
	public int memberTutorUpdateOne(MemberListDto memberListDto,
			MultipartHttpServletRequest multipartHttpServletRequest, int fileIdx) throws Exception;
	public int TutorProfileUpdateOne(MemberListDto memberListDto,
			MultipartHttpServletRequest multipartHttpServletRequest, int fileIdx) throws Exception;
	public int tutorMemberDeleteOne(int no);
	public int tutorInfoDeleteOne(int no);
	public int tutorEvaluationDeleteOne(int no);
	public int tutorfileDeleteOne(int no);
	
	//문의 목록
	public List<QuestionBoardDto> questionSelectList(String searchOption, 
				String keyword, int start, int end);
	public int questionSelectTotalCount(String searchOption
				, String keyword);
	public int questionSelectCurPage(String searchOption, String keyword, int no);
	public Map<String, Object> questionSelectOne(int no);
	public void replyInsertOne(QuestionBoardDto questionBoardDto, MultipartHttpServletRequest mulRequest);
	public int replyCheck(QuestionBoardDto questionBoardDto, MultipartHttpServletRequest mulRequest) throws Exception;
	
	
	
	
	
}
