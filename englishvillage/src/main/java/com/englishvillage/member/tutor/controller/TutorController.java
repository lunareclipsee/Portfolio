package com.englishvillage.member.tutor.controller;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.englishvillage.auth.model.MemberDto;
import com.englishvillage.auth.service.AuthService;
import com.englishvillage.member.admin.model.MemberListDto;
import com.englishvillage.member.admin.model.QuestionBoardDto;
import com.englishvillage.member.student.model.MemberFileDto;
import com.englishvillage.member.student.service.StudentService;
import com.englishvillage.member.tutor.model.TutorCommentDto;
import com.englishvillage.member.tutor.model.TutorDto;
import com.englishvillage.member.tutor.service.TutorService;
import com.englishvillage.util.PagingYJ;
import com.englishvillage.util.mainPaging;

@Controller
public class TutorController {

	private static final Logger log = 
		LoggerFactory.getLogger(TutorController.class);
	
	@Autowired
	private TutorService tutorService;
	
	@Autowired
	private AuthService authService;

	@Autowired
	private StudentService studentService;
	
	@RequestMapping(value = "/tutor/home.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String main(@RequestParam(defaultValue = "1") 
						int curPage
						, @RequestParam(defaultValue = "0") int no
						, @RequestParam(defaultValue = "all") String countrySearch
						, @RequestParam(defaultValue = "0") int ageSearch
						, @RequestParam(defaultValue = "all") String genderSearch
						, @RequestParam(defaultValue = "") String keyword
						, Model model) {
		
		log.info("home 입니다. GET");
		
		
		int totalCount = tutorService.tutorSelectTotalCount(countrySearch, ageSearch, genderSearch, keyword);
		
		
		if(no != 0) {
			curPage
				= tutorService.tutorSelectCurPage(countrySearch, ageSearch, genderSearch, keyword, no);
		}
		
		mainPaging memberPaging = new mainPaging(totalCount, curPage);
		int start = memberPaging.getPageBegin();
		int end = memberPaging.getPageEnd();
		
		List<TutorDto> tutorDtoList = tutorService.getTutorList(countrySearch, ageSearch, genderSearch, keyword, start, end);
		
		HashMap<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("countrySearch", countrySearch);
		searchMap.put("ageSearch", ageSearch);
		searchMap.put("genderSearch", genderSearch);
		searchMap.put("keyword", keyword);
		
		// 페이징
		Map<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("totalCount", totalCount);
		pagingMap.put("memberPaging", memberPaging);
	
		model.addAttribute("tutorDtoList", tutorDtoList);
		model.addAttribute("pagingMap", pagingMap);
		model.addAttribute("searchMap", searchMap);
		
		return "home/tutorList";
	}
	
	@RequestMapping(value = "/tutor/tutorRegister.do", method = RequestMethod.GET)
	public String tutorRegister(Model model) {
		
		log.info("튜터등록 입니다. GET");
		return "member/tutor/info/tutorRegister";
	}

	@RequestMapping(value = "/tutor/tutorRegisterCtr.do", method = RequestMethod.POST)
	public String tutorRegisterCtr(HttpSession session, TutorDto tutorDto, Model model, MultipartHttpServletRequest mulRequest) {
		log.info("튜터등록 입니다. POST");

		
		MemberDto sessionMemberDto = (MemberDto)session.getAttribute("member");
		int memberNo = sessionMemberDto.getMemberNo();
		
		tutorDto.setMemberNo(memberNo);
		
		int insertResult = tutorService.tutorRegister(tutorDto);

		tutorService.tutorAddProfile(tutorDto, mulRequest);
		
		int updateResult = tutorService.tutorUpdateGrade(memberNo);
		
		TutorDto newTutorDto = tutorService.getTutorInfo(memberNo);
		
		MemberDto newSessionMemberDto = authService.memberExist(newTutorDto.getMemberEmail(), newTutorDto.getMemberPassword());
		
		session.removeAttribute("member");
		
		session.setAttribute("member", newSessionMemberDto);
		
		session.setAttribute("tutor", newTutorDto);
		if(insertResult == 0) {
			log.warn("튜터 레지스터가 실패했습니다.");
		} else {
			log.info("튜터 레지스터 성공!");
		}

		if(updateResult == 0) {
			log.warn("튜터 GRADE 변경에 실패했습니다.");
		} else {
			log.info("튜터 GRADE 변경 성공!");
		}

		return "redirect:/tutor/home.do";
	}

