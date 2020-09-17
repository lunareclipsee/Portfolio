package com.englishvillage.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.englishvillage.member.admin.model.MemberListDto;
import com.englishvillage.member.tutor.model.TutorDto;

@Component("fileUtils")
public class FileUtils {

	private static final String FILE_PATH = "D:\\upload";	
	
	public List<Map<String, Object>> parseInsertFileInfo(int no,
			MultipartHttpServletRequest multipartHttpServletRequest) 
				throws IllegalStateException, IOException{
		
		Iterator<String> iterator = 
			multipartHttpServletRequest.getFileNames();
		
		MultipartFile multipartFile = null;
		
		String original_File_Name = null;
		String originalFileExtension = null;
		String store_File_Name = null;
		
		List<Map<String, Object>> fileList = 
			new ArrayList<Map<String,Object>>();
		Map<String, Object> fileInfoMap = null;
		
		File file = new File(FILE_PATH);
		
		if(file.exists() == false) {
			file.mkdirs();
		}
		
		while(iterator.hasNext()) {
			multipartFile = 
				multipartHttpServletRequest.getFile(iterator.next());
			
			if(multipartFile.isEmpty() == false) {
				original_File_Name = multipartFile.getOriginalFilename();
				originalFileExtension = 
					original_File_Name.substring(
						original_File_Name.lastIndexOf("."));
				store_File_Name = CommonUtils.getRandomString() 
						+ originalFileExtension;
				 
				file = new File(FILE_PATH, store_File_Name);
				multipartFile.transferTo(file);
				
				fileInfoMap = new HashMap<String, Object>();
				fileInfoMap.put("no", no);
				fileInfoMap.put("original_File_Name", original_File_Name);
				fileInfoMap.put("store_File_Name", store_File_Name);
				fileInfoMap.put("file_size", multipartFile.getSize());
				
				fileList.add(fileInfoMap);
			}
			
		} // while end 
		
		
		return fileList;
	}

	
	
	
	public List<Map<String, Object>> parseInsertFileTutorInfo(int tutorNo,
			MultipartHttpServletRequest multipartHttpServletRequest) 
				throws IllegalStateException, IOException{
		
		Iterator<String> iterator = 
			multipartHttpServletRequest.getFileNames();
		
		MultipartFile multipartFile = null;
		
		String originalFileName = null;
		String originalFileExtension = null;
		String storeFileName = null;
		
		List<Map<String, Object>> fileList = 
			new ArrayList<Map<String,Object>>();
		Map<String, Object> fileInfoMap = null;
		
		File file = new File(FILE_PATH);
		
		if(file.exists() == false) {
			file.mkdirs();
		}
		
		while(iterator.hasNext()) {
			multipartFile = 
				multipartHttpServletRequest.getFile(iterator.next());
			
			if(multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = 
					originalFileName.substring(
						originalFileName.lastIndexOf("."));
				storeFileName = CommonUtils.getRandomString() 
						+ originalFileExtension;
				 
				file = new File(FILE_PATH, storeFileName);
				multipartFile.transferTo(file);
				
				fileInfoMap = new HashMap<String, Object>();
				fileInfoMap.put("tutorNo", tutorNo);
				fileInfoMap.put("originalFileName", originalFileName);
				fileInfoMap.put("storeFileName", storeFileName);
				fileInfoMap.put("fileSize", multipartFile.getSize());
				
				
				
				fileList.add(fileInfoMap);
			}
			
		} // while end 
		
		
		return fileList;
	}

	
	
	
	public void parseUpdateFileInfo(MemberListDto memberFileSave) 
		throws Exception{
		// TODO Auto-generated method stub
		
		String store_File_Name 
			= memberFileSave.getStore_File_Name();
		
		File file = new File(FILE_PATH + "/" + store_File_Name);
		
		if(file.exists()) {
			file.delete();
		}else {
			System.out.println("파일이 존재하지 않습니다.");
			throw new Exception();
		}
		
		
	}
	
	
	public void parseUpdateFileTutorInfo(TutorDto tutorDto) 
			throws Exception{
		// TODO Auto-generated method stub
		
		String storeFileName 
		= tutorDto.getStoreFileName();
		
		File file = new File(FILE_PATH + "/" + storeFileName);
		
		if(file.exists()) {
			file.delete();
		}else {
			System.out.println("파일이 존재하지 않습니다.");
			throw new Exception();
		}
		
		
	}
	
}
