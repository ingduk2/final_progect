package kosta.teamd.mvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kosta.teamd.mvc.dao.SurveyDao;
import kosta.teamd.vo.SurveyLogVO;
import kosta.teamd.vo.SurveyVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SurveyController {

	@Autowired
	private SurveyDao sdao;

	@RequestMapping(value = "surveyUpdate", method = RequestMethod.POST)
	public ModelAndView surveyUpdate(SurveyVO v, HttpServletRequest request,
			SurveyLogVO sv) {
		String surip = request.getRemoteAddr();
		System.out.println(v.getSub1cnt());
		sv.setSurip(surip);
		sv.setSno(v.getNum());
		int check = sdao.ipCheck(sv);
		ModelAndView mav = new ModelAndView();
		if (check > 0) {
			System.out.println("중복 투표는 불가합니다");
			mav.setViewName("checkpage/duplicate");// 1207
		} else {
			System.out.println("헤헷");
			mav.setViewName("checkpage/surveyDone");
			sdao.insert(sv);// 1207
			sdao.surveyUpdate(v);
		}

		return mav;
	}

	@RequestMapping(value = "surveyDetail")
	public ModelAndView surveyDetail(int num) {
		SurveyVO v = sdao.getDetail(num);
		ModelAndView mav = new ModelAndView();
		mav.addObject("v", v);
		mav.setViewName("surveyDetail");
		return mav;
	}

}
