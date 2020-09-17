package com.englishvillage.member.admin.controller;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.englishvillage.auth.model.MemberDto;
import com.englishvillage.member.admin.model.MemberListDto;
import com.englishvillage.member.admin.model.QuestionBoardDto;
import com.englishvillage.member.admin.service.AdminService;
import com.englishvillage.util.PagingYJ;
import com.englishvillage.util.Paging;
import com.englishvillage.util.mainPaging;

@Controller
public class AdminController {

	private static final Logger log = 
		LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private AdminService adminService;
	
	//학생리스트
	@RequestMapping(value = "/admin/studentList.do"
			, method = {RequestMethod.GET, RequestMethod.POST})
	public String StudentList(@RequestParam(defaultValue = "1") 
			int curPage
			, @RequestParam(defaultValue = "0") int no
			, @RequestParam(defaultValue = "all") String searchOption
			, @RequestParam(defaultValue = "") String keyword
			, Model model) {
		log.info("Welcome studentList! " + curPage + " : " 
			+ searchOption + " : " + keyword);
		System.out.println("여긴 오는지 1");
		
	
		
		// 페이징을 위한 전체 회원목록 갯수
		int totalCount = 
			adminService.studentSelectTotalCount(
				searchOption, keyword);
		
		log.info(" " + totalCount);
//		이전 체이지로 회원으이 번호가 명확하게 나온경우
//		자신의 curPage 찾는 로직
		if(no != 0) {
			curPage
				= adminService.studentSelectCurPage(searchOption, keyword, no);
		}
		
		
		mainPaging memberPaging = new mainPaging(totalCount, curPage);
		int start = memberPaging.getPageBegin();
		int end = memberPaging.getPageEnd();
		
		log.info(" " + memberPaging, start, end);
		
		System.out.println("여긴 오는지 1.5");

		List<MemberListDto> memberList = 
				adminService.studentSelectList(searchOption, keyword
				, start, end);
		
		System.out.println("여긴 오는지 2");
		// 화면의 form의 이름을 맞추기 위한 작업
		
		// 검색
		HashMap<String, Object> searchMap 
			= new HashMap<String, Object>();
		searchMap.put("searchOption", searchOption);
		searchMap.put("keyword", keyword);
		
		
		// 페이징
		Map<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("totalCount", totalCount);
		pagingMap.put("memberPaging", memberPaging);
		
		
		model.addAttribute("memberList", memberList);
		model.addAttribute("pagingMap", pagingMap);
		
		model.addAttribute("searchMap", searchMap);
		
		
		System.out.println("@@@@@@@#################" + keyword);
		System.out.println("@@@@@@@#################" + searchOption);
		
		return "admin/student/adminStudentList";
	}
	
	@RequestMapping(value = "/admin/studentListOne.do", method = RequestMethod.GET)
	public String studentListOne(int no, String searchOption, String keyword, Model model) {
		log.info("call studentListOne! - {} {}", no + "\n" + searchOption + "\n" + keyword);
		
		
		
		Map<String, Object> map = adminService.memberStudentSelectOne(no);
		
		MemberListDto memberListDto = (MemberListDto)map.get("memberListDto");
		

		
		model.addAttribute("memberListDto", memberListDto);

		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyword", keyword);

		
		return "admin/student/adminStudentInfo";
	}
	
	//회원 수정 화면으로
		@RequestMapping(value = "/admin/studentUpdate.do", method = RequestMethod.GET)
		public String studentUpdate(int no, Model model) {
			
			log.info("call studentUpdate! {}", no);
			System.out.println("왔다!");
			
			Map<String, Object> map = adminService.memberStudentSelectOne(no);
			
			MemberListDto memberListDto = (MemberListDto)map.get("memberListDto");
			
//			List<Map<String, Object>> fileList = (List<Map<String, Object>>)map.get("fileList");
			
			model.addAttribute("memberListDto", memberListDto);
			
//			model.addAttribute("fileList", fileList);
		
			
			return "admin/student/adminStudentInfoRevise";
		}
		
