package nnS.notice.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import nnS.common.dao.AbstractDAO;

@Repository("NoticeDAO")
public class NoticeDAO extends AbstractDAO {

	// 공지사항 리스트(페이징)
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectNoticeList(Map<String, Object> map) throws Exception{
		return (List<Map<String,Object>>)selectPagingList("notice.selectNoticeList", map);
	}
	
	// 공지사항 상세보기
	public Map<String,Object> selectNoticeDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("notice.selectNoticeDetail", map);
	}
	
	// 공지사항 작성
	public void insertNotice(Map<String, Object> map) throws Exception{
		insert("notice.insertNotice", map);
	}
	
	// 공지사항 수정
	public void updateNoticeModify(Map<String, Object> map) throws Exception{
		update("notice.updateNoticeModify", map);
	}
	
	// 공지사항 삭제
	public void deleteNotice(Map<String, Object> map) throws Exception{
		update("notice.deleteNotice", map);
	}
}
