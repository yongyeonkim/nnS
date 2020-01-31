package nnS.report.service;

import java.util.List;
import java.util.Map;

public interface ReportService {
	
List<Map<String, Object>> selectMyReportList(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> selectReportList(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectReportDetail(Map<String, Object> map) throws Exception;

	
	void insertReportBoard(Map<String, Object> map)throws Exception;

	void deleteReport(Map<String, Object> map) throws Exception;

}