	@RequestMapping(value = "/tutor/tutorSelectOne.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String main(@RequestParam(defaultValue = "1") int tutorNo, Model model, HttpServletRequest request, HttpSession session) {
		
		
		if(request.getAttribute("tutorNo") != null) {
			tutorNo = (int)request.getAttribute("tutorNo");
		}
		
		MemberDto sessionMemberDto = (MemberDto) session.getAttribute("member");
		
		
		TutorCommentDto studentTutorCommentDtoList = tutorService.getStudentTutorComment(sessionMemberDto.getMemberNo(), tutorNo);
		
		
		TutorDto tutorDto = tutorService.getTutorIntroduce(tutorNo);
		List<TutorCommentDto> tutorCommentDtoList = tutorService.getTutorComments(tutorNo);
		
		
		model.addAttribute("tutorCommentDtoList", tutorCommentDtoList);
		model.addAttribute("studentTutorCommentDtoList", studentTutorCommentDtoList);
		model.addAttribute("tutorDto", tutorDto);
		
		
		return "member/tutor/info/tutorSelectOne";
	}
	
	
	@RequestMapping(value = "/tutor/tutorMainPage.do", method = RequestMethod.GET)
	public String tutorMainPage(HttpSession session, Model model) {
		log.info("tutorMainPage 입니다. GET");
		
		MemberDto sessionTutorDto = (MemberDto) session.getAttribute("member");
		
		int no = sessionTutorDto.getMemberNo();
		
		TutorDto tutorDto = tutorService.getTutorIntroduce(no);
		
		TutorDto tutorDtoBodard = tutorService.boardSelect(no);
		
		model.addAttribute("tutorDto", tutorDto);
		model.addAttribute("tutorDtoBodard", tutorDtoBodard);
		
		return "member/tutor/info/tutorMainPage";
	}
	
	@RequestMapping(value = "/tutor/tutorClassRoom.do", method = RequestMethod.GET)
	public String tutorClassRoom(HttpSession session, Model model) {
		log.info("tutorClassRoom 입니다. GET");
		
		MemberDto sessionTutorDto = (MemberDto) session.getAttribute("member");
		
		int no = sessionTutorDto.getMemberNo();
		
		TutorDto tutorDto = tutorService.getTutorInfo(no);
		
		model.addAttribute("tutorDto", tutorDto);
		
		return "member/tutor/info/tutorClassRoom";
	}
	
	@RequestMapping(value = "/tutor/tutorInfoRevise.do", method = RequestMethod.GET)
	public String tutorInfoRevise(HttpSession session, Model model) {
		log.info("tutorInfoRevise 입니다. GET");
		
		MemberDto sessionTutorDto = (MemberDto) session.getAttribute("member");

		int no = sessionTutorDto.getMemberNo();

		TutorDto tutorDto = tutorService.getTutorIntroduce(no);
		
		TutorDto tutorDtoGrade = tutorService.getTutorGrade(no);
		
		model.addAttribute("tutorDto", tutorDto);
		model.addAttribute("tutorDtoGrade", tutorDtoGrade);
		
		
		return "member/tutor/info/tutorInfoRevise";
	}
	
