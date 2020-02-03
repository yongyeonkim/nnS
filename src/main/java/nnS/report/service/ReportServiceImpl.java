package nnS.report.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import nnS.report.dao.ReportDAO;

@Service("reportService")
public class ReportServiceImpl implements ReportService {
Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="reportDAO")
	private ReportDAO reportDAO;
	
	@Override
	public List<Map<String, Object>> selectMyReportList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return reportDAO.selectMyReportList(map);
	}
	@Override
	public List<Map<String, Object>> selectReportList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return reportDAO.selectReportList(map);
	}
	@Override
	public void insertReportBoard(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		reportDAO.insertReportBoard(map);

}
	@Override
	public Map<String, Object> selectReportDetail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		reportDAO.updateReportCount(map);//조회수가 있었나?
		Map<String, Object> resultMap = reportDAO.selectReportDetail(map);
		
		return resultMap;
	}
	@Override
	public void deleteReport(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		reportDAO.deleteReport(map);
		
	}
}
