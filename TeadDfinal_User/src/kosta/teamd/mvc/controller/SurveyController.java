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
	
	@RequestMapping(value="surveyIn", method=RequestMethod.POST)
	public ModelAndView addSurvey(SurveyVO v){
		System.out.println("응?");
		ModelAndView mav = new ModelAndView();
		sdao.surveyAdd(v);
		mav.setViewName("checkpage/surveyDone");
		return mav;
	}
	
	@RequestMapping(value="surveyUpdate", method=RequestMethod.POST)
	public ModelAndView surveyUpdate(SurveyVO v){
		System.out.println("A:__________-"+v.getNum());
		System.out.println(v.getSurveychk());
		System.out.println(v.getSub1cnt());
		System.out.println("들어왔냐헤헷");
		sdao.surveyUpdate(v);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("checkpage/surveyDone"); //view 어디에 들어가게 하지...
		return mav;
	}
	
	
	
	//@RequestMapping(value="survey1", method=RequestMethod.POST)
//	public ModelAndView update1(int optradio){
//		System.out.println("survey1");
//		sdao.update1(optradio);
//		ModelAndView mav=new ModelAndView();
//		mav.setViewName("checkpage/surveyDone");
//		return mav;
//	
	@RequestMapping(value="surveyList")
	public ModelAndView list(){
		List<SurveyVO> list = sdao.surveyList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("surveyList"); // 뭐라고 쓸까....jsp만들어야 하는데..근데 나는 팝업인데...
		return mav;
	}
	
	@RequestMapping(value="surveyDetail")
	public ModelAndView surveyDetail(int num){
		SurveyVO v = sdao.getDetail(num);
		ModelAndView mav = new ModelAndView();
		mav.addObject("v",v);
		mav.setViewName("surveyDetail");
		return mav;
	}
	
	
	

	
	
	
	
	
	
	
	
	
//	@RequestMapping(value="survey", method=RequestMethod.POST)
//	public ModelAndView update(int optradio, HttpServletRequest request, SurveyLogVO  slogvo){
//		System.out.println("reip :"+request.getRemoteAddr());
//		System.out.println("survey"+optradio);
//		sdao.update(optradio);
//		sdao.insert(slogvo);
//		//여기다 인서트
//		//여기서 비교
//		
////		String check = sdao.insert(slogvo); //check가 아니라
//		String resMsg = "";
//		String ipaddr = slogvo.getSurip();
//		
//		if ( ipaddr == ipaddr) { //이거 맞는건가.... 
//			resMsg = "중복되는 아이피 입니다";
//		}
//		else {
//			resMsg = "투표가능한 아이피 입니다";
//		}
//		
//		ModelAndView mav = new ModelAndView("checkpage/ipchkres");
//		mav.addObject("resMsg", resMsg);
//		
//		return mav;
//	}
//		
////		ModelAndView mav=new ModelAndView();
////		mav.setViewName("checkpage/surveyDone");
////		return mav;
////		
////	}
//	
//	@RequestMapping(value="survey1", method=RequestMethod.POST)
//	public ModelAndView update1(int optradio){
//		System.out.println("survey1");
//		sdao.update1(optradio);
//		ModelAndView mav=new ModelAndView();
//		mav.setViewName("checkpage/surveyDone");
//		return mav;
//		
//	}
//
//	@RequestMapping(value="survey2", method=RequestMethod.POST)
//	public ModelAndView update2(int optradio){
//		sdao.update2(optradio);
//		ModelAndView mav=new ModelAndView();
//		mav.setViewName("checkpage/surveyDone");
//		return mav;
//		
//	}
//	
//	@RequestMapping(value="survey3", method=RequestMethod.POST)
//	public ModelAndView update3(int optradio){
//		sdao.update3(optradio);
//		ModelAndView mav=new ModelAndView();
//		mav.setViewName("checkpage/surveyDone");
//		return mav;
//		
//	}
//	
////	@RequestMapping(value="/ipchk")
////	public ModelAndView selectchkIp(String ip ){
////		
////		int check = sdao.ipCntCheck(ip);
////		System.out.println("check :"+check);
////		String resMsg = "";
////		
////		if (check == check) { //이거 맞는건가....
////			resMsg = "중복되는 아이피 입니다";
////		}
////		else {
////			resMsg = "투표가능한 아이피 입니다";
////		}
////		
////		ModelAndView mav = new ModelAndView("checkpage/ipchkres");
////		mav.addObject("resMsg", resMsg);
////		
////		return mav;
////	}
////		
////		@RequestMapping(value="insert", method=RequestMethod.POST)
////		public ModelAndView insert(IpVO ivo){
////			
////			sdao.insert(ivo);
////			ModelAndView mav = new ModelAndView("");
////			return mav;
////			
////		}
}