	@RequestMapping(value = "/tutor/tutorPrivateInfo.do", method = RequestMethod.GET)
	public String tutorPrivateInfo(HttpSession session, Model model) {
		log.info("tutorInfoRevise 입니다. GET");
		
		MemberDto sessionTutorDto = (MemberDto) session.getAttribute("member");

		int no = sessionTutorDto.getMemberNo();

		TutorDto tutorDto = tutorService.getTutorIntroduce(no);
		
		TutorDto tutorDtoGrade = tutorService.getTutorGrade(no);
		
		model.addAttribute("tutorDto", tutorDto);
		model.addAttribute("tutorDtoGrade", tutorDtoGrade);
		
		return "member/tutor/info/tutorPrivateInfo";
	}
	
	
	@RequestMapping(value = "/tutor/tutorPrivateInfoCtr.do", method = RequestMethod.POST)
	public String tutorPrivateInfoCtr(TutorDto tutorDto, HttpSession session, Model model) {
		log.info("tutorPrivateInfoCtr 입니다. POST");
		
		tutorService.updatePwd(tutorDto);

		TutorDto sessionTutorDto = tutorService.getTutorInfo(tutorDto.getMemberNo());
		
		String memberEmail = sessionTutorDto.getMemberEmail();
		
		MemberDto memberDto = authService.memberExist(memberEmail , tutorDto.getMemberPassword());
		
		session.removeAttribute("member");
		session.setAttribute("member", memberDto);
		
		return "redirect:/tutor/tutorPrivateInfo.do";
	}
	
	@RequestMapping(value = "/tutor/tutorCheckPassword.do", method = RequestMethod.GET)
	public String tutorCheckPassword(HttpSession session, Model model) {
		log.info("tutorCheckPassword 입니다. GET");
		
		MemberDto sessionTutorDto = (MemberDto) session.getAttribute("member");
		
		int no = sessionTutorDto.getMemberNo();

		TutorDto tutorDto = tutorService.getTutorIntroduce(no);
				
		model.addAttribute("tutorDto", tutorDto);
				
		return "member/tutor/info/tutorCheckPassword";
	}
	
	@RequestMapping(value = "/tutor/tutorIntroduce.do", method = RequestMethod.GET)
	public String tutorIntroduce(HttpSession session, Model model) {
		log.info("tutorIntroduce 입니다. GET");
		
		MemberDto sessionTutorDto = (MemberDto) session.getAttribute("member");

		int no = sessionTutorDto.getMemberNo();

		TutorDto tutorDto = tutorService.getTutorIntroduce(no);
		
		model.addAttribute("tutorDto", tutorDto);
		
		return "member/tutor/info/tutorIntroduce";
	}
	
	@RequestMapping(value = "/tutor/tutorIntroduceRevise.do", method = RequestMethod.GET)
	public String tutorIntroduceRevise(HttpSession session, Model model) {
		log.info("tutorIntroduceRevise 입니다. GET");
		
		MemberDto sessionTutorDto = (MemberDto) session.getAttribute("member");

		int no = sessionTutorDto.getMemberNo();

		TutorDto tutorDto = tutorService.getTutorIntroduce(no);
		
		model.addAttribute("tutorDto", tutorDto);
		
		return "member/tutor/info/tutorIntroduceRevise";
	}
	
