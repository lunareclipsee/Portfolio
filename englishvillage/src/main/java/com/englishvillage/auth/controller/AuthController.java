package com.englishvillage.auth.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.englishvillage.auth.model.MemberDto;
import com.englishvillage.auth.service.AuthService;
import com.englishvillage.member.tutor.model.TutorDto;
import com.englishvillage.member.tutor.service.TutorService;

@Controller
public class AuthController {

	private static final Logger log = LoggerFactory.getLogger(AuthController.class);
	
	@Autowired
	private AuthService authService;
	
	@Autowired
	private TutorService tutorService;
	
	@Autowired
	private JavaMailSender mailSender;
	  
	@RequestMapping(value="/auth/login.do", method=RequestMethod.GET)
	public String login() {
		log.info("*****Welcome Login!*****");
		
		return "auth/login";
	}
	
	@RequestMapping(value="/auth/loginCtr.do", method=RequestMethod.POST)
	public String loginCtr(String memberEmail, String memberPassword, HttpSession session, Model model) {
		log.info("*****Welcome LoginCtr!*****" + memberEmail + "," + memberPassword);
		
		String viewUrl = "";
		MemberDto memberDto = authService.memberExist(memberEmail, memberPassword);
		
		if(memberDto != null) {
			session.setAttribute("member", memberDto);
			TutorDto tutorDto = tutorService.getTutorInfo(memberDto.getMemberNo());
			session.setAttribute("tutor", tutorDto);
			
			System.out.println(memberDto.getMemberGrade());
			System.out.println(memberDto.getMemberGrade());
			System.out.println(memberDto.getMemberGrade());
			System.out.println(memberDto.getMemberGrade());
			System.out.println(memberDto.getMemberGrade());
			if(memberDto.getMemberGrade().equals("A")) {
				System.out.println("들어와???");
				viewUrl = "redirect:/admin/studentList.do";
			} else {
				viewUrl = "redirect:/tutor/home.do";
			}
			
		} else {
			viewUrl = "redirect:/auth/loginError.do";
		}
		
		return viewUrl;
	}

	@RequestMapping(value="/auth/loginError.do", method=RequestMethod.GET)
	public String loginError(Model model){
		log.info("*****Welcome loginError!*****");
		
		return "auth/loginError";
	}
	
	@RequestMapping(value="/auth/logout.do", method=RequestMethod.GET)
	public String logout(HttpSession session, Model model){
		log.info("*****Welcome Logout!*****");
		
		session.invalidate();
		
		return "redirect:/auth/login.do";
	}
	
	@RequestMapping(value="/auth/commonRegister.do", method=RequestMethod.GET)
	public String commonRegister(Model model) {
		log.info("*****Welcome Register!*****");
		
		return "auth/commonRegister";
	}
	 
	@RequestMapping(value="/auth/commonRegisterCtr.do", method={RequestMethod.POST, RequestMethod.GET})
	public String commonRegisterCtr(MemberDto memberDto, String birthDate, Model model) throws ParseException {
		log.info("*****commonRegister_ctr!*****"+ memberDto); 
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date parseDate = simpleDateFormat.parse(birthDate);
		memberDto.setMemberBirthDate(parseDate);
//		서비스에 있으면 컨트롤러에서 호출 (자주 사용한다면)
		
		String viewUrl = "";
		
		try {
			authService.memberInsertOne(memberDto);
			viewUrl = "redirect:/auth/commonRegisterComplete.do";
		} catch (Exception e) {
			// TODO: handle exception
			
			viewUrl = "redirect:/auth/commonRegisterError.do";
		}

		return viewUrl;
	} 
	
	@RequestMapping(value="/auth/commonRegisterError.do", method=RequestMethod.GET)
	public String commonRegisterError(Model model) {
		log.info("*****commonRegisterError!*****"); 
		
		return "auth/commonRegisterError";
		
	} 
	
	@RequestMapping(value="/commonRegisterComplete.do", method=RequestMethod.GET)
	public String commonRegisterComplete() {
		log.info("*****Welcome CommonRegisterComplete!*****");
		
		return "auth/commonRegisterComplete";
	} 
	
