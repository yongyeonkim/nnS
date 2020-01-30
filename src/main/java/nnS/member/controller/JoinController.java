package nnS.member.controller;

import java.io.UnsupportedEncodingException;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.mail.MessagingException;
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
import nnS.member.service.JoinService;
import nnS.member.service.MailService;


@Controller
public class JoinController {
	Logger log = Logger.getLogger(this.getClass());
   
   @Resource(name="mailService")
   private MailService mailService;
   
   @Resource(name="joinService")
   private JoinService joinService;

   @RequestMapping(value = "/joinForm") //회원가입 폼 
   public ModelAndView joinForm(CommandMap commandMap) throws Exception {
      
      ModelAndView mv = new ModelAndView("member/join/joinForm");
      return mv;
   }
   
   @RequestMapping(value = "/join/idCheck") //아이디 중복확인
   public @ResponseBody String idCheck(CommandMap commandMap) throws Exception {
      
      System.out.println(commandMap.getMap());
      
      String idCheck = String.valueOf(joinService.selectIdCheck(commandMap.getMap()));
      
      System.out.println(idCheck);
      
      return idCheck;
   }
   
   /*
    * @RequestMapping(value = "/nnS//join/emailAuth", method = RequestMethod.POST)
    * //회원가입 할 경우 해당 이메일 인증을 요구하는 링크를 첨부한 이메일을 발송 public ModelAndView
    * emailAuth(CommandMap commandMap, HttpServletRequest request) throws Exception
    * { ModelAndView mv = new ModelAndView("member/join/joinConfirm"); //mybatis로
    * inserMeber() 기능 처리 및 해당 이메일로 이메일 발송
    * 
    * return mv; }
    */
   
   @RequestMapping(value = "/join/emailAuth")
   public ModelAndView emailAuth() { //이메일인증발송
      ModelAndView mv = new ModelAndView();
      int ran = new Random().nextInt(900000)+100000;
      mv.setViewName("member/join/joinConfirm");
      mv.addObject("random", ran);
      return mv;
   }
   
   /*
    * @RequestMapping(value = "/memberVerify", method = RequestMethod.GET) //member
    * table에 verfiy컬럼의 값을 바꿔준다. public ModelAndView join(CommandMap commandMap)
    * throws Exception { //이메일 인증기능 처리 ModelAndView mv = new
    * ModelAndView("member/join/welcome");
    * 
    * return mv; }
    */
   
   @RequestMapping(value="/createEmailCheck", method=RequestMethod.GET)
   @ResponseBody
   public boolean createEmailCheck(@RequestParam String userEmail, @RequestParam int random, HttpServletRequest req){
   //이메일 인증
   int ran = new Random().nextInt(900000) + 100000;
   HttpSession session = req.getSession(true);
   String authCode = String.valueOf(ran);
   session.setAttribute("authCode", authCode);
   session.setAttribute("random", random);
   String subject = "회원가입 인증 코드 발급 안내 입니다.";
   StringBuilder sb = new StringBuilder();
   sb.append("귀하의 인증 코드는 " + authCode + "입니다.");
   return mailService.send(subject, sb.toString(), "gksn9573@gmail.com", userEmail, null);
   }
   
   @RequestMapping(value="/emailAuth", method=RequestMethod.GET)
   @ResponseBody
   public ResponseEntity<String> emailAuth(@RequestParam String authCode, @RequestParam String random, HttpSession session){
   String originalJoinCode = (String) session.getAttribute("authCode");
   String originalRandom = Integer.toString((Integer) session.getAttribute("random"));
   if(originalJoinCode.equals(authCode) && originalRandom.equals(random))
   return new ResponseEntity<String>("complete", HttpStatus.OK);
   else return new ResponseEntity<String>("false", HttpStatus.OK);
   }



   
}