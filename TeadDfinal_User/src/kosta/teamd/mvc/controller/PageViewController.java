package kosta.teamd.mvc.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PageViewController {

	// 메인 페이지
	@RequestMapping(value={"/", "/index"})
	public String indexView() {
		return "index";
	}
	
	// 회원 가입 페이지
	@RequestMapping(value="/join")
	public String joinFormView() {
		return "member/join";
	}
	
	// 로그인 페이지
	@RequestMapping(value="/login")
	public String loginFormView(HttpServletRequest request) {
		return "member/login";
	}
	
	// 디나이 페이지
	@RequestMapping(value="/denied")
	public String deniedView() {
		return "denied";
	}
	
	//-------------------------------------
	@RequestMapping(value="/update")
	public String updateFormView() {
		return "member/update";
	}
	
	
}
