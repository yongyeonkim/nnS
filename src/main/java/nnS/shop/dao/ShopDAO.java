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
	
	
}
