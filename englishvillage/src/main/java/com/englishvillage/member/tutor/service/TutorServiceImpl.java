package com.englishvillage.member.tutor.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.englishvillage.member.admin.model.MemberListDto;
import com.englishvillage.member.admin.model.QuestionBoardDto;
import com.englishvillage.member.student.model.MemberFileDto;
import com.englishvillage.auth.model.MemberDto;
import com.englishvillage.member.tutor.dao.TutorDao;
import com.englishvillage.member.tutor.model.TutorCommentDto;
import com.englishvillage.member.tutor.model.TutorDto;
import com.englishvillage.util.FileUtils;

@Service
public class TutorServiceImpl implements TutorService{

	private static final Logger log = 
			LoggerFactory.getLogger(TutorServiceImpl.class);
	
	@Autowired
	public TutorDao tutorDao;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;

	@Override
	public List<TutorDto> getTutorList() {
		// TODO Auto-generated method stub
		
		
		List<TutorDto> tutorDtoList = tutorDao.getTutorList();
		
		
		return tutorDtoList;
	}

	@Override
	public int tutorSelectTotalCount(String countrySearch, int ageSearch, String genderSearch, String keyword) {
		// TODO Auto-generated method stub
		
		System.out.println("들어온다고 난 믿어");
		int result = tutorDao.tutorSelectTotalCount(countrySearch, ageSearch, genderSearch, keyword);
				
		return result;
	}

	@Override
	public TutorDto getTutorInfo(int no) {
		// TODO Auto-generated method stub
		
		TutorDto tutorDto = tutorDao.getTutorInfo(no);
		
		return tutorDto;
	}
	
	@Override
	public TutorDto getTutorGrade(int no) {
		// TODO Auto-generated method stub
		
		TutorDto tutorDto = tutorDao.getTutorGrade(no);
		
		return tutorDto;
	}

	@Override
	public int updateTutor(TutorDto tutorDto) {
		// TODO Auto-generated method stub
		
		return tutorDao.updateTutor(tutorDto);
	}

	@Override
	public TutorDto getTutorPwd(String pwd) {
		// TODO Auto-generated method stub
		
		TutorDto tutorDto = tutorDao.getTutorPwd(pwd);
		
		return tutorDto;
	}

	@Override
	public int updatePwd(TutorDto tutorDto) {
		// TODO Auto-generated method stub
		
		return tutorDao.updatePwd(tutorDto);
	}
	
	@Override
	public int deleteMember(int no) {
		// TODO Auto-generated method stub
				
		return tutorDao.deleteMember(no);
	}
	
	
	
	@Override
	public List<TutorDto> getTutorList(String countrySearch, int ageSearch, String genderSearch, String keyword,
			int start, int end) {
		// TODO Auto-generated method stub
		
		List<TutorDto> tutorDtoList = tutorDao.getTutorList( countrySearch,  ageSearch,  genderSearch,  keyword,
				 start,  end);
		
		return tutorDtoList;
	}

	@Override 
	public int tutorSelectCurPage(String countrySearch, int ageSearch, String genderSearch, String keyword,
			int no) {
		// TODO Auto-generated method stub
		return tutorDao.tutorSelectCurPage(countrySearch,  ageSearch,  genderSearch,  keyword, no);
		
	}

	@Override
	public int tutorRegister(TutorDto tutorDto) {
		// TODO Auto-generated method stub
		
		return tutorDao.tutorRegister(tutorDto);
		
	}

	@Override
	public int tutorUpdateGrade(int memberNo) {
		// TODO Auto-generated method stub
		return tutorDao.tutorUpdateGrade(memberNo);
	}

	@Override
	public TutorDto boardSelect(int no) {
		// TODO Auto-generated method stub
		
		TutorDto tutorDto = tutorDao.boardSelect(no);
		
		return tutorDto;
	}

	public TutorDto getTutorIntroduce(int tutorNo) {
		// TODO Auto-generated method stub
		return tutorDao.getTutorIntroduce(tutorNo);
	}

	@Override
	public List<TutorCommentDto> getTutorComments(int tutorNo) {
		// TODO Auto-generated method stub
		return tutorDao.getTutorComments(tutorNo);
	}

	@Override
	public int writeComment(TutorCommentDto tutorCommentDto) {
		// TODO Auto-generated method stub
		return tutorDao.writeComment(tutorCommentDto);
	}

	@Override
	public int modifyComment(TutorCommentDto tutorCommentDto) {
		// TODO Auto-generated method stub
		return tutorDao.modifyComment(tutorCommentDto);
	}