		//회원수정
		@RequestMapping(value = "/admin/studentUpdateCtr.do", method = RequestMethod.POST)
		public String studentUpdateCtr(HttpSession session, MemberListDto memberListDto,
									  @RequestParam(value="fileIdx", defaultValue = "-1") int fileIdx
									  ,MultipartHttpServletRequest multipartHttpServletRequest
									  , Model model) throws ParseException {
			
			log.info("call studentUpdateCtr! {} :: {}" + memberListDto, fileIdx);
			
			int resultNum = 0;
			
			System.out.println(memberListDto.getNo());
			System.out.println(memberListDto.getMember_name());
			System.out.println(memberListDto.getMember_email());
			System.out.println(memberListDto.getGender());
			
			
			
			try {
				// 설명하지 
				resultNum = adminService.memberStudentUpdateOne(memberListDto
						, multipartHttpServletRequest, fileIdx);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				System.out.println("updateone에 예외처리되나");
				e.printStackTrace();
			}
			
			if (resultNum != 0) {
				MemberDto sessionMemberDto = (MemberDto)session.getAttribute("member");
				
				if (sessionMemberDto != null) {
					
					if (sessionMemberDto.getMemberNo() == memberListDto.getNo()) {
						MemberListDto newMemberListDto = new MemberListDto(memberListDto.getNo(),memberListDto.getMember_name()
								,memberListDto.getMember_email(),memberListDto.getPassword(), memberListDto.getModifiedDate()
								,memberListDto.getBirthDate(),memberListDto.getCountry(),memberListDto.getGender());
						
						session.removeAttribute("member");
						
						session.setAttribute("member", newMemberListDto);
					}
					
				}
			}
			
			return "redirect:./studentList.do";
		}
	
	//튜터 리스트
	@RequestMapping(value = "/admin/tutorList.do"
			, method = {RequestMethod.GET, RequestMethod.POST})
	public String TutorList(@RequestParam(defaultValue = "1") 
			int curPage
			, @RequestParam(defaultValue = "0") int no
			, @RequestParam(defaultValue = "all") String searchOption
			, @RequestParam(defaultValue = "") String keyword
			, Model model) {
		log.info("Welcome tutorList! " + curPage + " : " 
			+ searchOption + " : " + keyword);
		// 화면의 form의 이름을 마바티스에 편하게 맞추기 위한 로직

	
		
	
		
		// 페이징을 위한 전체 회원목록 갯수
		int totalCount = 
			adminService.tutorSelectTotalCount(
				searchOption, keyword
			);
		
		
//		이전 체이지로 회원으이 번호가 명확하게 나온경우
//		자신의 curPage 찾는 로직
		if(no != 0) {
			curPage
				= adminService.tutorSelectCurPage(searchOption, keyword, no);
		}
		
		
		mainPaging memberPaging = new mainPaging(totalCount, curPage);
		int start = memberPaging.getPageBegin();
		int end = memberPaging.getPageEnd();
		
		List<MemberListDto> memberList = 
				adminService.tutorSelectList(searchOption, keyword
				, start, end);

		// 화면의 form의 이름을 맞추기 위한 작업

		// 검색
		HashMap<String, Object> searchMap 
			= new HashMap<String, Object>();
		searchMap.put("searchOption", searchOption);
		searchMap.put("keyword", keyword);
		
		// 페이징
		Map<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("totalCount", totalCount);
		pagingMap.put("memberPaging", memberPaging);

		model.addAttribute("memberList", memberList);
		model.addAttribute("pagingMap", pagingMap);
		model.addAttribute("searchMap", searchMap);
		
		System.out.println("@@@@@@@#################" + keyword);
		System.out.println("@@@@@@@#################" + searchOption);
		
		return "admin/tutor/adminTutorList";
	}
	
	@RequestMapping(value = "/admin/tutorListOne.do", method = RequestMethod.GET)
	public String tutorListOne(int no, String searchOption, String keyword, Model model) {
		log.info("call tutorListOne! - {} {}", no + "\n" + searchOption + "\n" + keyword);
		
		Map<String, Object> map = adminService.memberTutorSelectOne(no);
		
		MemberListDto memberListDto = (MemberListDto)map.get("memberListDto");
		
		List<Map<String, Object>> fileList = (List<Map<String, Object>>)map.get("fileList");
		
		model.addAttribute("memberListDto", memberListDto);
		model.addAttribute("fileList", fileList);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyword", keyword);
		
		
		return "admin/tutor/adminTutorInfo";
	}
	
	//회원 수정 화면으로
	@RequestMapping(value = "/admin/tutorUpdate.do", method = RequestMethod.GET)
	public String tutorUpdate(int no, Model model) {
		
		log.info("call memberUpdate! {}", no);
		System.out.println("왔다!");
		
		Map<String, Object> map = adminService.memberTutorSelectOne(no);
		
		MemberListDto memberListDto = (MemberListDto)map.get("memberListDto");
		
		List<Map<String, Object>> fileList = (List<Map<String, Object>>)map.get("fileList");
		
		model.addAttribute("memberListDto", memberListDto);
		
		model.addAttribute("fileList", fileList);
		
		return "admin/tutor/adminTutorInfoRevise";
	}
	
