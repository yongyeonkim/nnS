package nnS.member.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import nnS.common.dao.AbstractDAO;

@Repository("loginDAO")
public class LoginDAO extends AbstractDAO{
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectId(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("login.selectId", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> findIdWithEmail(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("login.findIdWithPhone", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> findPwWithEmail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("login.findPwWithEmail", map);
	}

	public void updateTempPw(Map<String,Object> map) throws Exception {
		// TODO Auto-generated method stub
		update("login.updateTempPw",map);
	}

}
