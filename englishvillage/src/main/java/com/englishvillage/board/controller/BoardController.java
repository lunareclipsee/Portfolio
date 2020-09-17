package com.englishvillage.board.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.englishvillage.board.service.BoardService;

@Controller
public class BoardController {

	private static final Logger log = 
		LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService boardService;

}
