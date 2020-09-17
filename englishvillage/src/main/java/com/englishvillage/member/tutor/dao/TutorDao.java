package com.englishvillage.member.tutor.dao;

import java.util.List;
import java.util.Map;

import com.englishvillage.member.admin.model.MemberListDto;
import com.englishvillage.member.admin.model.QuestionBoardDto;
import com.englishvillage.member.tutor.model.TutorCommentDto;
import com.englishvillage.member.tutor.model.TutorDto;

public interface TutorDao {

	public List<TutorDto> getTutorList();

	public int tutorSelectTotalCount(String countrySearch, int ageSearch, String genderSearch, String keyword);

	public List<TutorDto> getTutorList(String countrySearch, int ageSearch, String genderSearch, String keyword,
			int start, int end);

	public int tutorSelectCurPage(String countrySearch, int ageSearch, String genderSearch, String keyword, int no);

	public int tutorRegister(TutorDto tutorDto);

	public int tutorUpdateGrade(int memberNo);

	public TutorDto getTutorInfo(int no);

	public TutorDto getTutorGrade(int no);

	public TutorDto getTutorIntroduce(int tutorNo);

	public List<TutorCommentDto> getTutorComments(int tutorNo);

	public int writeComment(TutorCommentDto tutorCommentDto);

	public int modifyComment(TutorCommentDto tutorCommentDto);

	public int removeComment(TutorCommentDto tutorCommentDto);
	public TutorDto getTutorPwd(String pwd);

	public int updateTutor(TutorDto tutorDto);

	public int updatePwd(TutorDto tutorDto);

	public int deleteMember(int no);

	public TutorDto boardSelect(int no);

	public int addStudyHistory(TutorCommentDto tutorCommentDto);

	public List<QuestionBoardDto> tutorBoardList(int start, int end, int no);
	public void insertFile(Map<String, Object> map);

	public TutorCommentDto getStudentTutorComment(int studentNo, int tutorNo);

	public int changeTutorStatus(TutorDto tutorDto);

	public int addPoint(int memberNo, int price);

	public int boardWrite(QuestionBoardDto questionBoardDto);

	public QuestionBoardDto boardSelectOne(int idx);

	public int questionRevise(QuestionBoardDto questionBoardDto);

	public MemberListDto fileSelectStoreFileName(int no);

	public void fileDelete(int idx);

	public int TutorProfileUpdateOne(TutorDto tutorDto);

	public int tutorBoardCurPage(int no, int idx);

	public int boardSelectTotalCount(int no);


}

