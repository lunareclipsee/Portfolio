package com.englishvillage.error.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ErrorController {

	private static final Logger log = 
		LoggerFactory.getLogger(ErrorController.class);
	
	@RequestMapping(value="/error/404.do", method=RequestMethod.GET)
	public String error404Exeption() {
		log.info("*****Welcome Login!*****");
		
		return "error/error404Exeption";
	}

	@RequestMapping(value="/error/500.do", method=RequestMethod.GET)
	public String error500Exeption() {
		log.info("*****Welcome Login!*****");
		
		return "error/error500Exeption";
	}
	
	
	@RequestMapping(value="/error/400.do", method=RequestMethod.GET)
	public String error400Exeption() {
		log.info("*****Welcome Login!*****");
		
		return "error/error400Exeption";
	}
	
}
