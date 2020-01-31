package nnS.shop.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface ShopService {
	
	List<Map<String, Object>> selectGoodsList(Map<String, Object> map, String keyword, String searchType) throws Exception;
	
	void insertGoods(Map<String, Object> map, HttpServletRequest request) throws Exception;

	Map<String, Object> selectGoodsDetail(Map<String, Object> map) throws Exception;
	
	void updateGoods(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	void deleteGoods(Map<String, Object> map) throws Exception;
	
}