	@Override
	public int removeComment(TutorCommentDto tutorCommentDto) {
		// TODO Auto-generated method stub
		return tutorDao.removeComment(tutorCommentDto);
	}

	@Override
	public int addStudyHistory(TutorCommentDto tutorCommentDto) {
		// TODO Auto-generated method stub
		return tutorDao.addStudyHistory(tutorCommentDto);
	}

	@Override
	public int tutorBoardCurPage(int no, int idx) {
		// TODO Auto-generated method stub
		return tutorDao.tutorBoardCurPage(no, idx);
	}

	@Override
	public List<QuestionBoardDto> tutorBoardList(int start, int end, int no) {
		// TODO Auto-generated method stub
		List<QuestionBoardDto> tutorList = 
				tutorDao.tutorBoardList(start, end, no);
		return tutorList;
	}
	public int tutorAddProfile(TutorDto tutorDto, MultipartHttpServletRequest mulRequest) {
		// TODO Auto-generated method stub
		
		
		int memberNo = tutorDto.getMemberNo();
		
		try {
			List<Map<String, Object>> fileList = 
				fileUtils.parseInsertFileTutorInfo(memberNo
					, mulRequest);
			
			for (int i = 0; i < fileList.size(); i++) {
				tutorDao.insertFile(fileList.get(i));
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("문제 생기면 처리할꺼 정하자");
			System.out.println("일단 여긴 파일 처리 중 문제 발생한 거야");
			e.printStackTrace();
		}
		
		
		return 0;
	}

	@Override
	public TutorCommentDto getStudentTutorComment(int studentNo, int tutorNo) {
		// TODO Auto-generated method stub
		return tutorDao.getStudentTutorComment(studentNo, tutorNo);
	}

	@Override
	public int changeTutorStatus(TutorDto tutorDto) {
		// TODO Auto-generated method stub
		return tutorDao.changeTutorStatus(tutorDto);
	}

	@Override
	public int addPoint(int memberNo, int price) {
		// TODO Auto-generated method stub
		return tutorDao.addPoint(memberNo, price);
	}

	@Override
	public int boardWrite(QuestionBoardDto questionBoardDto) {
		// TODO Auto-generated method stub
		return tutorDao.boardWrite(questionBoardDto);
	}

	@Override
	public QuestionBoardDto boardSelectOne(int idx) {
		// TODO Auto-generated method stub
		return tutorDao.boardSelectOne(idx);
	}

	@Override
	public int questionRevise(QuestionBoardDto questionBoardDto) {
		// TODO Auto-generated method stub
		return tutorDao.questionRevise(questionBoardDto);
	}

	@Override
	public int TutorProfileUpdateOne(TutorDto tutorDto, MultipartHttpServletRequest multipartHttpServletRequest,
			int fileIdx) {
		// TODO Auto-generated method stub
		int resultNum = 0;
		try {

			int no = tutorDto.getMemberNo();
//			if문을 위한것(2번째 if문)

			MemberListDto memberFileSave = tutorDao.fileSelectStoreFileName(no);
			MultipartFile file = multipartHttpServletRequest.getFile("profilePicture");
			int idx = memberFileSave.getIdx();
			System.out.println(file.isEmpty());

			if (file.isEmpty() == false) {
				// for문을 위한것
				List<Map<String, Object>> list = fileUtils.parseInsertFileTutorInfo(no, multipartHttpServletRequest);
				System.out.println(list);

				// 오로지 하나만 관리 수정
				if (list.isEmpty() == false) {
					for (Map<String, Object> map : list) {
						tutorDao.insertFile(map);
					}
					if (memberFileSave != null) {
						tutorDao.fileDelete(idx);
						fileUtils.parseUpdateFileInfo(memberFileSave);
					}
				} else if (fileIdx == -1) {
					if (memberFileSave != null) {
						tutorDao.fileDelete(idx);
						fileUtils.parseUpdateFileInfo(memberFileSave);
					}
				}
			}

			// 부모를 바꾸기 전에 자식을 바꾸는 형태(참조무결성 제약조건을 생각해야 하는 부분이다)

			resultNum = tutorDao.TutorProfileUpdateOne(tutorDto);

		} catch (Exception e) {
			// TODO Auto-generated catch block
//			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			System.out.println("오류");
		}

		return resultNum;

	}

	@Override
	public int boardSelectTotalCount(int no) {
		// TODO Auto-generated method stub
		return tutorDao.boardSelectTotalCount(no);
	}

	
}
