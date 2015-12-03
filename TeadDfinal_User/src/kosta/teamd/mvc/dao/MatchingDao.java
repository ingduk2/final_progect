package kosta.teamd.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.teamd.vo.AnimalVO;

@Repository
public class MatchingDao {

	@Autowired
	private SqlSessionTemplate template;
	
	// 1차 _ 동물, 지역, 날짜 _ 리스트 
	public List<AnimalVO> machingdata(AnimalVO anivo) {
		return template.selectList("animal.machingdata", anivo);
	}
}
