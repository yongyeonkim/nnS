package nnS.shop.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface ShopService {
	
	List<Map<String, Object>> selectGoodsList(Map<String, Object> map) throws Exception;
	
	void insertGoods(Map<String, Object> map, HttpServletRequest request) throws Exception;

}
