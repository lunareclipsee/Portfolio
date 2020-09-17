package com.englishvillage.member.student.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.englishvillage.auth.model.MemberDto;
import com.englishvillage.auth.service.AuthService;
import com.englishvillage.member.student.model.MemberFileDto;
import com.englishvillage.member.student.model.QuestionBoardDto;
import com.englishvillage.member.student.service.StudentService;
import com.englishvillage.member.tutor.model.TutorDto;
import com.englishvillage.member.tutor.service.TutorService;
import com.englishvillage.util.PagingYJ;

@Controller
public class StudentController {

	private static final Logger log = LoggerFactory.getLogger(StudentController.class);
	
	@Autowired
	private TutorService tutorService;
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private AuthService authService;

	@RequestMapping(value = "/student/myPage.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String myPage(Locale locale, HttpSession session, Model model) {
		log.info("call myPage! " + session.getAttribute("member"));
		MemberDto sessionMemberDto = (MemberDto) session.getAttribute("member");
		// 학생
		int no = sessionMemberDto.getMemberNo();
		
		Map<String, Object> map = studentService.SelectOne(no);
		MemberFileDto memberFileDto = (MemberFileDto) map.get("MemberFileDto");
		
		//최근문의 
		List<QuestionBoardDto> qusetionList = studentService.questionSelectList(no);
		
		//최근수강내역
		List<QuestionBoardDto> studyList = studentService.studySelectList(no);
		
		//강사소개
		List<TutorDto> tutorDtoList = tutorService.getTutorList();
		//랜덤으로 섞기
		Collections.shuffle(tutorDtoList);
		
		model.addAttribute("memberFileDto", memberFileDto);
		model.addAttribute("qusetionList", qusetionList);
		model.addAttribute("studyList", studyList);
		model.addAttribute("tutorDtoList", tutorDtoList);
		
		return "/member/student/info/studentMainPage";
	}

	@RequestMapping(value = "/student/myInfo.do", method = { RequestMethod.GET })
	public String infoPage(Locale locale, HttpSession session, Model model) {
		log.info("Welcome myInfo.do! {} {}");
		System.out.println("세션초기값이다ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ" + session.getAttribute("member"));
		MemberDto sessionMemberDto = (MemberDto) session.getAttribute("member");

		System.out.println("일단 세션 만들기 성공" + sessionMemberDto);
		int no = sessionMemberDto.getMemberNo();

		Map<String, Object> map = studentService.SelectOne(no);
		MemberFileDto memberFileDto = (MemberFileDto) map.get("MemberFileDto");
		model.addAttribute("memberFileDto", memberFileDto);

		return "/member/student/info/studentPrivateInfo";
	}

	@RequestMapping(value = "/student/studentCheck.do", method = { RequestMethod.GET })
	public String infoPage(Model model) {
		log.info("Welcome studentCheck.do! {} {}");

		return "/member/student/info/studentCheckPassword";
	}

	@RequestMapping(value = "/student/update.do", method = RequestMethod.GET)
	public String memberUpdate(HttpSession session, Model model) {
		log.info("call update! {}");
		MemberDto sessionMemberDto = (MemberDto) session.getAttribute("member");

		System.out.println("일단 세션 만들기 성공2");
		int no = sessionMemberDto.getMemberNo();

		Map<String, Object> map = studentService.SelectOne(no);
		System.out.println("여긴 맵이야2" + map);
		MemberFileDto memberFileDto = (MemberFileDto) map.get("MemberFileDto");
		System.out.println("넣을값2" + memberFileDto);
		model.addAttribute("memberFileDto", memberFileDto);

		return "/member/student/info/studentInfoRevise";
	}

	// 회원수정
	@RequestMapping(value = "/student/updateCtr.do", method = RequestMethod.POST)
	public String memberUpdateCtr(HttpSession session, String memberPassword, Model model) {
		log.info("call memberUpdateCtr! {} :: {}", session + "패스워드" + memberPassword);
		int resultNum = 0;
		MemberDto sessionMemberDto = (MemberDto) session.getAttribute("member");
		sessionMemberDto.setMemberPassword(memberPassword);

		resultNum = studentService.memberUpdateOne(sessionMemberDto);
		System.out.println("업데이트 결과값" + resultNum);

		return "redirect:/student/myInfo.do";

	}

