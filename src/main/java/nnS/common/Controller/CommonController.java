package nnS.common.Controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import nnS.common.Service.CommonService;
import nnS.common.common.CommandMap;

@Controller
public class CommonController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="commonService")
	private CommonService commonService;
	
	@RequestMapping(value="/common/downloadFile")
	public void downloadFile(CommandMap commandMap, HttpServletRequest request ,HttpServletResponse response) throws Exception{
		Map<String, Object> map = commonService.selectFileInfo(commandMap.getMap());
		String storedFileName = (String)map.get("FILES_STDNAME");
		String originalFileName = (String)map.get("FILES_ORGNAME");
		
		String filePath_temp = request.getSession().getServletContext().getRealPath("") + "/file/"; //request.getContextPath() + "/file/";
		System.out.println(filePath_temp);
		byte fileByte[] = FileUtils.readFileToByteArray(new File(filePath_temp+storedFileName));
		
		response.setContentType("application/octet-strea");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition", "attachment; fileName=\""+URLEncoder.encode(originalFileName, "UTF-8")+"\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte);
		
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}
}