	@RequestMapping(value="/auth/findPassword.do", method=RequestMethod.GET)
	public String findPassword() {
		log.info("*****Welcome findPassword!*****");
		
		return "auth/findPassword";
	} 
	
	@RequestMapping(value="/auth/findPasswordCtr.do", method=RequestMethod.POST)
	public String findPasswordCtr(String memberName, String memberEmail, 
			String memberBirthDate, HttpSession session, Model model) throws Exception {
		log.info("*****Welcome findPasswordCtr!*****");
		System.out.println(memberName + memberEmail + memberBirthDate );
		
		String viewUrl = "";
		MemberDto memberDto = authService.memberFindPassword(memberName, memberEmail, memberBirthDate);
		
		session.setAttribute("memberDto", memberDto);
		if(memberDto != null) {
			viewUrl = "redirect:/auth/authSendMailFindPwdCtr.do";
			
		} else {
			viewUrl = "redirect:/auth/findPasswordError.do";
		}
		return viewUrl;
	} 
	
	@RequestMapping(value="/auth/findPasswordError.do", method=RequestMethod.GET)
	public String findPasswordError(Model model) {
		log.info("*****Welcome findPasswordError!*****");
		
		return "auth/findPasswordError";
	} 
	
	@RequestMapping(value="/auth/findPasswordComplete.do", method=RequestMethod.GET)
	public String findPasswordComplete( Model model, HttpSession session) {
		log.info("*****Welcome findPasswordComplete!*****");
		MemberDto memberDto = (MemberDto)session.getAttribute("memberDto");
		
		session.invalidate();
		
		model.addAttribute("memberDto", memberDto);
		
		return "auth/findPasswordComplete";
	} 
	
	// mailSending 인증번호 발송 코드
	  @RequestMapping(value = "/auth/authSendMailVerifyNumCtr.do", method=RequestMethod.POST)
	  public String verifyNumMailSending(HttpServletRequest request, String memberEmail, int verifyNum
			  ,@RequestParam(defaultValue = "") String title
			  ,@RequestParam(defaultValue ="") String content) {
	   
		
	    String setfrom = "javacatch5@gmail.com";

	    	title = "회원가입 인증번호 입니다.";
	    	content = "회원가입 인증번호는 "+ verifyNum + " 입니다.";
	    	
	    try {
	      MimeMessage message = mailSender.createMimeMessage();
	      MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	 
	      messageHelper.setFrom(setfrom);
	      messageHelper.setTo(memberEmail);
	      messageHelper.setSubject(title); 
	      messageHelper.setText(content);
	     
	      mailSender.send(message);
	      
	    } catch(Exception e){
	      System.out.println(e);

	    }
	   
	    return "redirect:/auth/mailCtr";
	    
	  }
	
	// mailSending 비밀번호 발송 코드
	@RequestMapping(value = "/auth/authSendMailFindPwdCtr.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String findPwdMailSending(HttpSession session
			  ,@RequestParam(defaultValue = "") String title
			  ,@RequestParam(defaultValue ="") String content) {
		
		MemberDto memberDto = (MemberDto) session.getAttribute("memberDto");
				
	    String setfrom = "javacatch5@gmail.com";
	    
	    	title = "비밀번호 찾기의 비밀번호 입니다.";
	    	content = "비밀번호는 "+ memberDto.getMemberPassword() + " 입니다.";
	    	
	    try {
	      MimeMessage message = mailSender.createMimeMessage();
	      MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

	      messageHelper.setFrom(setfrom);
	      messageHelper.setTo(memberDto.getMemberEmail());
	      messageHelper.setSubject(title); 
	      messageHelper.setText(content);
		    
	      mailSender.send(message);
		    
	    } catch(Exception e){
	      System.out.println(e);
	    }
	   
	    return "redirect:/auth/findPasswordComplete.do";
	  }
	
//	이메일 중복 체크
	@ResponseBody
	@RequestMapping(value="/auth/emailCheck.do", method=RequestMethod.POST)
	public int emailCheck(MemberDto memberDto) throws Exception {
		
		int result = authService.emailCheck(memberDto);
		
		return result;
	}
	
}
