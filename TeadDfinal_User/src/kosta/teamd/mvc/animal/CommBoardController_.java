package kosta.teamd.mvc.animal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kosta.teamd.mvc.dao.CommBoardDao;
import kosta.teamd.vo.CommBoardVO;

@Controller
public class CommBoardController_ {
	
	@Autowired
	private CommBoardDao cbdao;
	
	
	@RequestMapping(value="commInsert", method=RequestMethod.POST)
	public ModelAndView commInsert(CommBoardVO cbvo, int anino){
		
		System.out.println(cbvo.getBno());
		cbdao.commInsert(cbvo);
		ModelAndView mav = new ModelAndView("redirect:imgboarddetail");
		int bno = cbvo.getBno();
		System.out.println("bno(comm) : " + bno);
		mav.addObject("bno", bno);
		mav.addObject("anino", anino);
		return mav;
	}
	
	
	@RequestMapping(value="commDelete")
	public ModelAndView commdelete(int cbno, int anino, int bno){
		cbdao.commDelete(cbno);
		ModelAndView mav = new ModelAndView("redirect:imgboarddetail");
		mav.addObject("anino", anino);
		mav.addObject("bno", bno);
		return mav;
	}
	
}
