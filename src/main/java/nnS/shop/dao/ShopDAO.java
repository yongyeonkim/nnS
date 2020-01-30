package nnS.shop.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import nnS.common.dao.AbstractDAO;

@Repository("shopDAO")
public class ShopDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectGoodsList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectPagingList("shop.selectGoodsList", map);
	}

	public void insertGoods(Map<String, Object> map) throws Exception{
		insert("shop.insertGoods", map);
	}
	
	public void insertFile(Map<String, Object> map) throws Exception{
		insert("shop.insertFile", map);
	}
	
	public void insertGoodsThumbnail(Map<String, Object> map) throws Exception{
		update("shop.updateGoodsThumbnail", map);
	}
	
	
}
