package nnS.notice.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import nnS.notice.dao.NoticeDAO;;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="NoticeDAO")
	private NoticeDAO noticeDAO;

	@Override
	public List<Map<String, Object>> selectNoticeList(Map<String, Object> map) throws Exception {
		return noticeDAO.selectNoticeList(map);
	}

	@Override
	public Map<String, Object> selectNoticeDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = noticeDAO.selectNoticeDetail(map);
		return resultMap;
	}

	@Override
	public void insertNoticeWrite(Map<String, Object> map) throws Exception {
		noticeDAO.insertNotice(map);
	}

	@Override
	public void updateNoticeModify(Map<String, Object> map) throws Exception {
		noticeDAO.updateNoticeModify(map);
	}

	@Override
	public void deleteNotice(Map<String, Object> map) throws Exception {
		noticeDAO.deleteNotice(map);
	}
}
