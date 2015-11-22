package kosta.teamd.mvc.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kosta.teamd.mvc.dao.ChartDao;
import kosta.teamd.vo.ChartVO;

@Controller
public class ChartController {
	
	@Autowired
	private ChartDao cdao;
	
	@RequestMapping(value="/chart")
	public ModelAndView chart(String year){
		ModelAndView mav= new ModelAndView("chart/chart");
		mav.addObject("year",year);
		return mav;
	}
	
	@RequestMapping(value="/chartdata")
	public ModelAndView chartdata(String year){
		ModelAndView mav= new ModelAndView("/chart/chartdata");
		
		ArrayList<Double> data= new ArrayList<>();
		
		List<ChartVO> list=cdao.select(year);
		for(ChartVO e:list){
			data.add(e.getA());
		}
		for(ChartVO e:list){
			data.add(e.getB());
		}
		for(ChartVO e:list){
			data.add(e.getC());
		}
		for(ChartVO e:list){
			data.add(e.getD());
		}
		
		//mav.addObject("data",data);
		int size=data.size();
		StringBuffer sb= new StringBuffer();
		for(int i=0; i<size; i++){
			sb.append(data.get(i));
			if(size-1!=i)sb.append(",");
		}
		System.out.println(sb.toString());
		mav.addObject("chdata",sb.toString());
		mav.addObject("sizev",data.size());
		return mav;
	}
}
