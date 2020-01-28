package nnS.member.service;

import java.util.Map;

public interface LoginService {

	public Map<String, Object> loginCheck(Map<String, Object> map) throws Exception;

	public Map<String, Object> findIdWithEmail(Map<String, Object> map) throws Exception;

	public Map<String, Object> findPwWithEmail(Map<String, Object> map) throws Exception;

	public void updateTempPw(Map<String,Object> map) throws Exception;

}
