package kosta.teamd.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kosta.teamd.mvc.dao.BoardDao;
import kosta.teamd.vo.AniBoardVO;
import kosta.teamd.mvc.dao.SurveyDao;
import kosta.teamd.vo.BoardVO;
import kosta.teamd.vo.SurveyVO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class PageViewController {

	@Autowired
	private BoardDao bdao;
	@Autowired
	private SurveyDao sdao;
	
	@RequestMapping(value={"/", "/index"})
	public ModelAndView fromIndex(){
		
		List<BoardVO> minilist=bdao.mainMiniBoard();
		List<BoardVO> minilist2=bdao.mainMiniBoard2();
		
//		AniBoardVO maxreward=bdao.maxreward();
		
		List<AniBoardVO> mainminiimgboard1=bdao.mainMiniImgBoard1();
		List<AniBoardVO> mainminiimgboard2=bdao.mainMiniImgBoard2();
		
		ModelAndView mav=new ModelAndView("index");
		
		mav.addObject("minilist", minilist);
		mav.addObject("minilist2", minilist2);
		
//		mav.addObject("maxreward", maxreward);
		
		mav.addObject("mainminiimgboard1", mainminiimgboard1);
		mav.addObject("mainminiimgboard2", mainminiimgboard2);
		
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

	
	@RequestMapping(value="/randomreward")
	public ModelAndView randomreward(){
		ModelAndView mav=new ModelAndView("/checkpage/randomreward");
		AniBoardVO reward=bdao.randomreward();
		
		JSONArray ja=new JSONArray();
		JSONObject jo=new JSONObject();
		
		try {
			
			jo.put("anino", reward.getAnino());
			jo.put("bno", reward.getBno());
			jo.put("mid", reward.getMid());
			jo.put("aniimg", reward.getAniimg());
			jo.put("anireward", reward.getAnireward());
			ja.add(jo);
			
			
		} catch (Exception e) {
			
		}
		

		
		System.out.println(ja);
		mav.addObject("reward", ja);
		return mav;
	}
	
}
