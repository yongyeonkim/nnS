package nnS.shop.service;

import java.util.List;
import java.util.Map;

public interface ShopService {
	
	List<Map<String, Object>> selectGoodsList(Map<String, Object> map) throws Exception;

}
