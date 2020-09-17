package com.englishvillage.member.tutor.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.englishvillage.member.admin.model.MemberListDto;
import com.englishvillage.member.admin.model.QuestionBoardDto;
import com.englishvillage.member.tutor.model.TutorCommentDto;
import com.englishvillage.member.tutor.model.TutorDto;

@Repository
public class TutorDaoImpl implements TutorDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	String namespace = "com.englishvillage.member.tutor.";

	@Override
	public List<TutorDto> getTutorList() {
		// TODO Auto-generated method stub

		List<TutorDto> tutorDtoList = sqlSession.selectList(namespace + "getTutorRankList");

		return tutorDtoList;
	}

	@Override
	public int tutorSelectTotalCount(String countrySearch, int ageSearch, String genderSearch, String keyword) {
		// TODO Auto-generated method stub

		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("countrySearch", countrySearch);
		map.put("ageSearch", ageSearch);
		map.put("genderSearch", genderSearch);
		map.put("keyword", keyword);

		int result = sqlSession.selectOne(namespace + "tutorSelectTotalCount", map);

		return result;
	}

	@Override
	public List<TutorDto> getTutorList(String countrySearch, int ageSearch, String genderSearch, String keyword,
			int start, int end) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("countrySearch", countrySearch);
		map.put("ageSearch", ageSearch);
		map.put("genderSearch", genderSearch);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);

		List<TutorDto> tutorDtoList = sqlSession.selectList(namespace + "getTutorList", map);

		return tutorDtoList;

	}

	@Override
	public int tutorSelectCurPage(String countrySearch, int ageSearch, String genderSearch, String keyword, int no) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("countrySearch", countrySearch);
		map.put("ageSearch", ageSearch);
		map.put("genderSearch", genderSearch);
		map.put("keyword", keyword);
		map.put("no", no);

		return sqlSession.selectOne(namespace + "tutorSelectCurPage", map);
	}

	@Override
	public int tutorRegister(TutorDto tutorDto) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace + "tutorRegister", tutorDto);
	}

	@Override
	public int tutorUpdateGrade(int memberNo) {
		// TODO Auto-generated method stub

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);

		return sqlSession.update(namespace + "tutorUpdateGrade", map);

	}

	@Override
	public TutorDto getTutorInfo(int no) {
		// TODO Auto-generated method stub

		TutorDto tutorDto = sqlSession.selectOne(namespace + "getTutorInfo", no);

		return tutorDto;
	}

	@Override
	public TutorDto getTutorGrade(int no) {
		// TODO Auto-generated method stub

		TutorDto tutorDto = sqlSession.selectOne(namespace + "getTutorGrade", no);

		return tutorDto;
	}

	@Override
	public TutorDto getTutorPwd(String pwd) {
		// TODO Auto-generated method stub

		TutorDto tutorDto = sqlSession.selectOne(namespace + "getTutorPwd", pwd);

		return tutorDto;
	}

	@Override
	public TutorDto getTutorIntroduce(int tutorNo) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("tutorNo", tutorNo);

		return sqlSession.selectOne(namespace + "getTutorIntroduce", map);
	}

	@Override
	public List<TutorCommentDto> getTutorComments(int tutorNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + "getTutorComments", tutorNo);
	}

	@Override
	public int writeComment(TutorCommentDto tutorCommentDto) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "writeComment", tutorCommentDto);
	}

	@Override
	public int modifyComment(TutorCommentDto tutorCommentDto) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "modifyComment", tutorCommentDto);
	}

	@Override
	public int removeComment(TutorCommentDto tutorCommentDto) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "removeComment", tutorCommentDto);
	}

	@Override
	public int updateTutor(TutorDto tutorDto) {
		// TODO Auto-generated method stub


		return sqlSession.update(namespace + "updateTutor", tutorDto);
	}

	@Override
	public int updatePwd(TutorDto tutorDto) {
		// TODO Auto-generated method stub

		return sqlSession.update(namespace + "updatePwd", tutorDto);
	}

	@Override
	public int deleteMember(int no) {
		// TODO Auto-generated method stub

		return sqlSession.delete(namespace + "deleteMember", no);
	}

	@Override
	public TutorDto boardSelect(int no) {
		// TODO Auto-generated method stub

		TutorDto tutorDto = sqlSession.selectOne(namespace + "boardSelect", no);

		return tutorDto;

	}

	@Override
	public int addStudyHistory(TutorCommentDto tutorCommentDto) {
		// TODO Auto-generated method stub

		return sqlSession.insert(namespace + "addStudyHistory", tutorCommentDto);
	}

	@Override
	public List<QuestionBoardDto> tutorBoardList(int start, int end, int no) {
		// TODO Auto-generated method stub
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("no", no);

		return sqlSession.selectList(namespace + "tutorBoardList", map);
	}

	
	@Override
	public void insertFile(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
		int result = sqlSession.insert(namespace + "insertFile", map);
		
		return;
	}

	@Override
	public TutorCommentDto getStudentTutorComment(int studentNo, int tutorNo) {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("studentNo", studentNo);
		map.put("tutorNo", tutorNo);
		
		return sqlSession.selectOne(namespace + "getStudentTutorComment", map);
	}

	@Override
	public int changeTutorStatus(TutorDto tutorDto) {
		// TODO Auto-generated method stub
		
		return sqlSession.update(namespace + "changeTutorStatus", tutorDto);
	}

	@Override
	public int addPoint(int memberNo, int price) {
		// TODO Auto-generated method stub
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberNo", memberNo);
		map.put("price", price);
		
		return sqlSession.update(namespace + "addPount", map);
	}

	@Override
	public int boardWrite(QuestionBoardDto questionBoardDto) {
		// TODO Auto-generated method stub
		
		return sqlSession.insert(namespace + "boardWrite", questionBoardDto);
	}

	@Override
	public QuestionBoardDto boardSelectOne(int idx) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "boardSelectOne", idx);
	}

	@Override
	public int questionRevise(QuestionBoardDto questionBoardDto) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "questionRevise", questionBoardDto);
	}

	@Override
	public MemberListDto fileSelectStoreFileName(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "fileSelectStoreFileName", no);
	}

	@Override
	public void fileDelete(int idx) {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace + "fileDelete",idx);
	}

	@Override
	public int TutorProfileUpdateOne(TutorDto tutorDto) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "TutorProfileUpdateOne", tutorDto);
	}

	@Override
	public int tutorBoardCurPage(int no, int idx) {
		// TODO Auto-generated method stub
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("no", no);
		paramMap.put("idx", idx);
		
		return sqlSession.selectOne(namespace + "tutorBoardCurPage", paramMap);
	}

	@Override
	public int boardSelectTotalCount(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "boardSelectTotalCount", no);
	}
}