	//회원 수정 화면으로
		@RequestMapping(value = "/admin/tutorProUpdate.do", method = RequestMethod.GET)
		public String tutorProUpdate(int no, Model model) {
			
			log.info("call memberUpdate! {}", no);
			System.out.println("왔다!");
			
			Map<String, Object> map = adminService.memberTutorSelectOne(no);
			
			MemberListDto memberListDto = (MemberListDto)map.get("memberListDto");
			
			List<Map<String, Object>> fileList = (List<Map<String, Object>>)map.get("fileList");
			
			model.addAttribute("memberListDto", memberListDto);
			
			model.addAttribute("fileList", fileList);
			
			return "admin/tutor/adminTutorInfoProRevise";
		}
	
	//회원수정
			@RequestMapping(value = "/admin/tutorUpdateCtr.do", method = RequestMethod.POST)
			public String TutorUpdateCtr(HttpSession session, MemberListDto memberListDto,
										  @RequestParam(value="fileIdx", defaultValue = "-1") int fileIdx
										  ,MultipartHttpServletRequest multipartHttpServletRequest
										  , Model model) throws ParseException {
				
				log.info("call memberUpdateCtr! {} :: {}" + memberListDto, fileIdx);
				
			
				
				int resultNum = 0;
				
				try {
					// 설명하지 
					
					resultNum = adminService.memberTutorUpdateOne(memberListDto
							, multipartHttpServletRequest, fileIdx);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					System.out.println("updateone에 예외처리되나");
					e.printStackTrace();
				}
				
				if (resultNum != 0) {
					MemberDto sessionMemberDto = (MemberDto)session.getAttribute("member");
					
					if (sessionMemberDto != null) {
						
						if (sessionMemberDto.getMemberNo() == memberListDto.getNo()) {
							MemberListDto newMemberListDto = new MemberListDto(memberListDto.getNo(),memberListDto.getMember_name()
									,memberListDto.getMember_email(),memberListDto.getPassword(), memberListDto.getModifiedDate()
									,memberListDto.getBirthDate(),memberListDto.getCountry(),memberListDto.getGender());
							
							session.removeAttribute("member");
							
							session.setAttribute("member", newMemberListDto);
						}
						
					}
				}
				
				return "redirect:./tutorList.do";
			}
	
