package nnS.qna.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import nnS.qna.dao.QnaDAO;

@Service("qnaService")
public class QnaServiceImpl implements QnaService{
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="qnaDAO")
	private QnaDAO qnaDAO;
	
	@Override
	public List<Map<String, Object>> selectMyQnaList(Map<String, Object> map) throws Exception {//내 글보기
		// TODO Auto-generated method stub
		return qnaDAO.selectMyQnaList(map);
	}
	@Override
	public List<Map<String, Object>> selectQnaList(Map<String, Object> map) throws Exception {//게시글 전체보기
		// TODO Auto-generated method stub
		return qnaDAO.selectQnaList(map);
	}
	@Override
	public void insertQnaBoard(Map<String, Object> map) throws Exception {//글쓰기
		// TODO Auto-generated method stub
		qnaDAO.insertQnaBoard(map);
		
	}

	@Override
	public Map<String, Object> selectQnaDetail(Map<String, Object> map) throws Exception {//상세보기
		// TODO Auto-generated method stub
	    qnaDAO.updateQnaCount(map); 
		Map<String, Object> resultMap = qnaDAO.selectQnaDetail(map);
		
		return resultMap;

	}

	@Override
	public void updateQna(Map<String, Object> map) throws Exception {//수정하기
		// TODO Auto-generated method stub
		qnaDAO.updateQnaModify(map);
		
	}

	@Override
	public void deleteQna(Map<String, Object> map) throws Exception {//삭제하기
		// TODO Auto-generated method stub
		qnaDAO.deleteQna(map);
		
	}
	@Override
	public void insertQnaAnswer(Map<String, Object> map) throws Exception{//답변달기
		// TODO Auto-generated method stub
		qnaDAO.insertQnaAnswer(map);
		
	}
	@Override
	public List<Map<String, Object>> selectQnaAnswer(Map<String, Object> map)throws Exception {
		// TODO Auto-generated method stub
		return qnaDAO.selectQnaAnswer(map);
	}

	

}
