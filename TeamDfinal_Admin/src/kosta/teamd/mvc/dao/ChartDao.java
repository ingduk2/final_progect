package kosta.teamd.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.teamd.vo.ChartVO;

@Repository
public class ChartDao {
	
	@Autowired
	private SqlSessionTemplate template;
	
	public List<ChartVO> select(String year){
		return template.selectList("chart.selectall",year);
	}
}
