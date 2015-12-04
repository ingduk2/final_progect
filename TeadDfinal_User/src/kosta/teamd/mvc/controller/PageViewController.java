package kosta.teamd.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kosta.teamd.mvc.dao.BoardDao;
import kosta.teamd.mvc.dao.SurveyDao;
import kosta.teamd.vo.BoardVO;
import kosta.teamd.vo.SurveyVO;

@Controller
public class PageViewController {

	@Autowired
	private BoardDao bdao;
	@Autowired
	private SurveyDao sdao;
	
	@RequestMapping(value={"/", "/index"})
	public ModelAndView fromIndex(){
		System.out.println("lol1");
		List<BoardVO> minilist=bdao.mainMiniBoard();
		System.out.println(minilist.size());
		List<BoardVO> minilist2=bdao.mainMiniBoard2();
		System.out.println(minilist2.size());
		ModelAndView mav=new ModelAndView("index");
		System.out.println("lol2");
		mav.addObject("minilist", minilist);
		mav.addObject("minilist2", minilist2);
		return mav;
	}
	
	// 디나이 페이지
	@RequestMapping(value="/denied")
	public String formDenied() {
		return "denied";
	}
	
	//popup용 페이지들
	@RequestMapping(value="/popup")
//	public String popup(){ //원래는 요 모양인데  모델엔뷰로 바뀜
	public ModelAndView popup(int num){
		ModelAndView mav = new ModelAndView("checkpage/popup");
		System.out.println("num : "+num);
		SurveyVO v= sdao.getDetail(num);
		System.out.println("v :"+v.getSub());
		mav.addObject("v", v);
		return mav;
	}
	@RequestMapping(value="/popup2")
	public ModelAndView popup2(int num){
		ModelAndView mav = new ModelAndView("checkpage/popup2");
		SurveyVO v= sdao.getDetail(num);
		mav.addObject("v",v);
		return mav;
	}
	@RequestMapping(value="/popup3")
	public ModelAndView popup3(int num){
		ModelAndView mav = new ModelAndView("checkpage/popup3");
		SurveyVO v = sdao.getDetail(num);
		mav.addObject("v",v);
		return mav;
	}
	@RequestMapping(value="/popup4")
	public ModelAndView popup4(int num){
		ModelAndView mav = new ModelAndView("checkpage/popup4");
		SurveyVO v = sdao.getDetail(num);
		mav.addObject("v",v);
		return mav;
		
	}
	
}
