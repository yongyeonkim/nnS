package nnS.report.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import nnS.common.dao.AbstractDAO;

@Repository("reportDAO")
public class ReportDAO extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMyReportList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("report.selectMyReportList", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectReportList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("report.selectReportList", map);
	}
	public void insertReportBoard(Map<String, Object> map)throws Exception {//insertnotice
		// TODO Auto-generated method stub
		insert("report.insertReportBoard",map);
		
	}
	public void updateReportCount(Map<String, Object> map) throws Exception{//
		// TODO Auto-generated method stub
		update("report.updateReportCount",map);
		
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectReportDetail(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("report.selectReportDetail", map);

	}
	public void deleteReport(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		update("report.deleteReport",map);
		
	}
	

}
