package nnS.shop.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import nnS.common.dao.AbstractDAO;

@Repository("shopDAO")
public class ShopDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectGoodsList(Map<String, Object> map) throws Exception {
		System.out.println(map);
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
	
	public void updateHitCnt(Map<String, Object> map) throws Exception{
		update("shop.updateHitCnt", map);
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectGoodsDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("shop.selectGoodsDetail", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> selectFileList(Map<String,Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("shop.selectFileList", map);
	}
	
	public void updateGoods(Map<String, Object> map) throws Exception{
		update("shop.updateGoods", map);
	}
	
	public void deleteGoods(Map<String, Object> map) throws Exception{
		update("shop.goodsDelete", map);
	}
	
}
