package kosta.teamd.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NewsController {
	
	@RequestMapping(value="/news")
	public ModelAndView formNews(int num){
		ModelAndView mav= new ModelAndView("news/news");
		mav.addObject("num",num);
		return mav;
	}
}
