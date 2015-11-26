package kosta.teamd.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageViewController {

	// 메인 페이지
	@RequestMapping(value={"/", "/index"})
	public String indexView() {
		return "index";
	}
	
	// 디나이 페이지
	@RequestMapping(value="/denied")
	public String deniedView() {
		return "denied";
	}
	
	@RequestMapping(value="/popup")
	public String popup(){
		return "checkpage/popup";
	}
}
