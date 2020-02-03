package nnS.member.controller;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import nnS.common.common.MailHandler;
import nnS.common.common.CommandMap;
import nnS.member.service.LoginService;
import nnS.member.service.MailService;

@Controller
public class LoginController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="mailService")
	private MailService mailService;

	@Resource(name = "loginService")
	private LoginService loginService;
	
	@Inject
	private JavaMailSender mailSender;

	// @Resource(name = "mailSender")
	// private JavaMailSender mailSender;

	@RequestMapping(value = "/loginForm") // 로그인 폼
	public ModelAndView loginForm() throws Exception {
		ModelAndView mv = new ModelAndView("loginForm");
		return mv;
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST) // 로그인
	public ModelAndView login(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/member/login/login");
		String message = "";
		String url = "";

		HttpSession session = request.getSession();

		
		Map<String, Object> chk = loginService.loginCheck(commandMap.getMap());
		//Map<String, Object> banChk = adminBanService.banDateCheck(commandMap.getMap());
		if (chk==null) { // 아이디가 있는지 없는지를 확인
			message = "해당 아이디가 존재하지 않습니다.";
		} else {
			if (chk.get("MEM_PW").equals(commandMap.get("MEM_PW"))) {
				session.setAttribute("session_MEM_ID", commandMap.get("MEM_ID"));
			} else { // 비밀번호가 일치하지 않을 때
				message = "비밀번호가 맞지 않습니다.";
			}
		}
		mv.addObject("message",message);
		mv.addObject("url",url);
		 
		return mv;
	}

	@RequestMapping(value = "/logout") // 로그아웃
	public ModelAndView logout(HttpServletRequest request, CommandMap commandMap) throws Exception {
		HttpSession session = request.getSession(false);
		if (session != null)
			session.invalidate();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/main");
		return mv;
	}

	@RequestMapping(value = "/findId") // 아이디 찾기 폼을 보여주는 메소드
	public ModelAndView findId(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("findAccount");
		return mv;
	}

	@RequestMapping(value = "/findIdResult", method = RequestMethod.POST) // 입력한 정보에 맞춰서 아이디를 찾아주는 거
	public ModelAndView findIdResult(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/member/login/findIdResult");
		Map<String, Object> map = loginService.findIdWithEmail(commandMap.getMap());
		mv.addObject("id", map);
		return mv;
	}
	
	

	@RequestMapping(value = "/findPw") // 비밀번호 찾기 폼을 보여주는 메소드
	public ModelAndView findPw(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/member/login/findAccount");
		return mv;
	}
	
	@RequestMapping(value = "/findPwResult") //비밀번호 찾기
	public @ResponseBody String findPwResult(CommandMap commandMap) throws Exception {
		
		System.out.println(commandMap.getMap());
		
	    	String mv = String.valueOf(loginService.findPwWithEmail(commandMap.getMap()));

		System.out.println(mv);
		
		return mv;
	}
	
	@RequestMapping(value = "/passwordEmail" ,method=RequestMethod.GET)
	   @ResponseBody
	   public boolean createEmailAuth(@RequestParam String userEmail, @RequestParam int random, HttpServletRequest req) {
		
	    //이메일 인증
	      int ran = new Random().nextInt(900000) + 100000;
	      HttpSession session = req.getSession(true);
	      String authCode = String.valueOf(ran);
	      session.setAttribute("authCode", authCode);
	      session.setAttribute("random", random);
	      String subject = "임시 비밀번호 발급 안내 입니다.";
	      StringBuilder sb = new StringBuilder();
	      sb.append("귀하의 임시 비밀번호는 " + authCode + " 입니다.");
	      return mailService.send(subject, sb.toString(),"cwjjgl183@gmail.com", userEmail, null);
	   }
	
	@RequestMapping(value="/passwordAuth", method=RequestMethod.GET)//인증번호확인
	   @ResponseBody
	   public ResponseEntity<String> emailConfirm(@RequestParam String authCode, @RequestParam String random, HttpSession session){
	      String originalJoinCode = (String) session.getAttribute("authCode");
	      String originalRandom = Integer.toString((Integer) session.getAttribute("random"));
	      if(originalJoinCode.equals(authCode) && originalRandom.equals(random)) 
	       
	         return new ResponseEntity<String>("complete", HttpStatus.OK);   
	      
	      else return new ResponseEntity<String>("false", HttpStatus.OK);
	   }
	
	 @RequestMapping(value = "/emailAuth", method = RequestMethod.GET) 
	   public ModelAndView join(CommandMap commandMap) throws Exception { //이메일 인증기능 처리
	     ModelAndView mv = new ModelAndView("member/join/welcome");
	     
	     return mv; 
	   }

}
