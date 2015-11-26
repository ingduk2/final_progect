package kosta.teamd.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kosta.teamd.mvc.dao.AnimalDao;
import kosta.teamd.mvc.dao.AnimalsDao;
import kosta.teamd.vo.AniBoardVO;
import kosta.teamd.vo.AnimalsVO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class AnimalChart {

	
	@Autowired
	private AnimalsDao anisdao;
	
	@Autowired
	private AnimalDao anidao;
	
	// 아작스 
	@RequestMapping(value="animalcnt")
	public ModelAndView anispectes(){
	List<AnimalsVO> list=	anisdao.selectallCnt();
	
//	JSONArray jlist =  null;
//	JSONArray arr= new JSONArray();
//	for(AnimalsVO e: list){
//		jlist= new JSONArray();
//		jlist.add(e.getAnispecies());
//		jlist.add(e.getCnt());
//		System.out.println(jlist);
//		arr.add(jlist);
//	}
	JSONArray arr = new JSONArray();
	JSONObject jobj = null;
	for(AnimalsVO e : list){
		jobj = new JSONObject();
		jobj.put("name", e.getAnispecies());
		jobj.put("y", e.getCnt());
		jobj.put("drilldown", e.getAnispecies());
		System.out.println(jobj);
		arr.add(jobj);
	}
	

	
	ModelAndView mav =  new ModelAndView("/animaltest/anijson");
	System.out.println(arr.toString());
	mav.addObject("aniscnt", arr.toString());
	
		return mav;
	}
	
	// 차트 뷰
	@RequestMapping(value="testani")
	public ModelAndView formaniChart(){
		List<AniBoardVO> list = anidao.getImgList();
		List<AnimalsVO> anisvo  = anisdao.selectallCnt();
		System.out.println(list.size());
		System.out.println(anisvo.size());
		ModelAndView mav = new ModelAndView("animaltest/testanimal");
		mav.addObject("ablilst",list);
		mav.addObject("anisvo", anisvo);
		for(AnimalsVO e : anisvo){
		System.out.println(e.getCnt());
		System.out.println(e.getAnispecies());
		}
		return mav;
	}
}
