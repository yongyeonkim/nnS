package nnS.shop.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import nnS.shop.dao.ShopDAO;
import nnS.common.util.FileUtils;

@Service("shopService")
public class ShopServiceImpl implements ShopService {
	
	@Resource(name="shopDAO")
	private ShopDAO shopDAO;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Override
	public List<Map<String, Object>> selectGoodsList(Map<String, Object> map) throws Exception {
		return shopDAO.selectGoodsList(map);
	}
	
	@Override
	public void insertGoods(Map<String, Object> map, HttpServletRequest request) throws Exception {
		shopDAO.insertGoods(map);
		
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(map, request);
		for(int i = 0, size=list.size(); i < size; i++) {
			shopDAO.insertFile(list.get(i));
		}
		
		shopDAO.insertGoodsThumbnail(map);
		
		/*
		
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request; 
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames(); 
		MultipartFile multipartFile = null; 
		
		while(iterator.hasNext()){ multipartFile = multipartHttpServletRequest.getFile(iterator.next()); 
			if(multipartFile.isEmpty() == false){ log.debug("------------- file start -------------"); 
				log.debug("name : "+multipartFile.getName()); 
				log.debug("filename : "+multipartFile.getOriginalFilename()); 
				log.debug("size : "+multipartFile.getSize()); log.debug("-------------- file end --------------\n");
			}
		}

		*/
		
		
	}
	

}