	//회원수정
		@RequestMapping(value = "/admin/tutorProUpdateCtr.do", method = RequestMethod.POST)
		public String TutorProUpdateCtr(HttpSession session, MemberListDto memberListDto,
									@RequestParam(value="fileIdx", defaultValue = "-1") int fileIdx
									,MultipartHttpServletRequest multipartHttpServletRequest
									, Model model) throws ParseException {
				
		log.info("call tutorProUpdateCtr! {} :: {}" + memberListDto, fileIdx);
		System.out.println("여기온다.");
		System.out.println(memberListDto.getNo());
		System.out.println(memberListDto.getUrl());
		System.out.println(memberListDto.getPrice());
		System.out.println(memberListDto.getTutorTitle());
		System.out.println(memberListDto.getTutorText());
		
		
			int resultNum = 0;
		try {
			// 설명하지 

			resultNum = adminService.TutorProfileUpdateOne(memberListDto
					, multipartHttpServletRequest, fileIdx);
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("updateone에 예외처리되나");
			e.printStackTrace();
		}
		
		if (resultNum != 0) {
			MemberDto sessionMemberDto = (MemberDto)session.getAttribute("member");
			
			if (sessionMemberDto != null) {
				
				if (sessionMemberDto.getMemberNo() == memberListDto.getNo()) {
					MemberListDto newMemberListDto = new MemberListDto(memberListDto.getNo(),memberListDto.getUrl(),
							memberListDto.getPrice(), memberListDto.getTutorTitle(), memberListDto.getTutorText());
					
					System.out.println("여기오나?");
					
					session.removeAttribute("member");
					
					session.setAttribute("member", newMemberListDto);
				}
				
			}
		}
		
		return "redirect:./tutorList.do";
	}
	//회원 탈퇴
		//회원삭제
	@RequestMapping(value = "/admin/studentDeleteCtr.do", method = RequestMethod.GET)
	public String studentDeleteCtr(int no, Model model) {
		
		log.info("call studentDeleteCtr! " + no);
		
//			Map<String, Object> tempFileMap = null; 
//			tempFileMap = memberService.fileSelectStoredFileName(no);
		
		adminService.studentDeleteOne(no);
		
		return "redirect:./studentList.do";
	}
	@RequestMapping(value = "/admin/tutorDeleteCtr.do", method = RequestMethod.GET)
	public String tutorDeleteCtr(int no, Model model) {
		
		log.info("call tutorDeleteCtr! " + no);
		
//			Map<String, Object> tempFileMap = null; 
//			tempFileMap = memberService.fileSelectStoredFileName(no);
		
		adminService.tutorInfoDeleteOne(no);
		adminService.tutorfileDeleteOne(no);
		adminService.tutorEvaluationDeleteOne(no);
		adminService.tutorMemberDeleteOne(no);
		
		return "redirect:./titorList.do";
	}

	
	//문의 리스트
		@RequestMapping(value = "/admin/questionList.do"
				, method = {RequestMethod.GET, RequestMethod.POST})
		public String QuestionList(@RequestParam(defaultValue = "1") 
				int curPage
				, @RequestParam(defaultValue = "0") int no
				, @RequestParam(defaultValue = "all") String searchOption
				, @RequestParam(defaultValue = "") String keyword
				, Model model) {
			log.info("Welcome questionList! " + curPage + " : " 
				+ searchOption + " : " + keyword);
			// 화면의 form의 이름을 마바티스에 편하게 맞추기 위한 로직
			
		
			
			// 페이징을 위한 전체 회원목록 갯수
			int totalCount = 
				adminService.questionSelectTotalCount(
					searchOption, keyword
				);
			
			
//			이전 체이지로 회원으이 번호가 명확하게 나온경우
//			자신의 curPage 찾는 로직
			if(no != 0) {
				curPage
					= adminService.questionSelectCurPage(searchOption, keyword, no);
			}
			
			
			mainPaging memberPaging = new mainPaging(totalCount, curPage);
			int start = memberPaging.getPageBegin();
			int end = memberPaging.getPageEnd();
			
			List<QuestionBoardDto> qusetionList = 
					adminService.questionSelectList(searchOption, keyword
					, start, end);

			// 화면의 form의 이름을 맞추기 위한 작업
			
			
			// 검색
			HashMap<String, Object> searchMap 
				= new HashMap<String, Object>();
			searchMap.put("searchOption", searchOption);
			searchMap.put("keyword", keyword);
			
			// 페이징
			Map<String, Object> pagingMap = new HashMap<>();
			pagingMap.put("totalCount", totalCount);
			pagingMap.put("memberPaging", memberPaging);

			model.addAttribute("qusetionList", qusetionList);
			model.addAttribute("pagingMap", pagingMap);
			model.addAttribute("searchMap", searchMap);
			
			System.out.println("@@@@@@@#################" + keyword);
			System.out.println("@@@@@@@#################" + searchOption);
			
			return "admin/qna/adminQnAList";
		}
		
		@RequestMapping(value = "/admin/questionListOne.do", method = RequestMethod.GET)
		public String questionListOne(int no, String searchOption, String keyword, Model model) {
			log.info("call questionListOne! - {} {}", no + "\n" + searchOption + "\n" + keyword);
			
			Map<String, Object> map = adminService.questionSelectOne(no);
			
			QuestionBoardDto questionBoardDto = (QuestionBoardDto)map.get("questionBoardDto");
			
//			List<Map<String, Object>> fileList = (List<Map<String, Object>>)map.get("fileList");
			
			model.addAttribute("questionBoardDto", questionBoardDto);
//			model.addAttribute("fileList", fileList);
			model.addAttribute("searchOption", searchOption);
			model.addAttribute("keyword", keyword);
			
			
			return "admin/qna/adminQnAReply";
		}
		
		@RequestMapping(value = "/admin/replyAddCtr.do", method = {RequestMethod.POST})
		public String memberAdd(QuestionBoardDto questionBoardDto, MultipartHttpServletRequest mulRequest, Model model) throws Exception {
			log.info("call memberAdd_ctr! {}", questionBoardDto);
			System.out.println("들어와");
			
			adminService.replyInsertOne(questionBoardDto, mulRequest);
			adminService.replyCheck(questionBoardDto, mulRequest);
			
			return "redirect:/admin/questionList.do";
		}

}
