package com.englishvillage.member.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;


import com.englishvillage.member.admin.model.MemberListDto;
import com.englishvillage.member.admin.model.QuestionBoardDto;



public interface AdminDao {
	
	//학생 목록
	public List<MemberListDto> studentSelectList(String searchOption, 
			String keyword, int start, int end);
	public int studentSelectTotalCount(String searchOption
			, String keyword);
	public int studentSelectCurPage(String searchOption, String keyword, int no);
	public MemberListDto memberStudentSelectOne(int no);
	public int memberStudentUpdateOne(MemberListDto memberListDto);
	//회원 탈퇴
	public int studentDeleteOne(int no);
	//튜터 탈퇴
	public int tutorMemberDeleteOne(int no);
	public int tutorInfoDeleteOne(int no);
	public int tutorEvaluationDeleteOne(int no);
	public int tutorfileDeleteOne(int no);
	
	//튜터 목록
	public List<MemberListDto> tutorSelectList(String searchOption, 
			String keyword, int start, int end);
	public int tutorSelectTotalCount(String searchOption
			, String keyword);
	public int tutorSelectCurPage(String searchOption, String keyword, int no);
	public MemberListDto memberTutorSelectOne(int no);
	public int memberTutorUpdateOne(MemberListDto memberListDto);
	public int TutorProfileUpdateOne(MemberListDto memberListDto);
	
	//문의 목록
	public List<QuestionBoardDto> questionSelectList(String searchOption, 
			String keyword, int start, int end);
	public int questionSelectTotalCount(String searchOption
			, String keyword);
	public int questionSelectCurPage(String searchOption, String keyword, int no);
	public QuestionBoardDto questionSelectOne(int no);
	public void replyInsertOne(QuestionBoardDto questionBoardDto);
	public int replyCheck(QuestionBoardDto questionBoardDto);
	
	//파일관리
	public void insertFile(Map<String, Object> map);
	public List<Map<String, Object>> fileSelectList(int no);
	public MemberListDto fileSelectStoreFileName(int no);
	public int fileDelete(int idx);
}

