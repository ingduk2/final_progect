package kosta.teamd.mvc.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kosta.teamd.mvc.dao.CommBoardDao;
import kosta.teamd.vo.CommBoardVO;

@Controller
public class CommBoardController {

	@Autowired
	private CommBoardDao cbdao;
	
	@RequestMapping(value="/insertComm", method=RequestMethod.POST)
	public ModelAndView insertComm(CommBoardVO cbvo, String orimid, Principal prcp){
		System.out.println(cbvo.getBno()+"이당당당");
		ModelAndView mav=new ModelAndView("redirect:/selectoneBoard?bno="+cbvo.getBno()+"&mid="+orimid);
		
		cbvo.setMid(prcp.getName());
		cbdao.insertCommBoard(cbvo);
		return mav;
	}
	
	@RequestMapping(value="deleteComm")
	public ModelAndView deleteComm(int cbno, int bno, String mid){
		cbdao.deleteComm(cbno);
		return new ModelAndView("redirect:/selectoneBoard?bno="+bno+"&mid="+mid);
	}
	
}
