package nnS.qna.dao;

import nnS.common.dao.AbstractDAO;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("qnaDAO")
public class QnaDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMyQnaList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("qna.selectMyQnaList", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectQnaList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("qna.selectQnaList", map);
	}

	public void insertQnaBoard(Map<String, Object> map) throws Exception{//
		// TODO Auto-generated method stub
		insert("qna.insertQnaBoard",map);
		
	}

	
	  public void updateQnaCount(Map<String, Object> map)throws Exception {//조회수 증가
	  // TODO Auto-generated method stub 
	  update("qna.updateQnaCount",map);
	  
	  }
	 
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectQnaDetail(Map<String, Object> map)throws Exception {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("qna.selectQnaDetail", map);

	}
	public void updateQnaModify(Map<String, Object> map)throws Exception {
		// TODO Auto-generated method stub
		update("qna.updateQnaModify",map);
		
	}
	public void deleteQna(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		update("qna.deleteQna",map);
		
	}
	public void insertQnaAnswer(Map<String, Object> map)throws Exception {
		// TODO Auto-generated method stub
		insert("qna.insertQnaAnswer",map);
		
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectQnaAnswer(Map<String, Object> map)throws Exception {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectList("qna.selectQnaAnswer", map);
	}
	

}
