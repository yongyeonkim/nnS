package nnS.member.service;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import nnS.member.dao.LoginDAO;

@Service("loginService")
public class LoginServiceImpl implements LoginService{
	
	@Resource(name="loginDAO")
	private LoginDAO loginDAO;

	@Override
	public Map<String, Object> loginCheck(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return loginDAO.selectId(map);
	}

	@Override
	public Map<String, Object> findIdWithEmail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return loginDAO.findIdWithEmail(map);
	}

	@Override
	public Map<String, Object> findPwWithEmail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return loginDAO.findPwWithEmail(map);
	}

	@Override
	public void updateTempPw(Map<String,Object> map) throws Exception {
		// TODO Auto-generated method stub
		loginDAO.updateTempPw(map);
	}

}
