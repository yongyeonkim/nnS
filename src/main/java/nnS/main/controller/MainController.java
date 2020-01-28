package nnS.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import nnS.common.common.CommandMap;


@Controller
public class MainController {

	@RequestMapping(value="/main")
    public ModelAndView main(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/member/main/main");
    	
    	return mv; 
    }
}
		
		