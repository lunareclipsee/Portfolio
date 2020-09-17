package com.englishvillage.board.service;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.englishvillage.board.dao.BoardDao;
import com.englishvillage.util.FileUtils;

@Service
public class BoardServiceImpl implements BoardService{

	private static final Logger log = 
			LoggerFactory.getLogger(BoardServiceImpl.class);
	
	@Autowired
	public BoardDao boardDao;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	
}