	// 회원탈퇴 확인
	@RequestMapping(value = "/student/delete.do", method = RequestMethod.POST)
	public String memberDelete(Model model) {

		log.info("call memberdelete!");

		return "/member/student/info/studentWithdraw";
	}

	// 회원 삭제
	@RequestMapping(value = "/student/deleteCtr.do", method = RequestMethod.POST)
	public String memberDeleteCtr(HttpSession session, Model model) {

		log.info("call memberDeleteCtr! " + session.getAttribute("member"));

		MemberDto sessionMemberDto = (MemberDto) session.getAttribute("member");

		System.out.println("탈퇴전 세션 만들기 성공" + sessionMemberDto);
		int no = sessionMemberDto.getMemberNo();

		studentService.memberDeleteOne(no);

		System.out.println("탈퇴 서비스 완료");
		session.removeAttribute("member");
		session.invalidate();

		return "/member/student/info/delete";
	}

//	수강내역
	@RequestMapping(value = "/student/studyList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String studyList(@RequestParam(defaultValue = "1") int curPage, @RequestParam(defaultValue = "0") int idx,
			HttpSession session, Locale locale, Model model) {
		log.info("Welcome studyList! idx: " + idx);
		int totalCount = 0;
		MemberDto sessionMemberDto = (MemberDto) session.getAttribute("member");
		int no = sessionMemberDto.getMemberNo();

		totalCount = studentService.studentStudyCount(no);
		
		//강사소개
		List<TutorDto> tutorDtoList = tutorService.getTutorList();
		//랜덤으로 섞기
		Collections.shuffle(tutorDtoList);

		PagingYJ memberPaging = new PagingYJ(totalCount, curPage);
		int start = memberPaging.getPageBegin();
		int end = memberPaging.getPageEnd();
		System.out.println("start" + start);
		System.out.println("end" + end);

		List<QuestionBoardDto> studyList = studentService.studySelectList(no, start, end);
//				// 페이징
		Map<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("totalCount", totalCount);
		pagingMap.put("memberPaging", memberPaging);
		model.addAttribute("studyList", studyList);
		model.addAttribute("tutorDtoList", tutorDtoList);
		model.addAttribute("pagingMap", pagingMap);

		return "/member/student/info/studentStudyInfo";
	}

	// 문의 리스트
	@RequestMapping(value = "/student/questionList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String TutorList(@RequestParam(defaultValue = "1") int curPage, @RequestParam(defaultValue = "0") int idx,
			@RequestParam(defaultValue = "all") String searchOption, @RequestParam(defaultValue = "") String keyword,
			HttpSession session, Model model) {
		log.info("Welcome QuestionList.do\"! {}");
		System.out.println(searchOption);
		// 화면의 form의 이름을 마바티스에 편하게 맞추기 위한 로직
		System.out.println("idx는 도대체 무슨값일까??" + idx);
		// 페이징을 위한 전체 회원목록 갯수
		int totalCount = 0;
		MemberDto sessionMemberDto = (MemberDto) session.getAttribute("member");
		int no = sessionMemberDto.getMemberNo();

		totalCount = studentService.studentQuestionCount(no, searchOption, keyword);
		System.out.println("totalCount" + totalCount);
//				이전 페이지로 돌아갈때 값
//				자신의 curPage 찾는 로직
		if (idx != 0) {
			curPage = studentService.questionSelectCurPage(no, idx, searchOption, keyword);
		}
		System.out.println("curPage" + curPage);
		PagingYJ memberPaging = new PagingYJ(totalCount, curPage);
		int start = memberPaging.getPageBegin();
		int end = memberPaging.getPageEnd();
		System.out.println("start" + start);
		System.out.println("end" + end);

		List<QuestionBoardDto> qusetionList = studentService.questionSelectList(no, searchOption, keyword, start, end);
		System.out.println("qusetionList" + qusetionList);

			//검색
		HashMap<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("searchOption", searchOption);
		searchMap.put("keyword", keyword);
		
			// 페이징
		Map<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("totalCount", totalCount);
		pagingMap.put("memberPaging", memberPaging);
		model.addAttribute("qusetionList", qusetionList);
		model.addAttribute("pagingMap", pagingMap);
		model.addAttribute("searchMap", searchMap);

		return "/member/student/qna/studentQnABoard";
	}

	// 문의 작성하기
	@RequestMapping(value = "/student/questionAdd.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String QuestionAdd(HttpSession session, Model model) {
		log.info("Welcome QuestionAdd.do! ");

		return "/member/student/qna/studentQnAWrite";
	}

