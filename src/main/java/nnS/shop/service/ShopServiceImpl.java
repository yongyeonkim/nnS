package nnS.shop.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import nnS.shop.dao.ShopDAO;

@Service("shopService")
public class ShopServiceImpl implements ShopService {
	
	@Resource(name="shopDAO")
	private ShopDAO shopDAO;
	
	@Override
	public List<Map<String, Object>> selectGoodsList(Map<String, Object> map) throws Exception {
		return shopDAO.selectGoodsList(map);
	}
	

}
