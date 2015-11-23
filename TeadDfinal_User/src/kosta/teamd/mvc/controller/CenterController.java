package kosta.teamd.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kosta.teamd.mvc.dao.CenterDao;
import kosta.teamd.mvc.service.urljson;
import kosta.teamd.vo.BoardVO;
import kosta.teamd.vo.CenterVO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


@Controller
public class CenterController {

	@Autowired
	private urljson myjson;
	@Autowired
	private CenterDao cdao;
	
	@RequestMapping(value="/admincenter")
	public String gocenter(){
		return "center/admincenter";
	}
	
	@RequestMapping(value="/insertcenter",method=RequestMethod.POST)
	public ModelAndView insertcenter(CenterVO vo){
		ModelAndView mav= new ModelAndView("redirect:/listcenter");
		System.out.println(vo.getCaddr());
		//먼저 주소를 변환한다.
		JSONObject jsonObject= new JSONObject();
		jsonObject = myjson.myJason(vo.getCaddr());
		//그 후에 리턴받아서 디비에 저장한다.
		//필요한거 뽑아서
		vo.setCxy(myjson.mock(jsonObject));
		
		cdao.insert(vo);
		//jsonObject.get(key)
		
		return mav;
	}
	
	@RequestMapping(value="/listcenter")
	public ModelAndView listcenter(BoardVO bvo){ //search 때무에 씀
		ModelAndView mav= new ModelAndView("center/map");
		
		List<CenterVO> list=cdao.list(bvo);
		//여기서 json으로 만들어서 보내줘얗ㄴ다
		mav.addObject("list",list);
		mav.addObject("sv",bvo.getSearchValue());
		mav.addObject("st",bvo.getSearchType());
		return mav;
		
	}
	
	//ajax!!
	@RequestMapping(value="jsoncenter")
	public ModelAndView jsoncenter(BoardVO bvo){
		ModelAndView mav= new ModelAndView("/center/jsonmap");
		List<CenterVO> list=cdao.list(bvo);
		
		JSONObject jsonObject = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		JSONObject map= null;
		for(CenterVO e: list){
			map=new JSONObject();
			map.put("title", e.getCname());
			map.put("latlng", e.getCxy());
			jsonArray.add(map);
		}
		
		jsonObject.put("aa", jsonArray);
		mav.addObject("json",jsonObject);
		return mav;
	}
	
}
