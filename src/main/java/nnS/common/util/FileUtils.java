package nnS.common.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component("fileUtils")
public class FileUtils {
	private static final String filePath = "/Users/kyy/Documents/YongYeon/sts_jspProgramming/nnS/src/file/";
	
	public List<Map<String, Object>> parseInsertFileInfo(Map<String, Object> map, HttpServletRequest request) throws Exception{
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request; 
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames(); 
		
		MultipartFile multipartFile = null; 
		String originalFileName = null; 
		String originalFileExtension = null; 
		String storedFileName = null; 
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>(); 
		Map<String, Object> listMap = null; 
		String boardIdx = (String)map.get("IDX"); 
		File file = new File(filePath);
		
		if(file.exists() == false){ 
			System.out.println("2");
			file.mkdirs(); 
		} 
		
		
		while(iterator.hasNext()){ 
			System.out.println("3");
			multipartFile = multipartHttpServletRequest.getFile(iterator.next()); 
			
			if(multipartFile.isEmpty() == false){ 
				System.out.println("4");
				originalFileName = multipartFile.getOriginalFilename(); 
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf(".")); 
				storedFileName = CommonUtils.getRandomString() + originalFileExtension; 
				file = new File(filePath + storedFileName); 
				multipartFile.transferTo(file); 
				listMap = new HashMap<String,Object>(); 
				listMap.put("GOODS_IMAGE_PARENT", Integer.parseInt(boardIdx)); 
				listMap.put("GOODS_IMAGE_ORG", originalFileName); 
				listMap.put("GOODS_IMAGE_STD", storedFileName); 
				//listMap.put("FILE_SIZE", multipartFile.getSize()); 
				list.add(listMap); 
			}
		} 
		System.out.println("1234");
		return list; 
	}
	
	public List<Map<String, Object>> parseUpdateFileInfo(Map<String, Object> map, HttpServletRequest request) throws Exception{
		
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
				
				multipartFile.transferTo(new File(filePath + storedFileName)); 
				listMap = new HashMap<String,Object>(); 
				listMap.put("IS_NEW",  "Y");
				listMap.put("GOODS_IMAGE_PARENT", boardIdx); 
				listMap.put("GOODS_IMAGE_ORG", originalFileName); 
				listMap.put("GOODS_IMAGE_STD", storedFileName); 
				//listMap.put("FILE_SIZE", multipartFile.getSize()); 
				list.add(listMap); 
			}
			else {
				requestName = multipartFile.getName();
				idx = "IDX_"+requestName.substring(requestName.indexOf("_")+1); 
				if(map.containsKey(idx) == true && map.get(idx) != null){ 
					listMap = new HashMap<String,Object>(); 
					listMap.put("IS_NEW", "N"); 
					listMap.put("FILE_IDX", map.get(idx)); 
					list.add(listMap); 
				} 
			}
		} 
		return list; 
	}
}
