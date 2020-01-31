package nnS.qna.service;

import java.util.List;
import java.util.Map;

public interface QnaService {
	
	List<Map<String, Object>> selectMyQnaList(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectQnaList(Map<String, Object> map) throws Exception;
	
	void insertQnaBoard(Map<String, Object> map)throws Exception;

	Map<String, Object> selectQnaDetail(Map<String, Object> map) throws Exception;

	void updateQna(Map<String, Object> map) throws Exception;

	void deleteQna(Map<String, Object> map) throws Exception;

	void insertQnaAnswer(Map<String, Object> map) throws Exception;
	
   List<Map<String, Object>> selectQnaAnswer(Map<String, Object> map)throws Exception; 

	
}