	@RequestMapping(value = "/student/questionAddCtr.do", method = RequestMethod.POST)
	public String QuestionAddCtr(QuestionBoardDto questionBoardDto, HttpSession session, Model model) {
		log.info("Welcome QuestionAddCtr.do! " + questionBoardDto);

		int resultNum = 0;

		resultNum = studentService.QuestionAdd(questionBoardDto);
		System.out.println("결과값" + resultNum);

		return "redirect:/student/questionList.do";
	}

	// 문의 상세읽기
	@RequestMapping(value = "/student/questionSelect.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String QuestionList(HttpSession session, int idx, String searchOption, String keyword, Model model) {
		log.info("Welcome QuestionSelect.do! {} " + idx);
		System.out.println(searchOption);
		System.out.println(searchOption);
		System.out.println(searchOption);
		System.out.println(searchOption);
		System.out.println(searchOption);
		System.out.println(searchOption);
		System.out.println(searchOption);
		
		MemberDto sessionMemberDto = (MemberDto) session.getAttribute("member");
		int no = sessionMemberDto.getMemberNo();

		// no값이 없이 설정하면 내 글이 아닌글도 읽어짐... 그래서 no넣었음
		Map<String, Object> map = studentService.QuestionSelect(no, idx);
		
		QuestionBoardDto questionBoardDto = (QuestionBoardDto) map.get("QuestionBoardDto");
		
		model.addAttribute("questionBoardDto", questionBoardDto);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyword", keyword);
		System.out.println(questionBoardDto);

		return "/member/student/qna/studentQnARead";
	}

	// 문의 수정
	@RequestMapping(value = "/student/questionRevise.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String QuestionRevise(HttpSession session, int idx, Model model) {
		log.info("Welcome QuestionRevise.do! ");
		MemberDto sessionMemberDto = (MemberDto) session.getAttribute("member");
		int no = sessionMemberDto.getMemberNo();

		// no값이 없이 설정하면 내 글이 아닌글도 읽어짐... 그래서 no넣었음
		Map<String, Object> map = studentService.QuestionSelect(no, idx);
		QuestionBoardDto questionBoardDto = (QuestionBoardDto) map.get("QuestionBoardDto");
		model.addAttribute("questionBoardDto", questionBoardDto);
		System.out.println(questionBoardDto);

		return "/member/student/qna/studentQnARevise";
	}

	// 문의 수정최종
	@RequestMapping(value = "/student/questionReviseCtr.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String questionReviseCtr(QuestionBoardDto questionBoardDto, Model model) {
		log.info("Welcome QuestionRevise.do! ");
		int resultNum = 0;
		resultNum = studentService.QuestionRevise(questionBoardDto);
		int idx = questionBoardDto.getIdx();
		System.out.println("완료 값" + resultNum);
		System.out.println("업데이트 완료 DTO값" + questionBoardDto);

//		return "redirect/student/questionSelect.do";
//		return "./questionSelect.do?idx="+idx;
		return "redirect:/student/questionSelect.do?idx=" + idx;
	}

	// 테스트 페이지
	@RequestMapping(value = "test.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String test(QuestionBoardDto questionBoardDto, HttpSession session, Model model) {
		log.info("Welcome test.do! " + questionBoardDto);

		return "/member/student/info/delete";
	}

	// 고재민 작업분 (수강권 구매)
	@RequestMapping(value = "/student/buyPoint.do", method = RequestMethod.GET)
	public String buyPoint(Locale locale, HttpSession session, Model model) {
		log.info("@@@@@@@buyPoint!!!@@@@@@@@@");

		return "/member/student/info/buyPoint";
	}

	// 고재민 작업분 (수강권 구매Ctr)
	@RequestMapping(value = "/student/buyPointCtr.do", method = RequestMethod.POST)
	public String buyPointCtr(Locale locale, HttpSession session, Model model, int price) {
		log.info("@@@@@@@buyPointCtr!!!@@@@@@@@@");

		MemberDto memberDto = (MemberDto) session.getAttribute("member");
		int no = memberDto.getMemberNo();

		studentService.buyPoint(price, no);

		MemberDto sessionMemberDto = authService.memberExist(memberDto.getMemberEmail(), memberDto.getMemberPassword());

		session.removeAttribute("member");
		session.setAttribute("member", sessionMemberDto);

		return "redirect:/student/myPage.do";
	}

}