	@RequestMapping(value = "/tutor/tutorIntroduceReviseCtr.do", method = RequestMethod.POST)
	public String tutorIntroduceRevise(TutorDto tutorDto, HttpSession session, Model model
			,@RequestParam(value="fileIdx", defaultValue = "-1") int fileIdx
			,MultipartHttpServletRequest multipartHttpServletRequest)throws ParseException {
		log.info("tutorIntroduceReviseCtr 입니다. POST");
						
		int resultNum = 0;
		
		try {
			// 설명하지 

			resultNum = tutorService.TutorProfileUpdateOne(tutorDto
					, multipartHttpServletRequest, fileIdx);
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if (resultNum != 0) {
			MemberDto sessionMemberDto = (MemberDto)session.getAttribute("member");
			
			if (sessionMemberDto != null) {
				
				if (sessionMemberDto.getMemberNo() == tutorDto.getMemberNo()) {
					
					TutorDto tempTutorDto = tutorService.getTutorInfo(tutorDto.getMemberNo());
					MemberDto newSessionMemberDto = authService.memberExist(tempTutorDto.getMemberEmail(), tempTutorDto.getMemberPassword());
					
					session.removeAttribute("member");
					
					session.setAttribute("member", newSessionMemberDto);
				}
				
			}
		}

		int result = tutorService.updateTutor(tutorDto);
		
		if(result == 0) {
			System.out.println("튜터 업데이트가 안됐습니다");
		}else {
			System.out.println("튜터 업데이트 성공");
		}
		
		return "redirect:/tutor/tutorIntroduce.do";
	}
	
	@RequestMapping(value = "/tutor/tutorWithdraw.do", method = RequestMethod.GET)
	public String tutorWithdraw(HttpSession session, Model model) {
		log.info("tutorIntroduceRevise 입니다. GET");
		
		MemberDto sessionTutorDto = (MemberDto) session.getAttribute("member");

		int no = sessionTutorDto.getMemberNo();

		TutorDto tutorDto = tutorService.getTutorIntroduce(no);
		
		model.addAttribute("tutorDto", tutorDto);
		
		return "member/tutor/info/tutorWithdraw";
	}
	
	@RequestMapping(value = "/tutor/tutorWithdrawCtr.do", method = RequestMethod.POST)
	public String tutorWithdrawCtr(HttpSession session, Model model) {
		log.info("tutorWithdrawCtr 입니다. POST");

		
		MemberDto sessionTutorDto = (MemberDto) session.getAttribute("member");

		int no = sessionTutorDto.getMemberNo();
		
		tutorService.deleteMember(no);
	
		session.removeAttribute("member");
		session.invalidate();
		
		return "redirect:/auth/login.do";
	}

	@RequestMapping(value = "/tutor/writeCommentCtr.do", method = RequestMethod.POST)
	public String writeCommentCtr(TutorCommentDto tutorCommentDto, HttpSession session, Model model, HttpServletRequest request) {
		log.info("writeCommentCtr.do 입니다. POST");
		
		int resultNum = tutorService.writeComment(tutorCommentDto);
		
		request.setAttribute("tutorNo", tutorCommentDto.getTutorNo());
		
		
//		return "redirect:./tutorSelectOne.do?tutorNo=" + tutorCommentDto.getTutorNo();
		return "forward:./tutorSelectOne.do";
	}
	@RequestMapping(value = "/tutor/tutorCommentRemoveCtr.do", method = RequestMethod.POST)
	public String tutorCommentRemoveCtr(TutorCommentDto tutorCommentDto, HttpSession session, Model model, HttpServletRequest request) {
		log.info("writeCommentCtr.do 입니다. POST");
		
		int resultNum = tutorService.removeComment(tutorCommentDto);
		
		
		return "forward:./tutorSelectOne.do";
	}
	
	
	@RequestMapping(value = "/tutor/tutorCommentModifyCtr.do", method = RequestMethod.POST)
	public String tutorCommentModifyCtr(TutorCommentDto tutorCommentDto, HttpSession session, Model model, HttpServletRequest request) {
		log.info("writeCommentCtr.do 입니다. POST");

		int resultNum = tutorService.modifyComment(tutorCommentDto);
		
		return "forward:./tutorSelectOne.do";
	}
	
	
	@RequestMapping(value = "/tutor/tutorQnABoard.do"
			, method = {RequestMethod.GET, RequestMethod.POST})
	public String tutorBoardList(HttpSession session,
		@RequestParam(defaultValue = "1") int curPage, 
		@RequestParam(defaultValue = "0") int idx, 
		Model model) {
		
		log.info("Welcome tutorBoardList! " + curPage + " : ???? ");
		
		MemberDto sessionTutorDto = (MemberDto) session.getAttribute("member");
		
		int no = sessionTutorDto.getMemberNo();
		TutorDto tutorDto = tutorService.getTutorIntroduce(no);

		// 회원 토탈카운트 -> 보드 토탈카운트
		int totalCount = 
			tutorService.boardSelectTotalCount(no);
		
		// 이전 페이지로 회원의 번호가 명확하게 나온 경우
		// 자신의 curPage 찾는 로직 ->보드쪽으로 IDX 주면서
		if(idx != 0) {
			curPage 
				= tutorService.tutorBoardCurPage(no, idx);
		}
		
		
		PagingYJ tutorPaging = new PagingYJ(totalCount, curPage);
		int start = tutorPaging.getPageBegin();
		int end = tutorPaging.getPageEnd();

//		튜터보드리스트
		List<QuestionBoardDto> tutorBoardList = 
				tutorService.tutorBoardList(start, end, no);
		
		// 페이징
		Map<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("totalCount", totalCount);
		pagingMap.put("memberPaging", tutorPaging);

		model.addAttribute("tutorDto", tutorDto);
		model.addAttribute("tutorBoardList", tutorBoardList);
		model.addAttribute("pagingMap", pagingMap);
		
		return "member/tutor/qna/tutorQnABoard";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/tutor/changeTutorStatusCheck.do", method = RequestMethod.POST)
	public int changeTutorStatusCheck(TutorDto tutorDto, HttpSession session) {
		log.info("changeTutorStatusCheck.do 입니다. POST");
		
		int resultNum = tutorService.changeTutorStatus(tutorDto);
		
		
		TutorDto newSesssionTutorDto = tutorService.getTutorInfo(tutorDto.getMemberNo());
		
		session.removeAttribute("tutor");
		session.setAttribute("tutor", newSesssionTutorDto);
		
		System.out.println("changeTutorStatusCheck 끝");
		
		return resultNum;
	}
	
	@RequestMapping(value = "/tutor/addStudyHistoryCtr.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String addStudyHistoryCtr(HttpSession session, Model model, TutorCommentDto tutorCommentDto, int price) {
		log.info("addStudyHistoryCtr 입니다. GET" + tutorCommentDto);
		System.out.println(tutorCommentDto);
		System.out.println(tutorCommentDto);
		System.out.println(price);
		System.out.println(price);
		System.out.println(price);
		
		Map<String, Object> map = studentService.SelectOne(tutorCommentDto.getStudentNo());
		
		MemberFileDto memberFileDto = (MemberFileDto) map.get("MemberFileDto");
		
		tutorCommentDto.setStudentName(memberFileDto.getMemberName());
		
		int resultNum = tutorService.addStudyHistory(tutorCommentDto);

		tutorService.addPoint(tutorCommentDto.getStudentNo(), 0 - price);
		
		Map<String, Object> studentMap = studentService.SelectOne(tutorCommentDto.getStudentNo());
		MemberFileDto studentDto = (MemberFileDto) studentMap.get("MemberFileDto");
		
		MemberDto newSessionMemberDto = authService.memberExist(studentDto.getMemberEmail(), studentDto.getMemberPassword());
		
		session.removeAttribute("member");
		
		session.setAttribute("member", newSessionMemberDto);
		
		if(resultNum == 0) {
			System.out.println("에드 히스토리 실패");
		}else if(resultNum == 1) {
			System.out.println("에드 히스토리 성공");
		}
		
		
		return "member/tutor/info/tutorPrivateInfo";
	}
	
	@ResponseBody
	@RequestMapping(value = "/tutor/earnMoney.do", method = {RequestMethod.POST, RequestMethod.GET})
	public int earnMoney(HttpSession session, Model model, int tutorNo, String statusCheck, int price) {
		log.info("addStudyHistoryCtr 입니다. GET" + tutorNo);
		
		System.out.println(price);
		System.out.println(price);
		System.out.println(price);
		System.out.println(price);
		System.out.println(price);
		
		
		int resultNum = tutorService.addPoint(tutorNo, price);

		TutorDto tutorDto = tutorService.getTutorInfo(tutorNo);
		
		MemberDto newSessionMemberDto = authService.memberExist(tutorDto.getMemberEmail(), tutorDto.getMemberPassword());
		
		session.removeAttribute("member");
		
		session.setAttribute("member", newSessionMemberDto);
		
		
		return resultNum;
	}
	@RequestMapping(value = "/tutor/tutorQnAWrite.do", method = RequestMethod.GET)
	public String tutorQnAWrite(HttpSession session, Model model
			, @RequestParam(defaultValue = "1") int curPage) {
		log.info("tutorQnAWrite 입니다. GET");
						
		
		MemberDto sessionTutorDto = (MemberDto) session.getAttribute("member");
		
		int no = sessionTutorDto.getMemberNo();
		
		TutorDto tutorDto = tutorService.getTutorIntroduce(no);
		
		model.addAttribute("tutorDto", tutorDto);

		return "member/tutor/qna/tutorQnAWrite";
	}
	
	@RequestMapping(value = "/tutor/tutorQnAWriteCtr.do", method = RequestMethod.POST)
	public String tutorQnAWriteCtr(HttpSession session, Model model, QuestionBoardDto questionBoardDto
			, @RequestParam(defaultValue = "1") int curPage) {
		log.info("tutorQnAWrite 입니다. GET");
						
		MemberDto sessionTutorDto = (MemberDto) session.getAttribute("member");
		
		int no = sessionTutorDto.getMemberNo();

		TutorDto tutorDto = tutorService.getTutorIntroduce(no);
		questionBoardDto.setNo(no);
		questionBoardDto.setName(tutorDto.getMemberName());

		int tutorDtoInsert = tutorService.boardWrite(questionBoardDto);
		
		model.addAttribute("tutorDto", tutorDto);
		model.addAttribute("tutorDtoInsert", tutorDtoInsert);

		return "redirect:/tutor/tutorQnABoard.do";
	}
	
	@RequestMapping(value = "/tutor/tutorQnARead.do", method = RequestMethod.GET)
	public String tutorQnARead(HttpSession session, Model model, int idx
			, @RequestParam(defaultValue = "1") int curPage) {
		
		log.info("tutorQnARead 입니다. GET");
						
		MemberDto sessionTutorDto = (MemberDto) session.getAttribute("member");
		
		int no = sessionTutorDto.getMemberNo();
		
		TutorDto tutorDto = tutorService.getTutorIntroduce(no);		
		
		QuestionBoardDto questionBoardDto = tutorService.boardSelectOne(idx);
		model.addAttribute("questionBoardDto", questionBoardDto);
		model.addAttribute("tutorDto", tutorDto);
		
		model.addAttribute("curPage",curPage);
		return "member/tutor/qna/tutorQnARead";
	}
	
	
	
	
	@RequestMapping(value = "/tutor/tutorQnARevise.do", method = RequestMethod.GET)
	public String tutorQnARevise(HttpSession session, Model model, int idx
			, @RequestParam(defaultValue = "1") int curPage) {
		log.info("tutorQnARevise 입니다. GET");
		
		MemberDto sessionTutorDto = (MemberDto) session.getAttribute("member");

		int no = sessionTutorDto.getMemberNo();

		TutorDto tutorDto = tutorService.getTutorIntroduce(no);
		QuestionBoardDto questionBoardDto = tutorService.boardSelectOne(idx);
		
		model.addAttribute("tutorDto", tutorDto);
		model.addAttribute("questionBoardDto", questionBoardDto);
		
		return "member/tutor/qna/tutorQnARevise";
	}
	
	
	
	
	@RequestMapping(value = "/tutor/tutorQnAReviseCtr.do", method = RequestMethod.POST)
	public String tutorQnAReviseCtr(HttpSession session, Model model, QuestionBoardDto questionBoardDto) {
		log.info("tutorQnARevise 입니다. GET");
		
		int resultNum = 0;
		resultNum = tutorService.questionRevise(questionBoardDto);
		int idx = questionBoardDto.getIdx();
		System.out.println("완료 값" + resultNum);
		System.out.println("업데이트 완료 DTO값" + questionBoardDto);

//		return "redirect/student/questionSelect.do";
//		return "./questionSelect.do?idx="+idx;
		
		return "redirect:/tutor/tutorQnARead.do?idx="+idx;
	}
	

	
	
	
}
