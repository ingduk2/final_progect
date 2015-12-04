package kosta.teamd.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChatController {
	
	@RequestMapping(value="formChat")
	public ModelAndView formChat(){
		ModelAndView mav= new ModelAndView();
		
		return mav;
	}
}
