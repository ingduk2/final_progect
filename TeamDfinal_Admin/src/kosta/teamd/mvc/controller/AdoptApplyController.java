package kosta.teamd.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kosta.teamd.mvc.dao.AdoptApplyDao;
import kosta.teamd.vo.AdoptApplyVO;

@Controller
public class AdoptApplyController {
	
	@Autowired
	private AdoptApplyDao adadao;
	
	@RequestMapping(value="selectallAdopt")
	public ModelAndView selectallAdopt(){
		ModelAndView mav= new ModelAndView("adoptboard");
		
		List<AdoptApplyVO> list= adadao.selectallAdopt();
		
		mav.addObject("list",list);
		return mav;
		
	}
}
