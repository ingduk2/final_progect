package kosta.teamd.mvc.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kosta.teamd.mvc.dao.CenterDao;
import kosta.teamd.mvc.service.Paging;
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
	
	@Autowired 
	private Paging page;
	
	@RequestMapping(value="/formCenter")
	public String formCenter(){
		return "center/admincenter";
	}
	
	@RequestMapping(value="/insertCenter",method=RequestMethod.POST)
	public ModelAndView insertCenter(CenterVO vo) throws UnsupportedEncodingException{
		
		
		ModelAndView mav= new ModelAndView("redirect:/selectallCenter");
		
		//먼저 주소를 변환한다.
		JSONObject jsonObject= new JSONObject();
		
		//시험해....
		//String str=param.replaceAll(" ", "%20");
		//jsonObject = myjson.myJason(vo.getCaddr().toString());
		jsonObject = myjson.myJason(vo.getCaddr());
		//myjson.mock(jsonObject);
		
//		System.out.println("주소 : " + vo.getCaddr());
		//그 후에 리턴받아서 디비에 저장한다.
		//필요한거 뽑아서
		vo.setCxy(myjson.mock(jsonObject));
		
		cdao.insert(vo);
		//jsonObject.get(key)
		
		return mav;
	}
	
	@RequestMapping(value="/selectallCenter")
	public ModelAndView selectallCenter(BoardVO bvo, @RequestParam(defaultValue="1") int nowPage){ //search 때무에 씀
		ModelAndView mav= new ModelAndView("center/map");
		System.out.println("SearchType : " +bvo.getSearchType());
		System.out.println("SearchValue : " + bvo.getSearchValue());
		int numPerPage = 5;
		int numPerBlock = 5;
		int start=(nowPage-1)* numPerPage+1;
		int end=start+ numPerPage-1;
		int cnt = cdao.cntCenter(bvo);
		int total = cnt;
		bvo.setStart(start);
		bvo.setEnd(end);
		List<CenterVO> list=cdao.list(bvo);
		System.out.println("크기 : "+ total);
		String url = "selectallCenter";
		StringBuffer param = new StringBuffer();
		String type =  bvo.getSearchType();
		if(type==null){
			param.append("&searchType=");
		}else{
			param.append("&searchType=");
			param.append(bvo.getSearchType()).append("&");
			param.append("searchValue=").append(bvo.getSearchValue());
		}
		page.Paging_D(total, nowPage, numPerPage, numPerBlock, url, param.toString());
		String paging = page.getPagingCode();
		//여기서 json으로 만들어서 보내줘얗ㄴ다
		
		for(CenterVO e : list){
			System.out.println("주소 : "+e.getCaddr());
			System.out.println("이름 : " +e.getCname());
			System.out.println("좌표 : "+ e.getCxy());
		}
		mav.addObject("page", paging);
		mav.addObject("list",list);
		mav.addObject("sv",bvo.getSearchValue());
		mav.addObject("st",bvo.getSearchType());
//		mav.addObject("nowPage", nowPage);
		return mav;
		
	}
	
	//ajax!!
	@RequestMapping(value="selectalljsonCenter")
	public ModelAndView selectalljsonCenter(BoardVO bvo){
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
	
	// 센터 선택 값 보기...
	@RequestMapping(value="getcxy", method=RequestMethod.POST)
	public ModelAndView mapcxy(String cxy){
		System.out.println("cxy : "+cxy);
		ModelAndView mav = new ModelAndView("/checkpage/cxyajax");
		mav.addObject("arr", cxy);
		return mav;
		
	}
	
}
