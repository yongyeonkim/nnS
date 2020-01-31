package nnS.common.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component("fileUtils")
public class FileUtils {
	//private static final String filePath = "/Users/kyy/Documents/YongYeon/sts_jspProgramming/nnS/src/file/";
	
	public List<Map<String, Object>> parseInsertFileInfo(Map<String, Object> map, HttpServletRequest request) throws Exception{
		String filePath_temp = request.getSession().getServletContext().getRealPath("") + "/file/"; //request.getContextPath() + "/file/";
		System.out.println(filePath_temp);
		
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request; 
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames(); 
		
		MultipartFile multipartFile = null; 
		String originalFileName = null; 
		String originalFileExtension = null; 
		String storedFileName = null; 
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>(); 
		Map<String, Object> listMap = null; 
		String boardIdx = (String)map.get("IDX"); 
		File file = new File(filePath_temp);
		
		if(file.exists() == false){ 
			file.mkdirs(); 
		} 
		
		
		while(iterator.hasNext()){ 
			multipartFile = multipartHttpServletRequest.getFile(iterator.next()); 
			
			if(multipartFile.isEmpty() == false){
				originalFileName = multipartFile.getOriginalFilename(); 
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf(".")); 
				storedFileName = CommonUtils.getRandomString() + originalFileExtension; 
				file = new File(filePath_temp + storedFileName); 
				multipartFile.transferTo(file); 
				listMap = new HashMap<String,Object>();
				listMap.put("BOARD_IDX", Integer.parseInt(boardIdx)); 
				listMap.put("FILES_ORG", originalFileName); 
				listMap.put("FILES_STD", storedFileName); 
				listMap.put("FILES_SIZE", multipartFile.getSize()); 
				list.add(listMap); 
			}
		} 
		return list; 
	}
	
	public List<Map<String, Object>> parseUpdateFileInfo(Map<String, Object> map, HttpServletRequest request) throws Exception{
		String filePath_temp = request.getSession().getServletContext().getRealPath("") + "/file/"; //request.getContextPath() + "/file/";
		System.out.println(filePath_temp);
		
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request; 
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		
		MultipartFile multipartFile = null; 
		String originalFileName = null; 
		String originalFileExtension = null; 
		String storedFileName = null;
		
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>(); 
		Map<String, Object> listMap = null; 
		
		String boardIdx = (String)map.get("IDX"); 
		String requestName = null;
		String idx = null;
		
		while(iterator.hasNext()){ 
			multipartFile = multipartHttpServletRequest.getFile(iterator.next()); 
			
			if(multipartFile.isEmpty() == false){ 
				originalFileName = multipartFile.getOriginalFilename(); 
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf(".")); 
				storedFileName = CommonUtils.getRandomString() + originalFileExtension; 
				
				multipartFile.transferTo(new File(filePath_temp + storedFileName)); 
				listMap = new HashMap<String,Object>(); 
				listMap.put("IS_NEW",  "Y");
				listMap.put("BOARD_IDX", Integer.parseInt(boardIdx)); 
				listMap.put("FILES_ORG", originalFileName); 
				listMap.put("FILES_STD", storedFileName); 
				listMap.put("FILE_SIZE", multipartFile.getSize()); 
				list.add(listMap); 
			}
			else {
				System.out.println("**********!*!*!*!*!*!*!***********!*!*!*!*!*!*!***********!*!*!*!*!*!*!***********!*!*!*!*!*!*!*");
				requestName = multipartFile.getName();
				idx = "IDX_"+requestName.substring(requestName.indexOf("_")+1); 
				if(map.containsKey(idx) == true && map.get(idx) != null){ 
					listMap = new HashMap<String,Object>(); 
					listMap.put("IS_NEW", "N"); 
					listMap.put("FILE_IDX", Integer.parseInt((String)map.get(idx))); 
					list.add(listMap); 
				} 
			}
		} 
		return list; 
	}
}
